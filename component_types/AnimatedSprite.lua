AnimatedSprite = {
	scale_x = 1.0,
	scale_y = 1.0,
	r = 255,
	g = 255,
	b = 255,
	a = 255,
	sorting_order = 0,
	game_over = false,

	OnStart = function(self)
		self.pos = Vector2(0, 0)
		self.rot_degrees = 0
        self.animator = self.actor:GetComponent("Animator")
        -- self.animator:SetTimescale(8.0)
	end,

	OnLateUpdate = function(self)
        self.animator = self.actor:GetComponent("Animator")
		self.rb = self.actor:GetComponent("Rigidbody")

		if self.rb ~= nil then
			self.pos = self.rb:GetPosition()
			self.rot_degrees = self.rb:GetRotation()
		end

        if self.animator ~= nil then
            local sprite_this_frame = self.animator:GetCurrentFrameName()
            if (sprite_this_frame ~= "") and (sprite_this_frame ~= self.sprite) then
                self.sprite = sprite_this_frame
            end
        end

        -- Debug.Log(self.sprite)
		if self.sprite ~= nil then
			Image.DrawEx(self.sprite, self.pos.x, self.pos.y, self.rot_degrees, self.scale_x, self.scale_y, 0.5, 0.5, self.r, self.g, self.b, self.a, self.sorting_order)
		end
	end
}

