Player = {
    player_index = 0,

    OnStart = function(self)
		
        if Players == nil then
            Players = {}
        end

		Players[self.player_index] = self.actor
    end
}