require('Utilities');
require('WLUtilities');

function Server_EndTurn_Order(game, order, result, skipThisOrder, addNewOrder)
	
      local neutralTerr = {};
for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
  if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
    neutralTerr[#neutralTerr+1] = terrID;
  end
end
for i=1,Mod.Settings.NumToConvert do
		
		local terr = game.ServerGame.LatestTurnStanding.Territories[order.To];
			terrMod = WL.TerritoryModification.Create(terr.ID);
			terrMod.SetOwnerOpt=terr.OwnerPlayerID;
			terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
			addNewOrder(WL.GameOrderEvent.Create(terr.OwnerPlayerID,"new territory",{},{terrMod}));
		
  randomNeutralTerr = neutralTerr[Math.random(#neutralTerr)];
  game.ServerGame.LatestTurnStanding.Territories[randomNeutralTerr].OwnerPlayerID = PlayerID;
end
	
end


local terr = game.ServerGame.LatestTurnStanding.Territories[order.To];
			terrMod = WL.TerritoryModification.Create(terr.ID);
			terrMod.SetOwnerOpt=terr.OwnerPlayerID;
			terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
			addNewOrder(WL.GameOrderEvent.Create(terr.OwnerPlayerID,"new territory",{},{terrMod}));
