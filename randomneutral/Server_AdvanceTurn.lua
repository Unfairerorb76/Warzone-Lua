require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
   
	local terr = {};  --table of neutral territories
	local randomNeutralTerr;   
        local nonDistArmies = Game.Settings.InitialNonDistributionArmies;
	If (Mod.Settings.OnlyBaseNeutrals == false) do
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
			
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		end			

			
		for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(#terr / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
			print(times);
  			for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
				print(4);
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
If (Mod.Settings.OnlyBaseNeutrals == true) do	
		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
    		if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
		     if (NumArmies == nonDistArmies) then

      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		end			
			
		for times = 1, math.min(Mod.Settings.NumToConvert, math.floor(#terr / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
			print(times);
  			for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do
				print(4);
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
end


function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
