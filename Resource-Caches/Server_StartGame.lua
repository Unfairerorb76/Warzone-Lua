require('Utilities');
require('WLUtilities');
require('distributeRandomStructures');

function Server_StartGame(game, standing)

distributeRandomStructures(standing, WL.StructureType.ResourceCache, Mod.Settings.NumOfRCaches, {maxPercentage = 50, numberOfStructures = 1, onlyPlaceOnNeutrals = true, allowMultipleStructures = false});
  

	for _, player in pairs(game.ServerGame.Game.PlayingPlayers) do
		local playerCards = WL.PlayerCards.Create(player.ID);
		local newPieces = playerCards.Pieces;
		local newCards = playerCards.WholeCards;
		for card, cardGame in pairs(game.Settings.Cards) do
			local totalPieces = cardGame.InitialPieces;
			if Mod.Settings.CardPiecesFromStart[p.Slot] ~= nil and Mod.Settings.CardPiecesFromStart[p.Slot][card] ~= nil then
				totalPieces = totalPieces + Mod.Settings.CardPiecesFromStart[p.Slot][card];
			end
			if card ~= WL.CardID.Reinforcement then
				for k = 1, math.floor(totalPieces / cardGame.NumPieces) do
					local instance = WL.NoParameterCardInstance.Create(card);
					newCards[instance.ID] = instance;
				end
				newPieces[card] = totalPieces % cardGame.NumPieces;
			else
				for k = 1, math.floor(totalPieces / cardGame.NumPieces) do
					local instance = WL.ReinforcementCardInstance.Create(armies);
					newCards[instance.ID] = instance;
				end
				newPieces[card] = totalPieces % cardGame.NumPieces;
			end
		end
		playerCards.WholeCards = newCards;
		playerCards.Pieces = newPieces;
		cards[p.ID] = playerCards;
	end
	s.Cards = cards;
	standing = s;
end
