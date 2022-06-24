require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)

	local terr = {};  --table of neutral territories
	local randomNeutralTerr; -- 
	
	print(game.ServerGame.Game.TurnNumber);
	print(Mod.Settings.TurnDoomsDay);
	

    
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
print(2);
	
if (Mod.Settings.EnableDoomsDay == true) then	
print(3);	
	if (game.ServerGame.Game.TurnNumber == Mod.Settings.TurnDoomsDay) then --doomsday time
		
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
			table.insert(terr, terrID);   --gets each territory ID of neutrals
		end
print(4);
		for times = 1, Mod.Settings.TerrSurvived do
                  
			local rand = math.random(#terr);
			local randomTerr = terr[rand]; --picks random territory to survive
			local terrMod = WL.TerritoryModification.Create(randomTerr);
			territory = game.ServerGame.LatestTurnStanding.Territories[randomTerr];
	
			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Territory Survived " .. game.Map.Territories[randomTerr].Name, nil, {terrMod}), true);
			table.remove(terr, rand);
		end
print(5);
		for terrID, terrObject in pairs(terr) do
		   		
			local rand = math.random(#terr);
			local randomTerr = terr[rand]; --picks random neutral then gives it too player	
			local terrMod = WL.TerritoryModification.Create(randomTerr);
			territory = game.ServerGame.LatestTurnStanding.Territories[randomTerr]
Print(rand);			
Print(randomTerr);
print(terrMod);

	
			terrMod.SetArmiesTo = 0;
			terrMod.SetOwnerOpt = WL.PlayerID.Neutral;
			
			addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, "Meteorstrike at " .. game.Map.Territories[randomTerr].Name, nil, {terrMod}), true);
			table.remove(terr, rand);
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

