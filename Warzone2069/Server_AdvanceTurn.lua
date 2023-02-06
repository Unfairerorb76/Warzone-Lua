function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)

   if order.proxyType == "GameOrderAttackTransfer" then
    if orderResult.IsSuccessful then
    local r = math.random(1,25);
    local list = {};
    print(r);
	if (r == 25) then
		local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To];
		local attackerTerr = game.ServerGame.LatestTurnStanding.Territories[order.From];		
          	local terrModTo = WL.TerritoryModification.Create(order.To); 		
		terrModTo.SetOwnerOpt = attackedTerr.OwnerPlayerID;
		terrModTo.SetArmiesTo = (attackedTerr.NumArmies.NumArmies);
              
		local terrModfrom = WL.TerritoryModification.Create(order.From);
		terrModfrom.SetArmiesTo = (attackerTerr.NumArmies.NumArmies);
				
		--addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, "Rubberbanding", {}, {terrModTo}));
		--addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, "returning damaged troops",{}, {terrModfrom}), true);
		table.insert(list, terrModfrom);
		table.insert(list, terrModTo);
		addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, "Rubberbanding",{}, list), true);
     	end
   end
  
end
end
