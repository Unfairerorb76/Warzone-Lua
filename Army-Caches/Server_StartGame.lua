require('Utilities');
require('WLUtilities');

function Server_StartGame(game, standing)
print(10);
	local privateGameData = Mod.PrivateGameData
	privateGameData.portals = {}
	territoryArray = {}
print(1);
	local count = 1
	--for _, territory in pairs(game.Map.Territories) do
        for _, territory in pairs(standing.Territories) do
      if (territory.OwnerPlayerID == WL.PlayerID.Neutral) then
		territoryArray[count] = territory
		count = count + 1
          end 
	end  -- territory array
print(2);
	-- Check that the map has enough territories, if not then it only creates one village
	local NumOfACaches = Mod.Settings.NumOfACaches  
	if (#territoryArray < Mod.Settings.NumOfACaches) then
		NumOfACaches = 1 
	end
print(3);
	structure = {}
	ArmyCaches = WL.StructureType.ArmyCache
	structure[ArmyCaches] = 0

	for i = 1, NumOfACaches do
		privateGameData.portals[i] = getRandomTerritory(territoryArray)
		
			structure[ArmyCaches] = 1

		standing.Territories[privateGameData.portals[i]].Structures = structure
	end
print(4);
	Mod.PrivateGameData = privateGameData
end

function getRandomTerritory(territoryArray)
	local index = math.random(#territoryArray)
	local territoryID = territoryArray[index].ID
	table.remove(territoryArray, index)

	return territoryID
end
