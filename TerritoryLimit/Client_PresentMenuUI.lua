require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
  
  data = Mod.PublicGameData;
   Init(rootParent);  
   local vert = CreateVert(GetRoot());
  
   CreateLabel(vert).SetText('You currently hold ' .. data.TerrLimit .. 'territories').SetColor('#606060');
end
