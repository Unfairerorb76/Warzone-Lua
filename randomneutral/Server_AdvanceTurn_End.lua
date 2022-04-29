require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
	
local terr = {};  --table of neutral territories
local randomNeutralTerr;   
	
for i=1,Mod.Settings.NumToConvert do
		
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
  if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
    table.insert(terr, terrID)
  end
end			
		
     randomNeutralTerr = terr[Math.random(#terr)];
	terrMod = WL.TerritoryModification.Create(randomNeutralTerr);
	terrMod.SetOwnerOpt=game.ServerGame.Game.PlayingPlayers.PlayerID;
	terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
	addNewOrder(WL.GameOrderEvent.Create(terr.OwnerPlayerID,"new territory",{},{terrMod}));
		
end
end
