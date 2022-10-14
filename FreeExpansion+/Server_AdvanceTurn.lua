function Server_AdvanceTurn_End(game, addNewOrder)
   
	local terr = {};  --table of neutral territories
	local terr2 = {};
	local randomNeutralTerr;   
        local nonDistArmies = game.Settings.InitialNonDistributionArmies;
  
if (Mod.Settings.OnlyBaseNeutrals == nil) then
      Mod.Settings.OnlyBaseNeutrals = false; end
	

if (Mod.Settings.OnlyBaseNeutrals == false) then
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID ~= WL.PlayerID.Neutral) then
		        print(1);
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		end			
			
		
		
	for _, terrID in pairs(terr) do
		if (game.ServerGame.LatestTurnStanding.Territories[terrID].IsNeutral == false) then
 		 for connID, _ in pairs(game.Map.Territories[terrID].ConnectedTo) do
					print(connID);
			if (game.ServerGame.LatestTurnStanding.Territories[connID].OwnerPlayerID == WL.PlayerID.Neutral) then
						print(connID);
				print(2);
				table.insert(terr2, connID);
			end
	end end end
		
	
		for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(#terr2 / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
		    if (game.ServerGame.LatestTurnStanding.Territories[terr2].OwnerPlayerID == WL.PlayerID.Neutral) then
  			for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
		                   	
				local rand = math.random(#terr2);
				local randomNeutralTerr = terr2[rand]; --picks random neutral then gives it too player
				if randomNeutralTerr == nill then break; end
				local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);   

				terrMod.SetOwnerOpt = i;
         		terrMod.SetArmiesTo = Mod.Settings.SetArmiesTo; -- you can leave this out, if this field is nill it will not change anything to the army count
				addNewOrder(WL.GameOrderEvent.Create(i,"new territory",{},{terrMod}), true);
				table.remove(terr2, rand);
			end	
		end end	

    
	

 if (Mod.Settings.OnlyBaseNeutrals == true) then
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
		     if (territory.NumArmies.NumArmies == nonDistArmies) then
         
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		end
	end end
	print(Mod.Settings.NumToConvert);		
		for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(#terr / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
			
  			for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
				
				local rand = math.random(#terr);
				local randomNeutralTerr = terr[rand]; --picks random neutral then gives it too player
				if randomNeutralTerr == nill then break; end
				local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);   

				terrMod.SetOwnerOpt = i;
         		terrMod.SetArmiesTo = Mod.Settings.SetArmiesTo; -- you can leave this out, if this field is nill it will not change anything to the army count
				addNewOrder(WL.GameOrderEvent.Create(i,"new territory",{},{terrMod}), true);
				table.remove(terr, rand);
			end	
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
