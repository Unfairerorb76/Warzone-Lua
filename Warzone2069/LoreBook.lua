function advert()
	--List given by Fizzer of all supported colors. 74 diffrent colors
	local adverts = {
		"hello",
    "world"
	};
	local rand = adverts[math.random(#adverts)]
	return rand
end
