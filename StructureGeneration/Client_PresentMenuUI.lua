require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
    init(rootParent);    
    setMaxSize(500, 400);
    setSize = setMaxSize;

    if game.Us == nil then
       return; 
    end
    if game.Game.TurnNumber < 1 then	
       UI.Alert("This mod cannot be used in the distribution turn");		
       close();		
       return;	
    end	 
    
    showMenu();
end

function showMenu();

  DestroyWindow();
  SetWindow("Main");

  local vert = CreateVert(GetRoot());
  
  CreateLabel(vert).SetText('Convert your village to a new structure! Each structure has its own associated special unit that it can create.').SetColor('#606060');

  CreateButton(vert).SetText("Market").SetOnClick(showMarket).SetColor('#00FF8C'); 			
end
