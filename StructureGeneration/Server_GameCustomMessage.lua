function Server_GameCustomMessage(game, playerId, payload, setReturn)
local data = Mod.PublicGameData;
  --We need this if statement to ensure that the mod does not break if payload == nil
  if not payload then
      return;
    else
  
  --Need to get the payload type to find out what action to take
  if payload.Type == "UpdatingCounter" then
    --Init variables
    count = payload.numStruct;
   --take away one from players total
    data.Counters[playerId] = count - 1;
    --input data to server
    Mod.PublicGameData = data;
    SetReturn(data.Counters[playerId]);  
  end

  if payload.Type == "UpdatingMarkets" then
    --Init variables
    numMarket = payload.numStruct;   
    --Add one to players Market total 
    data.Markets[playerId] = numMarket + 1;
    --need to input the data to server and end function
    Mod.PublicGameData = data;
    setReturn(data.Markets[playerId]);
  end
  --Next type to go below with an elseif instead of the end above
end
