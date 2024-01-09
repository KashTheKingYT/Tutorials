local userInputService = game:GetService("UserInputService")
local players = game.Players

local player = players.LocalPlayer

local magnitude = 10
local cooldown = .25
local onCooldown = false

local linearVelocity = Instance.new("LinearVelocity",player)
linearVelocity.RelativeTo = Enum.ActuatorRelativeTo.Attachment0
linearVelocity.MaxForce = math.huge

function dash()
	if onCooldown then return end
	
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	
	if root then
		--Set cooldown to true
		onCooldown = true
		
		local att = root:FindFirstChild("RootAttachment")
		
		local direction = att.CFrame.LookVector --Direction that the character is facing
		local mass = root.AssemblyMass
		
		linearVelocity.VectorVelocity = direction*magnitude*mass
		
		linearVelocity.Parent = root
		linearVelocity.Attachment0 = att
		
		--Wait 0.5s then set cooldown to false
		task.delay(cooldown,function()
			onCooldown = false
			linearVelocity.Parent = player
		end)
	end
end

userInputService.InputBegan:Connect(function(inputObject,isTyping)
	if isTyping then return end
	
	if inputObject.KeyCode == Enum.KeyCode.E then
		dash()
	end
end)
