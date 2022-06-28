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
print(1);
	
if (Mod.Settings.EnableDoomsDay == true) then	
	
	if (game.ServerGame.Game.TurnNumber == Mod.Settings.TurnDoomsDay) then --doomsday time
		
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
			table.insert(terr2, terrID);   --gets each territory ID
                     

		end
print(2);
		for times = 1, Mod.Settings.TerrSurvived do
                  
			local rand = math.random(#terr2);
			local randomTerr = terr2[rand]; --picks random territory to survive
print(3);
			local terrMod = WL.TerritoryModification.Create(randomTerr);
print(4);
			territory = game.ServerGame.LatestTurnStanding.Territories[randomTerr];
print(4);
			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Territory Survived " .. game.Map.Territories[randomTerr].Name, nil, {terrMod}), true);
			table.remove(terr2, rand2);

		end

                for i = 1, #terr2 do

		   		
			local rand3 = math.random(#terr2);
			local randomTerr3 = terr2[rand3]; --picks random territory	
			local terrMod3 = WL.TerritoryModification.Create(randomTerr3);
			territory = game.ServerGame.LatestTurnStanding.Territories[randomTerr3]


	
			terrMod.SetArmiesTo = 0;
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
			
			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Meteorstrike at " .. game.Map.Territories[randomTerr3].Name, nil, {terrMod3}), true);
			table.remove(terr2, rand3);
		end
print(4);				
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

