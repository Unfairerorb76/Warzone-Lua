require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsAttack and orderResult.IsSuccessful then 
          local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

                if attackedTerr.Structures ~= nil then 
                    if attackedTerr.Structures[WL.StructureType.ArmyCache] ~= nil then -- there is a mercenary camp on the territory that was successfully attacked -- so now you can do what you want :p
					
						local terrMod = WL.TerritoryModification.Create(attackedTerr);
						terrMod.SetArmiesTo = Mod.Settings.Armies;
						addNewOrder(WL.GameOrderEvent.Create(order.PlayerID,"new territory",{},{terrMod}), true);
					    end
				        				
end end end end end      

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
