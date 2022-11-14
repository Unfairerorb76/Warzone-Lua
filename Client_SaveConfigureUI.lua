function Client_SaveConfigureUI(alert)

    local cost = costInputField.GetValue();
    if cost < 1 then alert("the cost to buy a Diplomat must be positive"); end
    Mod.Settings.CostToBuyDiplomat = cost;

    local maxDiplomats = maxDiplomatsField.GetValue();
    if maxDiplomats < 1 or maxDiplomats > 5 then alert("Max number of Diplomats per player must be between 1 and 5"); end
    Mod.Settings.MaxDiplomats = maxDiplomats;
    
    local turns = turnField.GetValue();
    if turns < 1 then alert("The number of turns must be a positive!"); end
    Mod.Settings.turns = turns;
    
end
