-- Check if BackdoorLegacy already exists.

for _a, CheckBackdoorLegacy in game:GetService('CoreGui'):GetChildren() do
	-- Does it have exact same name and class..?
	if CheckBackdoorLegacy.Name == "BackdoorLegacy" and CheckBackdoorLegacy:IsA("ScreenGuiL") then
		-- If so...DESTROY IT!!!
		CheckBackdoorLegacy:Destroy()
	end
end

-- Create GUI Objects

local ScrnGui = Instance.new("ScreenGui")
local MnPrt = Instance.new("Frame")
local InPrt = Instance.new("Frame")
local Cody = Instance.new("TextBox")
local Execy = Instance.new("TextButton")
local Labely = Instance.new("TextLabel")

-- Set Properties

ScrnGui.Name = "BackdoorLegacy"
ScrnGui.Parent = game:GetService('CoreGui')
ScrnGui.ResetOnSpawn = false

MnPrt.Active = true
MnPrt.BackgroundColor3 = Color3.new(0,0,0)
MnPrt.BorderColor3 = Color3.new(1,0,0)
MnPrt.Name = "MainPart"
MnPrt.Parent = ScrnGui
MnPrt.Position = UDim2.new(.5,-180,.5,-120)
MnPrt.Size = UDim2.new(0,360,0,240)
MnPrt.Draggable = true

InPrt.Active = true
InPrt.BackgroundColor3 = Color3.new(0,0,0)
InPrt.BorderColor3 = Color3.new(1,0,0)
InPrt.Name = "Inside"
InPrt.Parent = MnPrt
InPrt.Position = UDim2.new(0,0,0,50)
InPrt.Size = UDim2.new(0,360,0,190)
InPrt.Draggable = false

Cody.Active = true
Cody.BackgroundColor3 = Color3.new(0,0,0)
Cody.BorderColor3 = Color3.new(1,0,0)
Cody.ClearTextOnFocus = false
Cody.MultiLine = true
Cody.Name = "Code"
Cody.Parent = InPrt
Cody.Position = UDim2.new(0,5,0,5)
Cody.Size = UDim2.new(0,350,0,140)
Cody.Font = Enum.Font.Legacy
Cody.FontSize = Enum.FontSize.Size8
Cody.Text = 'Instance.new("Part").Parent = game:GetService("Workspace");'
Cody.TextColor3 = Color3.new(1,0,0)
Cody.TextWrapped = true
Cody.TextXAlignment = Enum.TextXAlignment.Left
Cody.TextYAlignment = Enum.TextYAlignment.Top

Execy.Active = true
Execy.BackgroundColor3 = Color3.new(0,0,0)
Execy.BorderColor3 = Color3.new(1,0,0)
Execy.Name = "Execute"
Execy.Parent = InPrt
Execy.Position = UDim2.new(0,60,0,150)
Execy.Size = UDim2.new(0,240,0,35)
Execy.Font = Enum.Font.Legacy
Execy.FontSize = Enum.FontSize.Size14
Execy.Text = 'Execute!'
Execy.TextColor3 = Color3.new(1,0,0)

Labely.Active = true
Labely.BackgroundColor3 = Color3.new(0,0,0)
Labely.BorderColor3 = Color3.new(1,0,0)
Labely.Name = "Title"
Labely.Parent = MnPrt
Labely.Position = UDim2.new(0,180,0,25)
Labely.Size = UDim2.new(0,0,0,0)
Labely.Font = Enum.Font.Legacy
Labely.FontSize = Enum.FontSize.Size14
Labely.Text = 'Backdoor Legacy'
Labely.TextColor3 = Color3.new(1,0,0)

-- Let the Execute button operate!

Execy.MouseButton1Click:Connect(function()
	-- Fetch code from TextBox.
	local CodeStr = Cody.Text
	local InvokeFunc = Instance.new("BindableEvent")
	InvokeFunc.Event:Connect(function(rfunc,codestr2)
		-- This invokes the RemoteFunction without waiting.
		rfunc:InvokeServer(codestr2)
	end)
	local function DeepFire(inst)
		-- Search every descendant of DataModel.
		for _, childy in inst:GetChildren() do
			-- We don't want remotes from RobloxReplicatedStorage!
			if childy.Parent ~= game:GetService('RobloxReplicatedStorage') then
				-- Check the class of the descendant.
				if childy:IsA("RemoteEvent") then
					-- If it is a RemoteEvent, fire it with code!
					childy:FireServer(CodeStr)
				elseif childy:IsA("RemoteFunction") then
					-- Else if it is a RemoteFunction, invoke it with code!
					InvokeFunc:Fire(childy, CodeStr)
				end
			end
				-- Keep looping through descendants, until dead end.
			DeepFire(childy)
		end
	end
	-- Call the function!
	DeepFire(game)
end)

-- That's the end of the code!
