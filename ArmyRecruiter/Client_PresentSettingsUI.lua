function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	UI.CreateLabel(vert).SetText('A Recruiter generates armies at the end of each turn on the territory it occupies');

	UI.CreateLabel(vert).SetText('A Recruiter costs: ' .. Mod.Settings.CostToBuyRecruiter .. ' gold.');
	UI.CreateLabel(vert).SetText('Max Recruiter: ' .. Mod.Settings.MaxRecruiter);
	UI.CreateLabel(vert).SetText('Number of armies generated per turn per Recruiter: '.. Mod.Settings.NumArmies);
	UI.CreateLabel(vert).SetText('A Recruiter will always have the same power as 3 armies!');

end
