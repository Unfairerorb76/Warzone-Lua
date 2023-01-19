require('UI');

function Server_StartGame(game, standing)
local data = Mod.PublicGameData;
  
data.TerrLimit = {};
for p, _ in pairs(game.Game.PlayingPlayers) do
 data.TerrLimit[p] = 0;
end
  
Mod.PublicGameData = data;
end
