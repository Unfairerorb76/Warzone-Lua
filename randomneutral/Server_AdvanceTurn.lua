require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game)
	
      local neutralTerr = {};
for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
  if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
    neutralTerr[#neutralTerr+1] = terrID;
  end
end

	
end
