function Server_GameCustomMessage(game, playerId, payload, setReturn)
data = Mod.PublicGameData;
  if not payload then
      return;
  end
  
  if payload.type == "UpdatingGullible" then
    --Init variables
    table.insert(data.Gullible, playerId);
    --need to input the data to server and end function
    Mod.PublicGameData = data;
    return(data.Gullible);
  end
end
