Player = {
    index = 0,

    OnStart = function(self)

		Players[self.index] = self.actor
    end,

    OnUpdate = function(self)
        
        if self.other_player == nil then
            self.other_player = Players[1 - self.index]
        end
    end
}