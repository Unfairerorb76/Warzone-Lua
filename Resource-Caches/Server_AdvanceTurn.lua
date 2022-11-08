require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder, standing)

      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 
          local structures = TransferredTerr.Structures
                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ResourceCache] ~= nil then 
			local cardArray = {};
			local t1 = {};
			local t2 = {};
			local list = {};
			for cardID, _ in pairs(game.Settings.Cards) do
			
                            table.insert(cardArray, cardID);
                        end

                     
                            local rand = math.random(#cardArray);
                            local randomCard = cardArray[rand]; --picks random card to give to player
			    if Mod.Settings.FixedPieces then
			    local pieces = Mod.Settings.cPieces;		
			    else
			    local pieces = Mod.Settings.cPieces + math.random(-Mod.Settings.Luck, Mod.Settings.Luck);
		   	    t1[randomCard] = pieces;		
                        
			    local terrMod = WL.TerritoryModification.Create(order.To);
					
				structures = {};
				structures[WL.StructureType.ResourceCache] = -1;					
			        terrMod.AddStructuresOpt = structures;	
						
			   
					
		local cardEvent = WL.GameOrderEvent.Create(order.PlayerID, "Updated cards", {}, {terrMod}, {}, {});
		
			t2[order.PlayerID] = t1;			
			cardEvent.AddCardPiecesOpt = t2;
			
			addNewOrder(cardEvent, true);
					
end end end end end   

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
