local toolbar = plugin:CreateToolbar("Random Colorizer")
local button = toolbar:CreateButton("Colorize","Gives all selected parts a random color","rbxassetid://15415997817")

local selectionService = game:GetService("Selection")
local changeHistoryService = game:GetService("ChangeHistoryService")

function setwaypoint()
	changeHistoryService:SetWaypoint("Colorizer")
end

button.Click:Connect(function()
	setwaypoint()
	
	local selection = selectionService:Get()
	
	for index,part in selection do
		if part:isA("BasePart") then
			part.Color = BrickColor.random().Color
		end
	end
	
	setwaypoint()
end)
