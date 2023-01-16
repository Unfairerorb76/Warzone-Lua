require("UI");

function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)  

Game = game;
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
   data = Mod.PublicGameData;
print(data.Counters[Game.Us.ID]);
    
    local vert = CreateVert(GetRoot());
     CreateLabel(vert).SetText('This is the main menu screen, select the buttons below related on what you want to do.').SetColor('#606060');
    CreateButton(vert).SetText("build").SetOnClick(build).SetColor('#00FF8C');
    CreateButton(vert).SetText("information").SetOnClick(build).SetColor('#00FF8C');
end

function buildMenu(game)
 
  DestroyWindow();
  SetWindow("build");
  
  local vert = CreateVert(GetRoot());
  
  CreateLabel(vert).SetText('Convert your village to a new structure! Each structure has its own associated special unit that it can create.').SetColor('#606060');
  
    if data.Counters[game.Us.ID] > 0 then
  CreateLabel(vert).SetText('you currently have ' .. data.Counters[game.Us.ID] .. ' Villages to convert.');
  CreateButton(vert).SetText("Market").SetOnClick(showMarket).SetColor('#00FF8C');
    
  else
    
   CreateLabel(vert).SetText('Structures will be shown when you control at least one village that meeds converting.').SetColor('#606060');
end			
end

function showMarket()
  DestroyWindow();
  SetWindow("Market");

  local vert = CreateVert(GetRoot());

 CreateLabel(vert).SetText('The Market structure produces Capitalists, if the Capitalist is killed, it will reduce 10% of income that the opponent that killed it holds').SetColor('#606060');
 
 CreateButton(vert).SetText("Convert").SetOnClick(createMarket).SetColor('#00FF8C');
 CreateButton(GetRoot()).SetText("Return").SetOnClick(menuReturn).SetColor('#94652E');
end

function createMarket()    
Game.SendGameCustomMessage('Updating Markets', {type = "UpdatingMarkets", numStruct = data.Markets[Game.Us.ID]}, function(UpdateMarket) 
                                                                                                                                       showMenu(Game); end);   
end

function menuReturn()
showMenu(Game);
end
