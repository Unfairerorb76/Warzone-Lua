require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game)
	
      local neutralTerr = {};
for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
  if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
    neutralTerr[#neutralTerr+1] = terrID;
  end
end
for i=1,Mod.Settings.NumToConvert do
  randomNeutralTerr = neutralTerr[Math.random(#neutralTerr)];
  game.ServerGame.LatestTurnStanding.Territories[randomNeutralTerr].OwnerPlayerID = PlayerID;
end
	
end
