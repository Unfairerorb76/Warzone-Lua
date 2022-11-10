require('UI');
function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	
  Init(rootParent);
  -- initiliase all default values for the inputs
  showMainConfig();
		
end

function showMainConfig()
  DestroyWindow();
  SetWindow("Main");

  local vert = CreateVert(GetRoot());
  local horz = CreateHorz(GetRoot());
	
  InputField = UI.CreateCheckBox(vert).SetIsChecked(false).SetText("Disable Expansion+");
	
  CreateButton(vert).SetText("Expansion+").SetOnClick(showExpansionConfig).SetColor('#00FF8C'); 
		
  InputField2 = UI.CreateCheckBox(vert).SetIsChecked(false).SetText("Disable Villages");	
  CreateButton(vert).SetText("Villages").SetOnClick(showVillagesConfig).SetColor('#00FF8C');
  InputField3 = UI.CreateCheckBox(vert).SetIsChecked(false).SetText("Disable ArmyCaches");
  CreateButton(vert).SetText("Army-Caches").SetOnClick(showArmyCacheConfig).SetColor('#00FF8C');
  InputField4 = UI.CreateCheckBox(vert).SetIsChecked(false).SetText("Disable Card Caches");
  CreateButton(vert).SetText("Card-Caches").SetOnClick(showCardCacheConfig).SetColor('#00FF8C');
  
  CreateButton(vert).SetText("Misc Features").SetOnClick(showMiscConfig).SetColor('#AC0059');
end

function showExpansionConfig()
  DestroyWindow();
  SetWindow("FreeExpansion");
   
  
local initialValueConvert = Mod.Settings.NumToConvert;
local initialValueArmies = Mod.Settings.SetArmiesTo;
local initalcheckbox = Mod.Settings.OnlyBaseNeutrals;
       if InputField == true then
	if initialValueConvert == nil then
		initialValueConvert = 2;
	end
	
	if initialValueArmies == nil then
		initialValueArmies = 2;
	end

        if initalcheckbox == nil then 
       		initalcheckbox = false; 
    	end
	
	local vert = CreateVert(GetRoot());
	
	CreateLabel(vert).SetText('Allows players to gain a free neutral every turn (only on connected territories).').SetColor('#606060');
	
	UI.CreateLabel(vert).SetText('Amount of neutrals a player shall gain each turn').SetColor('#23A0FF');
    numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueConvert);
	
	 UI.CreateLabel(vert).SetText('Amount of armies a player shall get with the territory').SetColor('#23A0FF');
    numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialValueArmies); 
 
        UI.CreateLabel(vert).SetText('Only base neutral armies and less shall be claimed').SetColor('#23A0FF');
        booleanInputField = UI.CreateCheckBox(vert)        
                .SetIsChecked(initalcheckbox);
	
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');
	 else
  UI.CreateLabel(vert).SetText('This has been disabled').SetColor('#FF0000');
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');
	 end
end

function showVillagesConfig()
  DestroyWindow();
  SetWindow("Villages");
  
	local initialVillages = Mod.Settings.NumOfVillages;
	local ON = Mod.Settings.ONeutrals;
	local GainedArmies = Mod.Settings.Armies;
	
	if initialVillages == nil then
		initialVillages = 3;
	end
	if ON == nil then 
        	ON = true; 
    	end
	if GainedArmies == nil then
		GainedArmies = 2;
	end
	
	local vert = CreateVert(GetRoot());
	
	UI.CreateLabel(vert).SetText('At the start of the game, "villages" will spawn around the map. Capturing a village will claim all the adjacent territories to your side. These are shown as Idle Mercenary Camps.').SetColor('#606060');
	
	UI.CreateLabel(vert).SetText('Amount of Villages that will be created at the start of the game').SetColor('#23A0FF');
   	 numberInputField3 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(initialVillages);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get with each new territory').SetColor('#23A0FF');
   	 numberInputField4 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
	UI.CreateLabel(vert).SetText('only neutrals territories shall be claimed (recommended)').SetColor('#23A0FF');
        booleanInputField2 = UI.CreateCheckBox(vert)        
                .SetIsChecked(ON);
	
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');
end

