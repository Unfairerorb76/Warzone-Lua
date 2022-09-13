require('Utilities');
require('WLUtilities');

function Server_AdvanceTurn_End(game, addNewOrder)
     local terr = {};
     local structures = game.ServerGame.LatestTurnStanding.Territories;
      --local structures = game.ServerGame.LatestTurnStanding.Territories[order.To].Structures;
      
      
		
     for terrID, territory in pairs(game.ServerGame.LatestTurnStanding.Territories) do
		print(territory);
    		--if (structures == WL.StructureType.MercenaryCamp) then
		  if territory.Structures[WL.StructureType.MercenaryCamp] then
			print(1);
      			table.insert(terr, terrID);   --gets each territory ID of controlled camps
                         print(terr);
                         
		end
	end

      for times = 1, math.min(count, math.floor(#terr / getTableLength(game.ServerGame.Game.PlayingPlayers))) do
	
	for i, _ in pairs(game.ServerGame.Game.PlayingPlayers) do





           

     end 
      end
end

--function Server_AdvanceTurn_Order(game, order, orderResult, skipThisOrder, addNewOrder)
 ----     if order.proxyType == "GameOrderAttackTransfer" then 
        --    if orderResult.IsAttack and orderResult.IsSuccessful then 
        --    local attackedTerr = game.ServerGame.LatestTurnStanding.Territories[order.To]; 

               -- if attackedTerr.Structures ~= nil then 
                 --   if attackedTerr.Structures[WL.StructureType.MercenaryCamp] ~= nil then -- there is a mercenary camp on the territory that was successfully attacked -- so now you can do what you want :p 
--end end end end end





function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end

