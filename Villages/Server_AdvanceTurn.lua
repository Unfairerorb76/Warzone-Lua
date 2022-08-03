require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)

     local terr = {};


      for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID) AND ( then
			
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
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

