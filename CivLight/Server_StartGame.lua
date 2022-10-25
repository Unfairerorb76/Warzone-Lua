require('Utilities');
require('WLUtilities');
require('distributeRandomStructures');
require('distributeRandomStructures2');

function Server_StartGame(game, standing)
distributeRandomStructures2(standing, WL.StructureType.ArmyCache, Mod.Settings.NumOfACaches, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false});
distributeRandomStructures(standing, WL.StructureType.MercenaryCamp, 100, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false, allowConnectedTerrs = false, mapDetails = game.Map});

	
end

function getRandomTerritory(territoryArray)
	local index = math.random(#territoryArray)
	local territoryID = territoryArray[index].ID
	table.remove(territoryArray, index)

	return territoryID
end
