require('UI');
function Server_AdvanceTurn_End(game, addNewOrder)

	list = {};
	count = {};
	for p, _ in pairs(game.Game.PlayingPlayers) do
		count[p] = {};
	end

	for playerID, _ in pairs(game.Game.PlayingPlayers) do
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
		if (game.ServerGame.LatestTurnStanding.Territories[terrID].OwnerPlayerID == playerID) then
			table.insert(count[game.ServerGame.LatestTurnStanding.Territories[terrID].OwnerPlayerID], terrID);
		end
	end
	print(getTableLength(count[playerID]));
	print(count);
	end
	
end

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
