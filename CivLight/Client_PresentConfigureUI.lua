require('UI');
function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	
	 Init(rootParent);
  -- initiliase all default values for the inputs
  showMainConfig();
	
	local initialValueConvert = Mod.Settings.NumToConvert;
	local initialValueArmies = Mod.Settings.SetArmiesTo;
    local initalcheckbox = Mod.Settings.OnlyBaseNeutrals;
	
	local initialVillages = Mod.Settings.NumOfVillages;
	local ON = Mod.Settings.ONeutrals;
	local GainedArmies = Mod.Settings.Armies;
	
	local initialACaches = Mod.Settings.NumOfACaches;
	local GainedArmies = Mod.Settings.Armies;
	local FixedArmies = Mod.Settings.FixedArmies;
	local difference = Mod.Settings.aLuck;

	local initialRCaches = Mod.Settings.NumOfRCaches;
	local Pieces = Mod.Settings.cPieces;
	local FixedPieces = Mod.Settings.FixedPieces;
	local difference2 = Mod.Settings.rLuck

	local AttackNeutral = Mod.Settings.AttackNeutral;
	
	if initialValueConvert == nil then
		initialValueConvert = 2;
	end
	
	if initialValueArmies == nil then
		initialValueArmies = 2;
	end

    if initalcheckbox == nil then 
        initalcheckbox = false; 
    end
	
	if initialVillages == nil then
		initialVillages = 3;
	end
	if ON == nil then 
        ON = true; 
    end
	if GainedArmies == nil then
		GainedArmies = 2;
	end
	
	if initialACaches == nil then
		initialACaches = 3;
	end

	if GainedArmies == nil then
		GainedArmies = 5;
	end
	
	if FixedArmies == nil then
		FixedArmies = true;
	end
	
	if difference == nil then 
		difference = 5;
	end

	if initialRCaches == nil then
		initialRCaches = 2;
	end

	if Pieces == nil then
		Pieces = 3;
	end
	
	if FixedPieces == nil then
		FixedPieces = true;
	end
	
	if difference2 == nil then 
		difference2 = 3;
	end

	if AttackNeutral == nil then
		AttackNeutral = true;
	end

    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
	UI.CreateLabel(vert).SetText('Expansion+ Mod related:');
	
	UI.CreateLabel(vert).SetText('amount of neutrals a player shall gain each turn');
    numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueConvert);
	
	 UI.CreateLabel(vert).SetText('amount of armies a player shall get with the territory');
    numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueArmies); 
 
        UI.CreateLabel(vert).SetText('only base neutral armies and less shall be claimed');
        booleanInputField = UI.CreateCheckBox(vert)        
                .SetIsChecked(initalcheckbox);
	
	UI.CreateLabel(vert).SetText('Village Mod related:');
	
	UI.CreateLabel(vert).SetText('Amount of Villages that will be created at the start of the game');
   	 numberInputField3 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialVillages);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get with each new territory');
   	 numberInputField4 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
	UI.CreateLabel(vert).SetText('only neutrals territories shall be claimed (recommended)');
        booleanInputField2 = UI.CreateCheckBox(vert)        
                .SetIsChecked(ON);
	
	
        UI.CreateLabel(vert).SetText('Army-Cache Mod related:');   
	
			UI.CreateLabel(vert).SetText('Amount of Army Caches that will spawn at the start of the game');
   	 numberInputField5 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialACaches);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get for claiming a army cache');
   	 numberInputField6 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
	UI.CreateLabel(vert).SetText('if checked will only give a fixed amount of armies');
        booleanInputField3 = UI.CreateCheckBox(vert)        
                .SetIsChecked(FixedArmies);
	
	UI.CreateLabel(vert).SetText('Random +/- limit');
    numberInputField7 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(difference);
	
	UI.CreateLabel(vert).SetText('Card Cache related');   

	UI.CreateLabel(vert).SetText('Amount of Card Caches that will spawn at the start of the game (shown as resource cache)');
	numberInputField8 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(20)
	.SetValue(initialRCaches);

UI.CreateLabel(vert).SetText('Amount of card pieces that you will get for claiming a card cache');
	numberInputField9 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(20)
	.SetValue(Pieces);

UI.CreateLabel(vert).SetText('if checked will only give a fixed amount of card pieces');
	booleanInputField4 = UI.CreateCheckBox(vert)        
			.SetIsChecked(FixedPieces);

UI.CreateLabel(vert).SetText('Random +/- limit');
numberInputField10 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(10)
	.SetValue(difference2);

	UI.CreateLabel(vert).SetText('if checked will allow the player to claim neutral territories manually');
	booleanInputField5 = UI.CreateCheckBox(vert)        
			.SetIsChecked(AttackNeutral);
end

function showMainConfig()
  DestroyWindow();
  SetWindow("Main");
  CreateButton(GetRoot()).SetText("Villages").SetOnClick(showVillagesConfig);
  CreateButton(GetRoot()).SetText("FreeExpanion+").SetOnClick(showFreeExpansionConfig);
end

function showVillagesConfig()
  DestroyWindow();
  SetWindow("Villages");
  -- show all settings of the Villages part
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig);
end

function showFreeExpansionConfig()
  DestroyWindow();
  SetWindow("FreeExpansion");
  -- show all settings of the FreeExpansion part
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig);
end

--[[
basic template for functions:
function functionName()     -- 0 parameters!
  DestroyWindow();          -- Destroys every UI object currently visible
  SetWindow("WindowName");  -- Allows you to do even more advanced shit
  -- do here what you want
  CreateButton(parent).SetText("Return").SetOnClick(previousFunction);  -- Allows game creators to go back to the previous page
end
]]--
