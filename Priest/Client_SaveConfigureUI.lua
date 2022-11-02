function Client_SaveConfigureUI(alert)
    local cost = costInputField.GetValue();
    if cost < 1 then alert("Cost to buy a priest must be positive"); end
    Mod.Settings.CostToBuyPriest = cost;

    local power = powerInputField.GetValue();
    if power < 1 then alert("Priest must have at least one power"); end
    Mod.Settings.PriestPower = power;

    local maxPriests = maxPriestsField.GetValue();
    if maxPriests < 1 or maxPriests > 5 then alert("Max priests must be between 1 and 5"); end
    Mod.Settings.MaxPriests = maxPriests;
end
