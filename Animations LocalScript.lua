local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://14877754732"

local Track = nil

local AnimationUp = Instance.new("Animation")
AnimationUp.AnimationId = "rbxassetid://14877800026"

local TrackUp = nil

local AnimationDown = Instance.new("Animation")
AnimationDown.AnimationId = "rbxassetid://14877807936"

local TrackDown = nil

local Debounce = false

function CharacterAdded()
	local Character = Player.Character
	local Humanoid = Character:WaitForChild("Humanoid")
	local Animator = Humanoid:WaitForChild("Animator")
	
	if Track then
		Track:Stop()
		Track:Destroy()
	end
	
	Track = Animator:LoadAnimation(Animation)
	
	if TrackUp then
		TrackUp:Stop()
		TrackUp:Destroy()
	end

	TrackUp = Animator:LoadAnimation(AnimationUp)
	
	if TrackDown then
		TrackDown:Stop()
		TrackDown:Destroy()
	end

	TrackDown = Animator:LoadAnimation(AnimationDown)
end

Mouse.Button1Down:Connect(function()
	if not Debounce then
		if Track then
			Debounce = true
			if Track.IsPlaying then
				TrackUp:Stop()
				Track:Stop()
				
				TrackDown:Play()
			else
				TrackDown:Stop()
				TrackUp:Play()
				TrackUp.Stopped:Wait()
				
				Track:Play()
			end
			
			task.wait(0.25)
			
			Debounce = false
		end
	end
end)

Player.CharacterAdded:Wait()

CharacterAdded()

Player.CharacterAdded:Connect(CharacterAdded)
