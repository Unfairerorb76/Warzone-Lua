require('LoreBook');
Alerted = false;

function Client_GameRefresh(game)
 local data = Mod.PublicGameData; 
	if (not Alerted and not WL.IsVersionOrHigher or not WL.IsVersionOrHigher("5.21")) then
		UI.Alert("You must update your app to the latest version to use the Special Units Structures modpack");
        Alerted = true;
	end
	if(game.Us == nil)then
		return;
	end
  	if game.Game.TurnNumber >= 2 then
         	local advert = advert();
         	UI.Alert(advert);		
   	end

for p, player in pairs(game.Game.PlayingPlayers) do
 if data.Gullible[p] == true then
   if data.Viewed[game.Us.ID] == false then
	local name = player.DisplayName(nil, false)	
	UI.Alert(gullible(name));
	data.Viewed[game.Us.ID] = true;
 end
end
end
end
