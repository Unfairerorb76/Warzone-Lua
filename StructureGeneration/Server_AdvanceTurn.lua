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
            local terrMod = WL.TerritoryModification.Create(terrID);
            --CreateMarket(terrMod);
            --showMainConfig(terrMod);
            structures = {};
            structures[WL.StructureType.MercenaryCamp] = -1; 
          -- structures[WL.StructureType.Market] = 1;	
           terrMod.AddStructuresOpt = structures;
           addNewOrder(WL.GameOrderEvent.Create(terrSelected.OwnerPlayerID , 'Placeholder', {}, {terrMod}));
            print(1);
            end
        end
	end
end

function showMainConfig(terrMod)
    DestroyWindow();
    SetWindow("Main");

    local vert = CreateVert(GetRoot());

    CreateButton(vert).SetText("create a market").SetOnClick(CreateMarket).SetColor('#00FF8C'); 

end

function CreateMarket(terrMod)
    structures = {};
    structures[WL.StructureType.MercenaryCamp] = -1;
    structures[WL.StructureType.Market]	 = 1;				
    terrMod.AddStructuresOpt = structures;
    addNewOrder(WL.GameOrderEvent.Create({}, 'Placeholder', {}, {terrMod}));
end


function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

