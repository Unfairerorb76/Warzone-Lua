numTerritoriesTable = {};

function Server_AdvanceTurn_Order(game, order, result, turnNeutral)
	if (order.proxyType == 'GameOrderAttackTransfer') then
		local numAttacks = numTerritoriesTable[order.PlayerID];
		if numAttacks == nil then numAttacks = 0; end
		if (numterritories >= Mod.Settings.Limit) then
		
			local terr = game.ServerGame.LatestTurnStanding.Territories[order.To];
			terrMod = WL.TerritoryModification.Create(terr.ID);
			terrMod.SetOwnerOpt=terr.OwnerPlayerID;
			terrMod.SetArmiesTo = result.AttackingArmiesKilled.NumArmies+game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies;
			--terrMod.SetArmiesTo = result.AttackingArmiesKilled.NumArmies+game.ServerGame.LatestTurnStanding.Territories[order.To].NumArmies.NumArmies-result.DefendingArmiesKilled.NumArmies;
			
		end
	end
end
