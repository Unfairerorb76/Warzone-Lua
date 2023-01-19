require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
  
  data = Mod.PublicGameData;
   Init(rootParent);  
   local vert = CreateVert(GetRoot());
  
    if game.Us == nil then
       return; 
    end
  if data.TerrLimit[game.Us.ID] ~= nil then
   CreateLabel(vert).SetText('You currently hold ' .. data.TerrLimit[game.Us.ID] .. 'territories').SetColor('#FFAF56');
  else
    return;
  end
end
