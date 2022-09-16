require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsAttack and orderResult.IsSuccessful then 
          local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

                if attackedTerr.Structures ~= nil then 
                    if attackedTerr.Structures[WL.StructureType.MercenaryCamp] ~= nil then -- there is a mercenary camp on the territory that was successfully attacked -- so now you can do what you want :p
					for terrID, territory in pairs(game.Map.Territories[order.To].ConnectedTo) do
					  if (Mod.Settings.ONeutrals == true) then	
					    if (game.ServerGame.LatestTurnStanding.Territories[terrID].IsNeutral == true) then
						local terrMod = WL.TerritoryModification.Create(terrID);
						terrMod.SetOwnerOpt = order.PlayerID;
						terrMod.SetArmiesTo = Mod.Settings.Armies;
						addNewOrder(WL.GameOrderEvent.Create(order.PlayerID,"new territory",{},{terrMod}), true);
					    end
					 end
					 if (Mod.Settings.ONeutrals == false) then
					     
						local terrMod = WL.TerritoryModification.Create(terrID);
						terrMod.SetOwnerOpt = order.PlayerID;
						terrMod.SetArmiesTo = Mod.Settings.Armies;
						addNewOrder(WL.GameOrderEvent.Create(order.PlayerID,"new territory",{},{terrMod}), true);			
					   
					end
				     end				
end end end end end      

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
