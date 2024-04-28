CharacterController = {

	player_index = -1,
	speed = 1000.0,
	jump_power = 1000.0,

	OnStart = function(self)

		self.rb = self.actor:GetComponent("Rigidbody")
		self.animator = self.actor:GetComponent("Animator")
		self.sr = self.actor:GetComponent("AnimatedSprite")
		self.jump_power = self.jump_power * self.rb:GetMass()

		if self.player_index == 1 then
			
			self.GetRight = function(self) return Input.GetKey( "right") end
			self.GetLeft = function(self) return Input.GetKey( "left") end
			self.GetUp = function(self) return Input.GetKey( "up") end
			self.GetDown = function(self) return Input.GetKey( "down") end

			self.GetAttack = function(self) return Input.GetKey( "z") end
			self.GetBlock = function(self) return Input.GetKey( "x") end

		else

			self.GetRight = function(self) return Input.GetButton("Right") end
			self.GetLeft = function(self) return Input.GetButton("Left") end
			self.GetUp = function(self) return Input.GetButton("Up") end
			self.GetDown = function(self) return Input.GetButton("Down") end

			self.GetAttack = function(self) return Input.GetButton("RightShoulder") end
			self.GetBlock = function(self) return Input.GetButton("LeftShoulder") end
		end


	end,

	OnUpdate = function(self)

		local curr_delta_time = Time.DeltaTime();
		-- Horizontal
		local horizontal_input = 0
		if Input.GetKey("right") then
			horizontal_input = self.speed * curr_delta_time
		end

		if Input.GetKey("left") then
			horizontal_input = -self.speed * curr_delta_time
		end

		-- Vertical
		local vertical_input = 0

		-- Check on ground
		local on_ground = false
		ground_object = Physics.Raycast(self.rb:GetPosition(), Vector2(0, 1), 0.5)
		if Input.GetKeyDown("up") or Input.GetKeyDown("space") then
			if ground_object ~= nil then
				vertical_input = -self.jump_power
			end
		end

		self.rb:AddForce(Vector2(horizontal_input, vertical_input))
  end
}

