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
        print(getTableLength(count[playerID]));
	for p, arr in pairs(count[playerID]) do
		if getTableLength(count[playerID]) > 1 then

			for p, arr in pairs(count[playerID]) do
			if game.ServerGame.LatestTurnStanding.Territories[arr].NumArmies.NumArmies < min then
				local PlayerTerr = game.ServerGame.LatestTurnStanding.Territories[arr];
				min = PlayerTerr.NumArmies.NumArmies;
			end
			end

			if PlayerTerr == nill then break; end
			local terrMod = WL.TerritoryModification.Create(PlayerTerr);
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
addNewOrder(WL.GameOrderEvent.Create(playerID,"removing territory",{}, terrMod), true);
        
			table.insert(list, terrMod);
			table.remove(arr, rand);
		end
	end
	if getTableLength(list) ~= nil then
print(2);
	--table.insert(pTable[playerID], WL.GameOrderEvent.Create(playerID,"removing territory",{}, list));

        --addNewOrder(WL.GameOrderEvent.Create(playerID,"removing territory",{}, list));
        
	end
        end 
	--local i = 1;
	--local addedOrders = true;
	--while addedOrders do
 	-- addedOrders = false;
 	-- for p, _  in pairs(game.Game.PlayingPlayers) do
           
    	--   if pTable[p][i] ~= nil then
     	 --  addedOrders = true;
       --    addNewOrder(pTable[p][i]);
    	--   end
	-- end
      --   i = i + 1;
	--end
	
	


end

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
