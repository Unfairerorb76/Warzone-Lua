require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)

	local terr = {};  --table of neutral territories
	local terr2 = {}; 
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

	
if (Mod.Settings.EnableDoomsDay == true) then	
	
	if (game.ServerGame.Game.TurnNumber == Mod.Settings.TurnDoomsDay) then --doomsday time
		
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
			table.insert(terr2, terrID);   --gets each territory ID
                     

		end

		for times = 1, Mod.Settings.TerrSurvived do
                  
			local rand2 = math.random(#terr2);
			local randomTerr2 = terr2[rand]; --picks random territory to survive

			local terrMod2 = WL.TerritoryModification.Create(randomTerr2);
			territory2 = game.ServerGame.LatestTurnStanding.Territories[randomTerr2];

			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Territory Survived " .. game.Map.Territories[randomTerr2].Name, nil, {terrMod2}), true);
			table.remove(terr2, rand2);
 ;
		end

		for terrID, terrObject in pairs(terr2) do
		   		
			local rand3 = math.random(#terr2);
			local randomTerr3 = terr2[rand3]; --picks random territory	
			local terrMod3 = WL.TerritoryModification.Create(randomTerr3);
			territory3 = game.ServerGame.LatestTurnStanding.Territories[randomTerr3]


	
			terrMod.SetArmiesTo = 0;
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
			
			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Meteorstrike at " .. game.Map.Territories[randomTerr3].Name, nil, {terrMod3}), true);
			table.remove(terr2, rand3);
		end
				
	end -- apocolypse time	
		
		
		
end
		
end	--last end for the function	

 

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

