Player = {
    player_index = 0,

    OnStart = function(self)

		Players[self.player_index] = self.actor

        self.other_player_index = 1 - self.player_index
    end,

    OnUpdate = function(self)
        
        if self.other_player == nil then
            self.other_player = Players[self.other_player_index]
        end
    end
}