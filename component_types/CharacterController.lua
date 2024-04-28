CharacterController = {

	player_index = 0,
	speed = 1000.0,
	jump_power = 1000.0,
	blocking_speed_multiplier = 0.5,

	OnStart = function(self)

		self.player = self.actor:GetComponent("Player")

		self.rb = self.actor:GetComponent("Rigidbody")
		self.animator = self.actor:GetComponent("Animator")
		self.sr = self.actor:GetComponent("AnimatedSprite")
		self.jump_power = self.jump_power * self.rb:GetMass()

		if self.player["index"] == 1 then
			
			self.GetRight = function() return Input.GetKey("right") end
			self.GetLeft = function() return Input.GetKey("left") end
			self.GetUp = function() return (Input.GetKeyDown("up") or Input.GetKeyDown("space")) end
			self.GetDown = function() return Input.GetKeyDown("down") end

			self.GetAttack = function() return Input.GetKeyDown("k") end
			self.GetBlock = function() return Input.GetKey("l") end

		else

			self.GetRight = function() return Input.GetKey("d") end
			self.GetLeft = function() return Input.GetKey("a") end
			self.GetUp = function() return (Input.GetKeyDown("w") or Input.GetKeyDown("space")) end
			self.GetDown = function() return Input.GetKeyDown("s") end

			self.GetAttack = function() return Input.GetKeyDown("1") end
			self.GetBlock = function() return Input.GetKey("q") end
		end


	end,

	OnUpdate = function(self)

		local curr_delta_time = Time.DeltaTime();

		-- Horizontal
		local horizontal_input = 0

		if self:GetRight() then
			horizontal_input = self.speed * curr_delta_time
		end

		if self:GetLeft() then
			horizontal_input = -self.speed * curr_delta_time
		end

		if self:GetBlock() then
			horizontal_input = horizontal_input * self.blocking_speed_multiplier
		end

		-- Vertical
		local vertical_input = 0

		-- -- Check on ground
		-- local ground_object = Physics.Raycast(self.rb:GetPosition(), Vector2(0, 1), 0.5)
		
		-- if self.GetUp() or Input.GetKeyDown("space") then
		-- 	if ground_object ~= nil then
		-- 		vertical_input = -self.jump_power
		-- 		-- TODO: Trigger jump animation
		-- 	end
		-- end

		self.rb:SetVelocity(Vector2(horizontal_input, vertical_input))
  end
}