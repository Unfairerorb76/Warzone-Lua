
function Client_SaveConfigureUI(alert)
    
    Mod.Settings.NumToConvert = numberInputField.GetValue();
    Mod.Settings.SetArmiesTo = numberInputField.GetValue();
    Mod.Settings.OnlyBaseNeutrals = booleanInputField.GetIsChecked();
end
