function Server_GameCustomMessage(game, playerId, payload, setReturn)
local data = Mod.PublicGameData;
  --We need this if statement to ensure that the mod does not break if payload == nil
  if not payload then
      return;
  end
  
  --Need to get the payload type to find out what action to take
  if payload.type == "UpdatingCounter" then
    --Init variables
    count = payload.numStruct;
    print(count);
   --take away one from players total
    print(data.Counters[playerId]);
    data.Counters[playerId] = count - 1;
    print(data.Counters[playerId]);
    --input data to server
    Mod.PublicGameData = data;
    SetReturn(data.Counters[playerId]);  
  end

  if payload.type == "UpdatingMarkets" then
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
