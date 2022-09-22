require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
local ArmyAmount = Mod.Settings.Armies;
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 
          local structures = TransferredTerr.Structures
                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ArmyCache] ~= nil then -- there is a army cache on the territory that was successfully attacked -- so now you can do what you want :p
						       
					        local terrMod = WL.TerritoryModification.Create(order.To);
					
					       	structures[WL.StructureType.ArmyCache] = structures[WL.StructureType.ArmyCache] - 1;					
					
						addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, "Updated income", {}, {}, {}, {WL.IncomeMod.Create(order.PlayerID, ArmyAmount, "You have captured an army cache")}));
					        addNewOrder(WL.GameOrderEvent.Create(order.PlayerID, 'Destroyed a fort', {}, {terrMod}));
						--addNewOrder(WL.GameOrderEvent.Create(order.PlayerID,"new territory",{},{terrMod}), true);
					 
				        				
end end end end end   

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
