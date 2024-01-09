local userInputService = game:GetService("UserInputService")
local players = game.Players

local player = players.LocalPlayer

local magnitude = 100
local cooldown = 1
local onCooldown = false

function dash()
	if onCooldown then return end
	
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	
	if root then
		--Set cooldown to true
		onCooldown = true
		
		local direction = root.CFrame.LookVector --Direction that the character is facing
		local mass = root.AssemblyMass
		
		root:ApplyImpulse(direction*magnitude*mass)
		
		--Wait 0.5s then set cooldown to false
		task.delay(cooldown,function()
			onCooldown = false
		end)
	end
end

userInputService.InputBegan:Connect(function(inputObject,isTyping)
	if isTyping then return end
	
	if inputObject.KeyCode == Enum.KeyCode.E then
		dash()
	end
end)
