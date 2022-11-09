require('Utilities');
require('WLUtilities');
require('distributeRandomStructures');
require('distributeRandomStructures2');

function Server_StartGame(game, standing)

	local count = 0;
	for cardID, _ in pairs(game.Settings.Cards) do
        count = count + 1;
    end
	
distributeRandomStructures(standing, WL.StructureType.MercenaryCamp, 100, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false, allowConnectedTerrs = false, mapDetails = game.Map});
if count > 0 then
distributeRandomStructures2(standing, WL.StructureType.ResourceCache, Mod.Settings.NumOfRCaches, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false});
end
distributeRandomStructures2(standing, WL.StructureType.ArmyCache, Mod.Settings.NumOfACaches, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false});
	
end

function getRandomTerritory(territoryArray)
	local index = math.random(#territoryArray)
	local territoryID = territoryArray[index].ID
	table.remove(territoryArray, index)

	return territoryID
end
