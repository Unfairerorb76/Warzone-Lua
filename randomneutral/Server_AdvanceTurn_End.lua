require('Utilities');
require('WLUtilities');

function Server_EndTurn_Order(game, order, result, skipThisOrder, addNewOrder)
	
local terr = {};
	
for i=1,Mod.Settings.NumToConvert do
		
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
  if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
    terr[#terr+1] = terrID;
  end
end			
		
     randomNeutralTerr = terr[Math.random(#terr)];
	terrMod = WL.TerritoryModification.Create(randomNeutralTerr);
	terrMod.SetOwnerOpt=order.PlayerID
	terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
	addNewOrder(WL.GameOrderEvent.Create(terr.OwnerPlayerID,"new territory",{},{terrMod}));
		
end
end
