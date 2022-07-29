require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
print(1);
  local terr = {}; --table of neutral territories
  local randomNeutralTerr; 	
  local Villages = WL.StructureType.MercenaryCamp;
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
		table.insert(terr, terrID);   --gets each territory ID of neutrals
			end
	
print(2);	
amountOfVillages = Mod.Settings.NumOfVillages

	for i = 1, amountOfVillages do
		local rand = math.random(#terr);
		local structures = 
	        local randomNeutralTerr = terr[rand];
		
		local terrMod = WL.TerritoryModification.Create(randomNeutralTerr); 
		end
print(3);
		standing.Territories[terr[rand]].Structures = structures;
		table.remove(terr, rand)
	return structure;
	end
	






function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

