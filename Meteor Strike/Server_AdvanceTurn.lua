require('Utilities');
require('WLUtilities');
function Server_AdvanceTurn_Start(game,addOrder)
  --empty
end

function Server_AdvanceTurn_Order(game,gameOrder,gameOrderResult,skipOrder,addOrder)
  --empty
end

function Server_AdvanceTurn_End(game, addNewOrder)
  print(1);
	local terr = {};  --table of neutral territories
	local randomNeutralTerr; -- 
  print(2);
  print(Mod.Settings.NumOfStrikes);

		for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
      			table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
		end			
		for times = 1, Mod.Settings.NumOfStrikes do
	              print(Mod.Settings.NumOfStrikes)
			
			local rand = math.random(#terr);
			local randomNeutralTerr = terr[rand]; --picks random neutral then gives it too player
			local terrMod = WL.TerritoryModification.Create(randomNeutralTerr);   
                     print(Mod.Settings.ArmiesKilled);
         		terrMod.SetArmiesTo = max(0,(territory.NumArmies.NumArmies - Mod.Settings.ArmiesKilled)); 
				addNewOrder(WL.GameOrderEvent.Create(i,"meteor strike",{},{terrMod}), true);
				table.remove(terr, rand);
	            print(addNewOrder);
		end	
			

 

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

