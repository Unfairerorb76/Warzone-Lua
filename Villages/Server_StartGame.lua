require('Utilities');
require('WLUtilities');

function Server_StartGame(game, addNewOrder)

end -- end of function

function getTableLength(t)
	local a = 0;
	for i, _ in pairs(t) do
		
		a = a + 1;
	end
	return a;
end
