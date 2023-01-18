require('UI');
function Server_AdvanceTurn_End(game, addNewOrder)

	list = {};
	count = {};
	local pTable = {};

	for p, _ in pairs(game.Game.PlayingPlayers) do
		count[p] = {};
		pTable[p] = {};
	end

	for playerID, _ in pairs(game.Game.PlayingPlayers) do
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
		if (game.ServerGame.LatestTurnStanding.Territories[terrID].OwnerPlayerID == playerID) then
			table.insert(count[game.ServerGame.LatestTurnStanding.Territories[terrID].OwnerPlayerID], terrID);
		end
	end
        local min = 9999;
	for p, arr in pairs(count[playerID]) do
		if getTableLength(count[playerID]) > 10 then
			
			for p, arr in pairs(count[playerID]) do
			if game.ServerGame.LatestTurnStanding.Territories[arr].NumArmies.NumArmies < min then
				local PlayerTerr = game.ServerGame.LatestTurnStanding.Territories[arr];
				min = PlayerTerr.NumArmies.NumArmies;
			end
			end
			if PlayerTerr == nill then break; end
			local terrMod = WL.TerritoryModification.Create(PlayerTerr);
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
			table.insert(list, terrMod);
			table.remove(arr, rand);
		end
	end
	print(list);
	print(pTable[playerID]);
	if getTableLength(list) ~= nil then
	table.insert(pTable[playerID], WL.GameOrderEvent.Create(playerID,"new territory",{}, list));
	end 
	local i = 1;
	local addedOrders = true;
	while addedOrders do
 	 addedOrders = false;
 	 for p, _  in pairs(game.Game.PlayingPlayers) do
    	   if pTable[p][i] ~= nil then
     	   addedOrders = true;
           addNewOrder(pTable[p][i]);
    	   end
	 end
         i = i + 1;
	end
	end
	


end

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
