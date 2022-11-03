require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder, standing)

      if order.proxyType == "GameOrderAttackTransfer" then 
          if orderResult.IsSuccessful then 
          local TransferredTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 
          local structures = TransferredTerr.Structures
                if TransferredTerr.Structures ~= nil then 
                    if TransferredTerr.Structures[WL.StructureType.ResourceCache] ~= nil then -- there is a army cache on the territory that was successfully attacked -- so now you can do what you want :p
			local s = game.ServerGame.LatestTurnStanding;
			local cards = s.Cards;
			local armies = 0;
	
			if game.Settings.Cards[WL.CardID.Reinforcement] ~= nil then
				if game.Settings.Cards[WL.CardID.Reinforcement].Mode == WL.ReinforcementCardMode.Fixed then
					armies = game.Settings.Cards[WL.CardID.Reinforcement].FixedArmies;		-- fixed amount
				elseif game.Settings.Cards[WL.CardID.Reinforcement].Mode == WL.ReinforcementCardMode.ProgressiveByNumberOfTerritories then
					armies = round(getTableLength(game.ServerGame.Game.PlayingPlayers) * game.Settings.Cards[WL.CardID.Reinforcement].ProgressivePercentage)
				else
					armies = 1;			-- Turn 0, so 0 * x		To give some armies it is always 1
				end
			end
			for _, player in pairs(game.ServerGame.Game.PlayingPlayers) do
				local playerCards = WL.PlayerCards.Create(player.ID);
				local newPieces = playerCards.Pieces;
				local newCards = playerCards.WholeCards;
				for card, cardGame in pairs(game.Settings.Cards) do
					local totalPieces = cardGame.InitialPieces;
					if Mod.Settings.cPieces ~= nil then
						totalPieces = totalPieces + Mod.Settings.cPieces;
				end
					if card ~= WL.CardID.Reinforcement then
						for k = 1, math.floor(totalPieces / cardGame.NumPieces) do
							local instance = WL.NoParameterCardInstance.Create(card);
							newCards[instance.ID] = instance;
							print(instance);
						end
						newPieces[card] = totalPieces % cardGame.NumPieces;
					else
						newPieces[card] = totalPieces % cardGame.NumPieces;
					end
				end
				playerCards.WholeCards = newCards;
				playerCards.Pieces = newPieces;
				cards[player.ID] = playerCards;
			print(playerCards.WholeCards);
			print(playerCards.Pieces);
			print(cards[player.ID]);
					
			local order = WL.GameOrderEvent.Create(player.ID, "adjusted pieces", {}, {}, {}, {});
			local t = {};
			t[player.ID] = cards;
			order.AddCardPiecesOpt = t;	
			addNewOrder(order);

			--s.Cards = cards;
			--standing = s;
			end
					
end end end end end   

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
