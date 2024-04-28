GameManager = {

	OnStart = function(self)
		if ActiveGameManager == nil then
			ActiveGameManager = self
		end

		Players = {}
	end,
}

