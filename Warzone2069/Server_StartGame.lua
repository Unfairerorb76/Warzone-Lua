require('UI');

function Server_StartGame(game, standing)
  local data = Mod.PublicGameData;
  data.Gullible = {};
  for p, _ in pairs(game.Game.PlayingPlayers) do
    data.Gullible[p] = 0;
  end
  Mod.PublicGameData = data;
end
