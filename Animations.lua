--Player model stuff
local rig = script.Parent
local humanoid = rig:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

--Preset animations (before loading)
local tutorialAnim1 = rig:WaitForChild("TutorialAnimation")
local tutorialAnim2 = rig:WaitForChild("TutorialAnim2")

--Actual animations (after loading)
local tutorialAnimTrack1 = animator:LoadAnimation(tutorialAnim1)
local tutorialAnimTrack2 = animator:LoadAnimation(tutorialAnim2)

--Scripting animations

task.wait(3)

tutorialAnimTrack1:Play()

task.wait(tutorialAnimTrack1.Length)

tutorialAnimTrack2:Play()