function showArmyCacheConfig()
  DestroyWindow();
  SetWindow("Army-Caches");
  
	
	local initialACaches = Mod.Settings.NumOfACaches;
	local GainedArmies = Mod.Settings.Armies;
	local FixedArmies = Mod.Settings.FixedArmies;
	local difference = Mod.Settings.aLuck;
	
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
	
	local vert = CreateVert(GetRoot());
	
	UI.CreateLabel(vert).SetText('Army Caches will spawn around the map, grab them to boost your income for the next turn only. These are shown as Idle Army Caches.').SetColor('#606060');
	
	UI.CreateLabel(vert).SetText('Amount of Army Caches that will spawn at the start of the game').SetColor('#23A0FF');
   	 numberInputField5 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialACaches);
	
	UI.CreateLabel(vert).SetText('Amount of armies that you will get for claiming a army cache').SetColor('#23A0FF');
   	 numberInputField6 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(GainedArmies);
	
	UI.CreateLabel(vert).SetText('if checked will only give a fixed amount of armies').SetColor('#23A0FF');
        booleanInputField3 = UI.CreateCheckBox(vert)        
                .SetIsChecked(FixedArmies);
	
	UI.CreateLabel(vert).SetText('Random +/- limit').SetColor('#23A0FF');
    numberInputField7 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(10)
		.SetValue(difference);
	
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');
end

function showCardCacheConfig()
  DestroyWindow();
  SetWindow("Card-Caches");
	
	
	local initialRCaches = Mod.Settings.NumOfRCaches;
	local Pieces = Mod.Settings.cPieces;
	local FixedPieces = Mod.Settings.FixedPieces;
	local difference2 = Mod.Settings.rLuck
	
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
	
	local vert = CreateVert(GetRoot());
	
	UI.CreateLabel(vert).SetText('Card Caches will spawn around the map at the start of the game, claiming the territory it is on will give you pieces for one random card (cards that are enabled by host before hand). These are shown as Idle Resource Caches.').SetColor('#606060');
  
	UI.CreateLabel(vert).SetText('Amount of Card Caches that will spawn at the start of the game (shown as resource cache)').SetColor('#23A0FF');
	numberInputField8 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(20)
	.SetValue(initialRCaches);

	UI.CreateLabel(vert).SetText('Amount of card pieces that you will get for claiming a card cache').SetColor('#23A0FF');
	numberInputField9 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(20)
	.SetValue(Pieces);

	UI.CreateLabel(vert).SetText('if checked will only give a fixed amount of card pieces').SetColor('#23A0FF');
	booleanInputField4 = UI.CreateCheckBox(vert)        
			.SetIsChecked(FixedPieces);

	UI.CreateLabel(vert).SetText('Random +/- limit').SetColor('#23A0FF');
	numberInputField10 = UI.CreateNumberInputField(vert)
	.SetSliderMinValue(1)
	.SetSliderMaxValue(10)
	.SetValue(difference2);
	
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');
end

function showMiscConfig()     -- 0 parameters!
  DestroyWindow();          -- Destroys every UI object currently visible
  SetWindow("Misc");  -- Allows you to do even more advanced shit
  
	local AttackNeutral = Mod.Settings.AttackNeutral;
	
	if AttackNeutral == nil then
		AttackNeutral = true;
	end

       local vert = CreateVert(GetRoot());
	
	UI.CreateLabel(vert).SetText('These are extra features that you can enable!').SetColor('#606060');
	UI.CreateLabel(vert).SetText('if checked will allow the player to claim neutral territories manually').SetColor('#23A0FF');
	booleanInputField5 = UI.CreateCheckBox(vert)        
			.SetIsChecked(AttackNeutral);
	
	
  CreateButton(GetRoot()).SetText("Return").SetOnClick(showMainConfig).SetColor('#94652E');  -- Allows game creators to go back to the previous page
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
