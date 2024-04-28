SpriteRenderer = {
	sprite = "???",
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
	end,

	OnUpdate = function(self)
		self.rb = self.actor:GetComponent("Rigidbody")

		if self.rb ~= nil then
			self.pos = self.rb:GetPosition()
			self.rot_degrees = self.rb:GetRotation()
		end

		Image.DrawEx(self.sprite, self.pos.x, self.pos.y, self.rot_degrees, self.scale_x, self.scale_y, 0.5, 0.5, self.r, self.g, self.b, self.a, self.sorting_order)
	end
  
}

