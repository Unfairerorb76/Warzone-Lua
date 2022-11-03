require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder, standing)

      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 
          local structures = TransferredTerr.Structures
                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ResourceCache] ~= nil then -- there is a army cache on the territory that was successfully attacked -- so now you can do what you want :p
			if game.Settings.Cards == nil then return; end
					
		for _, player in pairs(game.ServerGame.Game.PlayingPlayers) do
		local pieces = {};
		local cardsToBeRemoved = {};
		for card, amount in pairs(game.Settings.Cards) do
			if game.Settings.Cards[card] ~= nil then
				
					pieces[card] = amount;
				
					if game.ServerGame.LatestTurnStanding.Cards ~= nil then
						local playerCards = game.ServerGame.LatestTurnStanding.Cards[player.ID];
						local totalPieces = 0;
						if playerCards.Pieces ~= nil then
							totalPieces = playerCards.Pieces[card];
						end

						
							local totalCards = {};
							if playerCards.WholeCards ~= nil then
								for _, instance in pairs(playerCards.WholeCards) do
									if instance.CardID == card then
										table.insert(totalCards, instance);
									end
								end
							end
							for i = 1, math.min(#totalCards, math.ceil(math.abs(totalPieces + amount) / game.Settings.Cards[card].NumPieces)) do
								table.insert(cardsToBeRemoved, totalCards[i]);
							end
							if #totalCards * game.Settings.Cards[card].NumPieces + totalPieces >= -amount then
								pieces[card] = (totalPieces + amount ) % game.Settings.Cards[card].NumPieces - totalPieces;
							else
								pieces[card] = -totalPieces;
							end
						
					end
				
			end
		end
		if getTableLength(pieces) > 0 then
			local order = WL.GameOrderEvent.Create(p.ID, "adjusted pieces", {}, {}, {}, {});
			local t = {};
			t[p.ID] = pieces;
			order.AddCardPiecesOpt = t;
			addNewOrder(order);
		end
		for _, instance in pairs(cardsToBeRemoved) do
			local order = WL.GameOrderEvent.Create(p.ID, "Removed " .. getCardName(instance.CardID) .. " card", {}, {}, {}, {});
			local t = {};
			t[p.ID] = instance.ID;
			order.RemoveWholeCardsOpt = t;
			addNewOrder(order);
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
