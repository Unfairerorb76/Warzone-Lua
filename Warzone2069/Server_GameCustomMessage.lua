function Server_GameCustomMessage(game, playerId, payload, setReturn)
data = Mod.PublicGameData;
  if not payload then
      return;
  end
  
  if payload.type == "UpdatingGullible" then
    --Init variables
    data.Gullible[playerId] = true;
    --need to input the data to server and end function
    Mod.PublicGameData = data;
    return(data.Gullible[playerId]);
  end
  if payload.Type == "UpdatingViewed" then
   --Init variables 
     data.Viewed[playerId] = true;
    --need to input the data to server and end function
    Mod.PublicGameData = data;
    return(data.Viewed[playerId]);
  end
end
