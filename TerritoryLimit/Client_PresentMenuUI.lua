require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
local count = 0;
Init(rootParent);   

  if game.Us == nil then
       return; 
    end
    
    
 for _, terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
     if terr.OwnerPlayerID == game.Us.ID then
        count = count + 1;
     end
 end
 
 
  local vert = CreateVert(GetRoot());
  local horz = CreateHorz(GetRoot());
  CreateLabel(vert).SetText('The amount of territories you currently hold is: ' .. count).SetColor('#FFAF56');

end
