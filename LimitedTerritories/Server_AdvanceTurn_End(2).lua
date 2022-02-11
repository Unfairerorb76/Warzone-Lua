


function Server_AdvanceTurn_End(game, addNewOrder)
  
for _, limitTerritories(game.ServerGame.LatestTurnStanding.Territories) do 
 
    local count = 0;
    
    players = {};
    
     for _, playerID in pairs(game.ServerGame.Game.PlayingPlayers) do
       players[PlayerID] = {};
     end
  
     for _, terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
            if (terr.IsNeutral == false) then
                   players[terr.OwnerPlayerID][terr.ID] = terr.NumArmies.NumArmies;
                   count = count + 1; 
               end               
     end
    
    
--after this point, uncertainty and copy & pasting lies --
    
    
 local armiesOnTerritory = game.ServerGame.LatestTurnStanding.Territories[targetTerritoryID].NumArmies.NumArmies;
 
      
      if (count > Mod.Settings.Limit) then
         if (armiesOnTerritory < players[terr.OwnerPlayerID][terr.ID])
            then armiesOnTerritory = players[terr.OwnerPlayerID]
        
      local terr = game.ServerGame.LatestTurnStanding.Territories[order.To];
			terrMod = WL.TerritoryModification.Create(terr.ID);
			terrMod.SetOwnerOpt=terr.OwnerPlayerID;
	 		terrMod.SetArmiesTo =  game.ServerGame.LatestTurnStanding.Territories[order.To];
	end
        end 
     end
 end
