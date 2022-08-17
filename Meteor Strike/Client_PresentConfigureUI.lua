
function Client_PresentConfigureUI(rootParent, rootParent2, rootParent3)
	
	local initialValueStrikes = Mod.Settings.NumOfStrikes;
	local initialValueKilled = Mod.Settings.ArmiesKilled;
	local initalcheckbox = Mod.Settings.EnableDoomsDay;
        local initialValueSurvived = Mod.Settings.TerrSurvived;
	local initalDoomsDay = Mod.Settings.TurnDoomsDay;
        
	
	if initialValueStrikes == nil then
		initialValueStrikes = 5;
	end
	
	if initialValueKilled == nil then
		initialValueKilled = 2;
	end
	
	 if initalcheckbox == nil then 
                initalcheckbox = false; 
        end

        if initialValueSurvived == nil then
		initialValueSurvived = 1;
	end
	
        if initalDoomsDay == nil then
		initialDoomsDay = 25;
	end
    
 local vert = UI.CreateVerticalLayoutGroup(rootParent);
local horz1 = UI.CreateHorizontalLayoutGroup(vert);  --not used
local horz2 = UI.CreateHorizontalLayoutGroup(vert);  --not used but here for reference
	
		UI.CreateLabel(vert).SetText('Amount of meteors that will hit per turn');
   	 numberInputField = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialValueStrikes);
	
		 UI.CreateLabel(vert).SetText('amount of armies that will die per hit');
    	numberInputField2 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(15)
		.SetValue(initialValueKilled); 

--DoomsDay Mode
  
		UI.CreateLabel(vert).SetText('enable DoomsDay Mode:');
        booleanInputField = UI.CreateCheckBox(vert)        
                .SetIsChecked(initalcheckbox);
        print(1);          
		UI.CreateLabel(vert).SetText('What turn does the DoomsDay meteor hit?');
	print(2);
    	numberInputField3 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)  
		.SetSliderMaxValue(100)
		.SetValue(initialDoomsDay); 
	print(6);
       

               UI.CreateLabel(vert).SetText('how much territories do you want to survive?');
    	numberInputField4 = UI.CreateNumberInputField(vert)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(20)
		.SetValue(initialValueSurvived); 
     
        


end
