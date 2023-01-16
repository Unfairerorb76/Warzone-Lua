function Server_GameCustomMessage(game, playerId, payload, setReturn)
local data = Mod.PublicGameData;
--Need to get the payload type to find out what action to take
  if payload.type == "UpdatingMarkets" then
   -- We need this if statement to ensure that the mod does not break if payload == nil
    if not payload then
      setReturn(data.Markets[playerId]);
      return;
    else
    --Add one to players Market total 
      data.Markets[playerId] = payload + 1;
    end
    --need to input the data to server and end function
  Mod.PublicGameData = data;
  setReturn(data.Markets);
  end
end
