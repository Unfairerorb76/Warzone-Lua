require('Utilities');
require('WLUtilities');
require('distributeRandomStructures');

function Server_StartGame(game, standing)
	
distributeRandomStructures(standing, WL.StructureType.MercenaryCamp, 100, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false, allowConnectedTerrs = false, mapDetails = game.Map});
end
