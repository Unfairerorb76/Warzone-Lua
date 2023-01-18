require('UI');
function Server_AdvanceTurn_End(game, addNewOrder)
    local playerTerrs = {};
    for p, _ in pairs(game.Game.PlayingPlayers) do
        playerTerrs[p] = {};
    end

    for _, terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
        if terr.OwnerPlayerID ~= WL.PlayerID.Neutral then
            -- you should make it so only territories without special units can be lost imo
            local numArmies = terr.NumArmies.NumArmies
            local index = 1;
            for i, terr2 in pairs(playerTerrs[terr.OwnerPlayerID]) do
                if game.ServerGame.LatestTurnStanding.Territories[terr2].NumArmies.NumArmies > numArmies then
                    index = i;
                    break;
                end
            end
            if index == 1 and #playerTerrs[terr.OwnerPlayerID] ~= 0 then
                index = #playerTerrs[terr.OwnerPlayerID];
            end
            table.insert(playerTerrs[terr.OwnerPlayerID], index, terr.ID);
        end
    end

    -- Now playerTerrs is a table with as key a PlayerID and as value a sorted array, with at index 1 the one with the most armies and the last index the terr with the least

    for p, arr in pairs(playerTerrs) do
        local list = {};
        for i = #arr, 2, -1 do      -- the '2' here is the stopping point of the loop. It will stop when it has reached i = 1 (i < 2)
            local mod = WL.TerritoryModification.Create(arr[i]);
            mod.SetOwnerOpt = WL.PlayerID.Neutral
            table.insert(list, mod);
        end
        print(1);
        print(list);
        print(p);
        local event = WL.GameOrderEvent.Create(p, "Territory cap", {}, list);
        print(event);
        print(2);
        addNewOrder(event);
        print(3);
    end
end

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
