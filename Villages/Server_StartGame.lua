function Server_StartGame(game, addNewOrder)
print(1);
  local terr = {}; --table of neutral territories
  local randomNeutralTerr; 	
   
	for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do	
		table.insert(terr, terrID);   --gets each territory ID of neutrals
	end
	
print(2);	
amountOfVillages = Mod.Settings.NumOfVillages

	for i = 1, amountOfVillages do
		local rand = math.random(#terr);
		local structures = standing.Territories[Terr[rand]].Structures;
		if structures == nil then 
			structures = {}; 
			structures[structure] = 1;
		else
			if structures[structure] == nil then
				structures[structure] = 1;
			else
				structures[structure] = structures[structure] + 1;
			end
		end
print(3);
		standing.Territories[terr[rand]].Structures = structures;
		table.remove(terr, rand)
	end
	return structure;
	

end -- end of function

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
