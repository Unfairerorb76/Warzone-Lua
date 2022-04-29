require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
	
	-- testing only
	addNewOrder(WL.GameOrderCustom.Create(WL.PlayerID.Neutral, "testing", "test"), true)
	
	local terr = {};  --table of neutral territories
	local randomNeutralTerr;   
	
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
      			table.insert(terr, terrID)   --gets each territory ID of neutrals
			end
		end			

			
	for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(getTableLength(game.ServerGame.Game.PlayingPlayers) / #terr)) do
  		for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
			local rand = Math.random(#terr)
			local randomNeutralTerr = terr[rand]; --picks random neutral then gives it too player
			local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);
			terrMod.SetOwnerOpt=game.ServerGame.Game.PlayingPlayers.PlayerID;
--			terrMod.SetArmiesTo = game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies; -- you can leave this out, if this field is nill it will not change anything to the army count
			addNewOrder(WL.GameOrderEvent.Create(i,"new territory",{},{terrMod}), true);
			table.remove(terr, rand);
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
