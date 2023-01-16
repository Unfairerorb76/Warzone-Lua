function Server_GameCustomMessage(game, playerId, payload, setReturn)
data = Mod.PublicGameData;
  --We need this if statement to ensure that the mod does not break if payload == nil
  if not payload then
      return;
  end

  if payload.type == "UpdatingMarkets" then
    --Init variables
    numMarket = payload.numStruct;   
    --Add one to players Market total 
    data.Markets[playerId] = numMarket + 1;
    --subtract one from players village count
    data.Counters[playerId] = PlayerCount(data.Counters[playerId]);
    --need to input the data to server and end function
    Mod.PublicGameData = data;
    return(data.Markets[playerId]);
  end
  --Next type to go below with an elseif instead of the end above
end

function PlayerCount(count)
  count = count - 1;
  return(count);
end
