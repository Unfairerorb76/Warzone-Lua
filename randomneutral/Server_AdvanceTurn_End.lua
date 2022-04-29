require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
	
local terr = {};  --table of neutral territories
local randomNeutralTerr;   
	
for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
 if #terr > 0 then  --gets the amount of alive players
			
for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(--[[amount of alive players here]]-- / #terr)) do
  for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
    if #terr > 0 then	--makes sure there is enough for each player	
			
  for i=1,Mod.Settings.NumToConvert do --gets number to convert from host

			
	  for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
      table.insert(terr, terrID)   --gets each territory ID of neutrals
    end
  end			
		
      randomNeutralTerr = terr[Math.random(#terr)]; --picks random neutral then gives it too player
	terrMod = WL.TerritoryModification.Create(randomNeutralTerr);
	terrMod.SetOwnerOpt=game.ServerGame.Game.PlayingPlayers.PlayerID;
	terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
	addNewOrder(WL.GameOrderEvent.Create(terr.OwnerPlayerID,"new territory",{},{terrMod}));
	end	
							
    end
  end
 end
end
