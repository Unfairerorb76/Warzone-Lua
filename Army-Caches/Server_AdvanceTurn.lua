require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
local ArmyAmount = Mod.Settings.Armies;
      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ArmyCache] ~= nil then -- there is a army cache on the territory that was successfully attacked -- so now you can do what you want :p
						
						addNewOrder(WL.IncomeMod.Create(order.PlayerID,ArmyAmount,"you have captured an army cache", {}));
						--addNewOrder(WL.GameOrderEvent.Create(order.PlayerID,"new territory",{},{terrMod}), true);
					 
				        				
end end end end end   

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
