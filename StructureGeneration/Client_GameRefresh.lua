Alerted = false;

function Client_GameRefresh(game)
    
	if (not Alerted and not WL.IsVersionOrHigher or not WL.IsVersionOrHigher("5.21")) then
		UI.Alert("You must update your app to the latest version to use the Special Units Structures modpack");
        Alerted = true;
	end
	if(game.Us == nil)then
		return;
	end

local data = Mod.PublicGameData;
if data.Counters[game.Us] == nil then
data.Counters[game.Us] = 0;
print(1);
end
  --UI.Alert(data.Counters[game.Us]);
    UI.Alert("placeholder" .. data.Counters[game.Us]);

end
