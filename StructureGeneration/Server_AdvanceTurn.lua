require('UI');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsAttack and orderResult.IsSuccessful then 
          local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

                if attackedTerr.Structures ~= nil then 
                    if attackedTerr.Structures[WL.StructureType.MercenaryCamp] ~= nil then -- there is a mercenary camp on the territory that was successfully attacked	
				
end end end end end   

function Server_AdvanceTurn_End(game, addNewOrder, rootParent)

    for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
	local terrSelected = game.ServerGame.LatestTurnStanding.Territories[terrID];
        if terrSelected.Structures ~= nil then
            if terrSelected.Structures[WL.StructureType.MercenaryCamp] ~= nil then --finds each territory ID of territories with a merc camp
            CreateMarket(terrID, terrSelected, addNewOrder); 
            end
           if terrSelected.Structures[WL.StructureType.Market] ~= nil then
             if (terrSelected.IsNeutral == false) then
              SpecialUnit(terrID, terrSelected, addNewOrder);
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

function SpecialUnit(terrID, terrSelected, addNewOrder)
local targetTerritoryID = tonumber(string.sub(order.Payload, 13));
print(string.sub(order.Payload, 13));
print(targetTerritoryID);
local targetTerritoryStanding = game.ServerGame.LatestTurnStanding.Territories[targetTerritoryID];		
if (targetTerritoryStanding.OwnerPlayerID ~= order.PlayerID) then			
return; --can only buy a priest onto a territory you control		
end
				
if (order.CostOpt == nil) then			
return; --shouldn't ever happen, unless another mod interferes		
end 
		
local costFromOrder = order.CostOpt[WL.ResourceType.Gold]; --this is the cost from the order. We can't trust this is accurate, as someone could hack their client and put whatever cost they want in there. Therefore, we must calculate it ourselves, and only do the purchase if they match		
local realCost = Mod.Settings.CostToBuyDiplomat; 		
if (realCost > costFromOrder) then			
return; --don't do the purchase if their cost didn't line up. This would only really happen if they hacked their client or another mod interfered		
end 

if (numDiplomatsAlreadyHave >= Mod.Settings.MaxDiplomats) then			
addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, 'Skipping Diplomat purchase since max is ' .. Mod.Settings.MaxDiplomats .. ' and you have ' .. numDiplomatsAlreadyHave));			
return; --this player already has the maximum number of Diplomats possible, so skip adding a new one.		
end 		

local DiplomatPower = Mod.Settings.DiplomatPower; 		
local builder = WL.CustomSpecialUnitBuilder.Create(order.PlayerID);		
builder.Name = 'Diplomat';		
builder.IncludeABeforeName = true;		
builder.ImageFilename = 'truce.png';		
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

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

