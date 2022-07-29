require('Utilities');
require('WLUtilities');

function Server_StartGame(game, standing)
	local privateGameData = Mod.PrivateGameData
	privateGameData.portals = {}
	territoryArray = {}

	local count = 1
	for _, territory in pairs(game.Map.Territories) do
		territoryArray[count] = territory
		count = count + 1
	end  -- territory array

	-- Check that the map has enough territories, if not then it only creates one village
	local NumOfVillages = Mod.Settings.NumOfVillages  
	if (#territoryArray < Mod.Settings.NumOfVillages) then
		NumOfVillages = 1 
	end

	structure = {}
	Villages = WL.StructureType.MercenaryCamp
	structure[Villages] = 0

	for i = 1, NumOfVillages do
		privateGameData.portals[i] = getRandomTerritory(territoryArray)
		
			structure[Villages] = structure[Villages]
		

		standing.Territories[privateGameData.portals[i]].Structures = structure
	end

	Mod.PrivateGameData = privateGameData
end

function getRandomTerritory(territoryArray)
	local index = math.random(#territoryArray)
	local territoryID = territoryArray[index].ID
	table.remove(territoryArray, index)

	return territoryID
end
