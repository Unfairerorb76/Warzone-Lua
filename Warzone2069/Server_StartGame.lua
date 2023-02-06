require('UI');

function Server_StartGame(game, standing)
  local data = Mod.PublicGameData;
  data.Gullible = {};
  Mod.PublicGameData = data;
end
