require('UI');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsAttack and orderResult.IsSuccessful then 
          local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

                if attackedTerr.Structures ~= nil then 
                    if attackedTerr.Structures[WL.StructureType.MercenaryCamp] ~= nil then -- there is a mercenary camp on the territory that was successfully attacked
				
end end end end 

if (order.proxyType == 'GameOrderCustom' and startsWith(order.Payload, 'GetCapitalist_') ) then

--print(tonumber(string.sub(order.Payload, 13)));
--print(tonumber(order.Payload))
  local terrID = tonumber(string.sub(order.Payload, 13));
  SpecialUnit(terrID, addNewOrder, order, game); 
end
end   

function Server_AdvanceTurn_End(game, addNewOrder, rootParent)
    
    for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
	local terrSelected = game.ServerGame.LatestTurnStanding.Territories[terrID];
        if terrSelected.Structures ~= nil then
            if (terrSelected.Structures[WL.StructureType.MercenaryCamp] ~= nil) and (terrSelected.IsNeutral == false) then --finds each territory ID of territories with a merc camp
            CreateMarket(terrID, terrSelected, addNewOrder); 
            end
           if terrSelected.Structures[WL.StructureType.Market] ~= nil then
             if (terrSelected.IsNeutral == false) then
              local data = tostring(terrID);
              print(data);
             addNewOrder(WL.GameOrderCustom.Create(terrSelected.OwnerPlayerID, 'custom order', 'GetCapitalist_' .. data , {}));
            -- SpecialUnit(terrID, terrSelected, addNewOrder);
             
           			
             end
           end
        end
     end
end

function showMainConfig(terrMod, terrSelected)
    DestroyWindow();
    SetWindow("Main");

    local vert = CreateVert(GetRoot());

    CreateButton(vert).SetText("create a market").SetOnClick(CreateMarket).SetColor('#00FF8C'); 

end

function CreateMarket(terrID, terrSelected, addNewOrder)
    local terrMod = WL.TerritoryModification.Create(terrID);
    structures = {};
    structures[WL.StructureType.MercenaryCamp] = -1; 
    structures[WL.StructureType.Market] = 1;	
    terrMod.AddStructuresOpt = structures;
    addNewOrder(WL.GameOrderEvent.Create(terrSelected.OwnerPlayerID , 'Placeholder', {}, {terrMod}));
end


function SpecialUnit(terrID, addNewOrder, order, game)

local terrSelected = game.ServerGame.LatestTurnStanding.Territories[terrID];
local targetTerritoryID = terrID;		 		 		

local numDiplomatsAlreadyHave = 0;		
for _,ts in pairs(game.ServerGame.LatestTurnStanding.Territories) do			
if (ts.OwnerPlayerID == order.PlayerID) then				
numDiplomatsAlreadyHave = numDiplomatsAlreadyHave + UnitCount(ts.NumArmies, 'Capitalist');			
end		
end 	
	
if (numDiplomatsAlreadyHave >= 5) then			
addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, 'Skipping Diplomat purchase since max is 5'));			
return; --this player already has the maximum number of Diplomats possible, so skip adding a new one.
end
		
local builder = WL.CustomSpecialUnitBuilder.Create(terrSelected.OwnerPlayerID);		
builder.Name = 'Capitalist';		
builder.IncludeABeforeName = true;		
builder.ImageFilename = 'piggy-bank.png';		
builder.AttackPower = 1;		
builder.DefensePower = 1;		
builder.CombatOrder = 1234; --defends commanders		
builder.DamageToKill = 1;		
builder.DamageAbsorbedWhenAttacked = 1;		
builder.CanBeGiftedWithGiftCard = true;		
builder.CanBeTransferredToTeammate = true;		
builder.CanBeAirliftedToSelf = true;		
builder.CanBeAirliftedToTeammate = true;		
builder.IsVisibleToAllPlayers = false;			
local terrMod = WL.TerritoryModification.Create(targetTerritoryID);		
terrMod.AddSpecialUnits = {builder.Build()};				

addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, 'Purchased a Diplomat', {}, {terrMod}));		

end

function UnitCount(armies, name)
local ret = 0;	
 for _,su in pairs(armies.SpecialUnits) do		
  if (su.proxyType == 'CustomSpecialUnit' and su.Name == name) then			
   ret = ret + 1;		
  end	
 end	
return ret;
end

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

