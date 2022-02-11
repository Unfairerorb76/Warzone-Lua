
function Server_AdvanceTurn_End(game, addNewOrder)
--it should calculate how much territories the player has,
-- loop all territories
    --Loop all territories and count how many a player owns
    for _, terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
        if (terr.IsNeutral == false) then
            if (players[terr.OwnerPlayerID] == nil) then
                players[terr.OwnerPlayerID] = 0
            end

            players[terr.OwnerPlayerID] = players[terr.OwnerPlayerID] + 1
        end
    end

for playerID, territoriesOwned in pairs(players) do
		local armiesOnTerritory = game.ServerGame.LatestTurnStanding.Territories[targetTerritoryID].NumArmies.NumArmies;
  	    if (players[terr.OwnerPlayerID] > Mod.Settings.Limit) then
		   if (armiesOnTerritory < players[terr.OwnerPlayerID])
				then armiesOnTerritory = players[terr.OwnerPlayerID]
			        
				
			local terr = game.ServerGame.LatestTurnStanding.Territories[order.To];
			terrMod = WL.TerritoryModification.Create(terr.ID);
			terrMod.SetOwnerOpt=terr.OwnerPlayerID;
			terrMod.SetArmiesTo =  game.ServerGame.LatestTurnStanding.Territories[order.To];
				
		
			
			
			until (players[terr.OwnerPlayerID] = Mod.Settings.Limit)	
				
				-- calculate the lowest armies on each territory
			-- deleeate from bottom up till Limit is met
			--celebrate
					
end
		
		
end
