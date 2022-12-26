require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)
data = Mod.PublicGameData;   

Init(rootParent);    
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

    showMenu(game);
    
end

function showMenu(game)

  DestroyWindow();
  SetWindow("Main");

  local vert = CreateVert(GetRoot());
  
  CreateLabel(vert).SetText('Convert your village to a new structure! Each structure has its own associated special unit that it can create.').SetColor('#606060');
  
    if data.Counters[game.Us.ID] > 0 then
  CreateLabel(vert).SetText('you currently have ' .. data.Counters[game.Us.ID] .. ' Villages to convert').SetColor('#606060')
  CreateButton(vert).SetText("Market").SetOnClick(showMarket).SetColor('#00FF8C');

  else
   CreateLabel(vert).SetText('Structures will be shown when you control at least one village that meeds converting').SetColor('#606060');
end			
end

function Market()
  DestroyWindow();
  SetWindow("FreeExpansion");

  local vert = CreateVert(GetRoot());

 CreateLabel(vert).SetText('The Market structure produces Capitalists, if the Capitalist is killed, it will reduce 10% of income that the opponent that killed it holds').SetColor('#606060');
 
 CreateButton(vert).SetText("Convert").SetOnClick(createMarket).SetColor('#00FF8C');
 CreateButton(GetRoot()).SetText("Return").SetOnClick(showMenu).SetColor('#94652E')
end

function createMarket()
data.Market[game.Us.ID] = data.Market[game.Us.ID] + 1;
data.Counters[game.Us.ID] = data.Counters[game.Us.ID] - 1;
showMain();
end
