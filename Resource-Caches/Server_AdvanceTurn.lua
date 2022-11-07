require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder, standing)

      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 
          local structures = TransferredTerr.Structures
                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ResourceCache] ~= nil then -- there is a army cache on the territory that was successfully attacked -- so now you can do what you want :p
			local cardArray = {};	
			for cardID, _ in pairs(game.Settings.Cards) do
			    print(cardID);
                            table.insert(cardArray, cardID);
                        end

                        for times = 1, Mod.Settings.cPieces do
                            
                            local rand = math.random(#cardArray);
                            local randomCard = cardArray[rand]; --picks random card to give to player
			    local pieces = 1;		
						
			    local terrMod = WL.TerritoryModification.Create(order.To);
					
				structures = {}
				structures[WL.StructureType.ResourceCache] = -1;					
			        terrMod.AddStructuresOpt = structures;	
			    
			local cardEvent = WL.GameOrderEvent.Create(order.PlayerID, "Updated cards", {}, {terrMod}, {}, {})
			addNewOrder(cardEvent);
                        end
					
end end end end end   

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
