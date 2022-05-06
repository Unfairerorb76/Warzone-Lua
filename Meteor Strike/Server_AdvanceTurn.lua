require('Utilities');
require('WLUtilities');


function Server_AdvanceTurn_End(game, addNewOrder)
  print(1);
	local terr = {};  --table of neutral territories
	local randomNeutralTerr; -- 
  print(2);
  

		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		
		
for times = 1, Mod.Settings.NumOfStrikes do


	
			
			local rand = math.random(#terr);
			local randomNeutralTerr = terr[rand]; --picks random neutral then gives it too player
                         territory = game.ServerGame.LatestTurnStanding.Territories[randomNeutralTerr]
			local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);   
                     
		    
		    
         		terrMod.SetArmiesTo = math.max(0,(territory.NumArmies.NumArmies - Mod.Settings.ArmiesKilled));
                      print(1);
				addNewOrder(WL.GameOrderEvent.Create("meteor strike",{},{terrMod}));
		      print(2);	
                            table.remove(terr, rand);
                      print(3);
		end	
	end		

 

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

