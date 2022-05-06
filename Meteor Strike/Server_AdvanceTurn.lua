require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)

	local terr = {};  --table of neutral territories
	local randomNeutralTerr; -- 

	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
		table.insert(terr, terrID);   --gets each territory ID of neutrals
	end

	for times = 1, Mod.Settings.NumOfStrikes do

		local rand = math.random(#terr);
		local randomNeutralTerr = terr[rand]; --picks random neutral then gives it too player
		local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);
		territory = game.ServerGame.LatestTurnStanding.Territories[randomNeutralTerr]

		terrMod.SetArmiesTo = math.max(0,(territory.NumArmies.NumArmies - Mod.Settings.ArmiesKilled));
		
		if (territory.OwnerPlayerID ~= WL.PlayerID.Neutral and terrMod.SetArmiesTo == 0) then 
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
		end
		
		addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Meteor Strike at " .. game.Map.Territories[randomNeutralTerr].Name, nil, {terrMod}), true);
	end	
end	--last end for the function	

 

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

