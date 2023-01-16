function Server_GameCustomMessage(game, playerId, payload, setReturn)
local data = Mod.PublicGameData;
--Need to get the payload type to find out what action to take
 
  if payload.Type == "UpdatingCounter" then
    Count = payload.numStruct;
    if not payload then
      setReturn(data.Counters[playerId]);
      return;
    else
      data.Counters[playerId] = Count - 1;
    end
  Mod.PublicGameData = data;
  SetReturn(data.Counters[playerId]);  
  end

  if payload.Type == "UpdatingMarkets" then
   --Init variables
    numMarket = payload.numStruct;
   -- We need this if statement to ensure that the mod does not break if payload == nil
    if not payload then
      setReturn(data.Markets[playerId]);
      return;
    else
    --Add one to players Market total 
      data.Markets[playerId] = numMarket + 1;
    end
    --need to input the data to server and end function
  Mod.PublicGameData = data;
  setReturn(data.Markets[playerId]);
  end
  --Next type to go below with an elseif instead of the end above
end
