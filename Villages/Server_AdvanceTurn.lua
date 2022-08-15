require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)

     local terr = {};
      local structures = game.ServerGame.LatestTurnStanding.Territories[order.To].Structures;
      local count = 0;


      for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID) AND (structures = WL.StructureType.MercenaryCamp) then
			
      			table.insert(terr, terrID);   --gets each territory ID of controlled camps
                         print(terr);
                         count = count + 1;
		end
	end

      for times = 1, math.min(count, math.floor(#terr / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
	
	for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do

           

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

