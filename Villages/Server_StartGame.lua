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
	end

	-- Check that the map has enough territories, else make the minimum number of portals
	local NumOfVillages = Mod.Settings.NumOfVillages
	if (#territoryArray < Mod.Settings.NumOfVillages * 2) then
		NumOfVillages = 1
	end

	structure = {}
	Villages = WL.StructureType.MercenaryCamp
	structure[Villages] = 0

	for i = 1, NumOfVillages * 2 do
		privateGameData.portals[i] = getRandomTerritory(territoryArray)
		if (i % 2 == 1) then
			structure[Portals] = structure[Portals] + 1
		end

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
