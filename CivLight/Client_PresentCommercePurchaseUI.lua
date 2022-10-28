require('Utilities');
require('WLUtilities');

function Client_PresentCommercePurchaseUI(rootParent, setScrollable, game)
	

	Close1 = close;
	Game = game;
	
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	local row1 = UI.CreateHorizontalLayoutGroup(vert);

	UI.CreateLabel(row1).SetText("Territories are worth: " .. Mod.Settings.terrCost .. " gold");
	UI.CreateButton(vert).SetText("Select a territory").SetOnClick(PurchaseClicked);

	
	UI.CreateLabel(row1).SetText("Purchase territory: ");
	TargetTerritoryBtn = UI.CreateButton(row1).SetText("Select territory to buy...").SetOnClick(TargetTerritoryClicked);

end


function TargetTerritoryClicked()
	local options = map(filter(Game.LatestStanding.Territories, function(t) 
		return t.FogLevel == WL.StandingFogLevel.Visible and t.OwnerPlayerID == WL.PlayerID.Neutral  --only show unfogged, neutral territories.
		end), TerritoryButton);
	UI.PromptFromList("Select the territory you'd like to purchase", options);
end
function TerritoryButton(terr)
	local name = Game.Map.Territories[terr.ID].Name;
	local ret = {};
	ret["text"] = name;
	ret["selected"] = function()
		TargetTerritoryBtn.SetText(name);
		TargetTerritoryID = terr.ID;
		Cost = terr.NumArmies.NumArmies * Mod.Settings.CostPerNeutralArmy;
		CostLabel.SetText("Cost = " .. Cost .. " gold");
	end
	return ret;
end

function SubmitClicked()
	if (TargetTerritoryID == nil) then
		UI.Alert("Please choose a territory first");
		return;
	end

	local goldHave = Game.LatestStanding.NumResources(Game.Us.ID, WL.ResourceType.Gold);
	
	if (Game.Us.HasCommittedOrders) then
		UI.Alert("You need to uncommit first");
		--since you can't write in the order table when the player has already commited, he needs to uncommit first before he can purchase the territory
		return;
	end
	
	if (goldHave < Cost) then
		UI.Alert("You can't afford it.  You have " .. goldHave .. " gold and it costs " .. Cost);
		return;
	end

	local msg = 'Request to purchase ' ..  Game.Map.Territories[TargetTerritoryID].Name .. ' for ' .. Cost .. ' gold';

	local payload = 'BuyNeutral_' .. TargetTerritoryID;

    --Pass a cost to the GameOrderCustom as its fourth argument.  This ensures the game takes the gold away from the player for this order, both on the client and server.
	local order = WL.GameOrderCustom.Create(Game.Us.ID, msg, payload, { [WL.ResourceType.Gold] = Cost } );

	local orders = Game.Orders;
	table.insert(orders, order);
	Game.Orders = orders;
end
	
---- tank mod past this
	
function NumTanksIn(armies)
	local ret = 0;
	for _,su in pairs(armies.SpecialUnits) do
		if (su.Name == 'Tank') then
			ret = ret + 1;
		end
	end
	return ret;
end

function PurchaseClicked()
	--Check if they're already at max.  Add in how many they have on the map plus how many purchase orders they've already made
	--We check on the client for player convenience. Another check happens on the server, so even if someone hacks their client and removes this check they still won't be able to go over the max.

	local playerID = Game.Us.ID;
	
	local numTanksAlreadyHave = 0;
	for terrID,ts in pairs(Game.LatestStanding.Territories) do
		if (terrID.OwnerPlayerID == WL.PlayerID.Neutral) then
			--numTanksAlreadyHave = numTanksAlreadyHave + NumTanksIn(ts.NumArmies);
		end
	end

--	for _,order in pairs(Game.Orders) do
--		if (order.proxyType == 'GameOrderCustom' and startsWith(order.Payload, 'BuyTank_')) then
--			numTanksAlreadyHave = numTanksAlreadyHave + 1;
--		end
--	end

--	if (numTanksAlreadyHave >= Mod.Settings.MaxTanks) then
--		UI.Alert("You already have " .. numTanksAlreadyHave .. " tanks, and you can only have " ..  Mod.Settings.MaxTanks);
--		return;
--	end

--	Game.CreateDialog(PresentBuyTankDialog); 
	Close1();
end


function PresentBuyTankDialog(rootParent, setMaxSize, setScrollable, game, close)
	Close2 = close;

	local vert = UI.CreateVerticalLayoutGroup(rootParent).SetFlexibleWidth(1); --set flexible width so things don't jump around while we change InstructionLabel

	SelectTerritoryBtn = UI.CreateButton(vert).SetText("Select Territory").SetOnClick(SelectTerritoryClicked);
	TargetTerritoryInstructionLabel = UI.CreateLabel(vert).SetText("");

	BuyTankBtn = UI.CreateButton(vert).SetInteractable(false).SetText("Complete Purchase").SetOnClick(CompletePurchaseClicked);

	SelectTerritoryClicked(); --just start us immediately in selection mode, no reason to require them to click the button
end

function SelectTerritoryClicked()
	UI.InterceptNextTerritoryClick(TerritoryClicked);
	TargetTerritoryInstructionLabel.SetText("Please click on the territory you wish to receive the tank on.  If needed, you can move this dialog out of the way.");
	SelectTerritoryBtn.SetInteractable(false);
end

function TerritoryClicked(terrDetails)
	SelectTerritoryBtn.SetInteractable(true);

	if (terrDetails == nil) then
		--The click request was cancelled.   Return to our default state.
		TargetTerritoryInstructionLabel.SetText("");
		SelectedTerritory = nil;
		BuyTankBtn.SetInteractable(false);
	else
		--Territory was clicked, check it
		if (Game.LatestStanding.Territories[terrDetails.ID].OwnerPlayerID ~= Game.Us.ID) then
			TargetTerritoryInstructionLabel.SetText("You may only receive a tank on a territory you own.  Please try again.");
		else
			TargetTerritoryInstructionLabel.SetText("Selected territory: " .. terrDetails.Name);
			SelectedTerritory = terrDetails;
			BuyTankBtn.SetInteractable(true);
		end
	end
end

function CompletePurchaseClicked()
	local msg = 'Buy a tank on ' .. SelectedTerritory.Name;
	local payload = 'BuyTank_' .. SelectedTerritory.ID;

	local orders = Game.Orders;
	table.insert(orders, WL.GameOrderCustom.Create(Game.Us.ID, msg, payload,  { [WL.ResourceType.Gold] = Mod.Settings.CostToBuyTank } ));
	Game.Orders = orders;

	Close2();
end
