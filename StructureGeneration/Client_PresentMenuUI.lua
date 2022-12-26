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
