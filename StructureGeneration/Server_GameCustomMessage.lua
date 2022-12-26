function Server_GameCustomMessage(game, playerId, payload, setReturn)
	local data = Mod.PublicGameData;
 	if not payload then
	   setReturn(data.Markets);
	   return;
	else
    
        data.Markets[playerId] = payload.Markets;
	end
	Mod.PublicGameData = data;
	setReturn(data.Markets);
end
