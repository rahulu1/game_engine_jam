GameManager = {

	-- This component manages game state, handles game over, etc

	OnStart = function(self)

		if ActiveGameManager == nil then
			ActiveGameManager = self
		end

		Players = {}
	end,
}

