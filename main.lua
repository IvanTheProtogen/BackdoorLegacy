-- If all players jump when executed, it means the game is backdoored! --

for i,v in pairs(game:GetService('Players'):GetPlayers()) do 
  if v.Character ~= nil and v.Character:IsA("Model") and v.Character:FindFirstChildWhichIsA("Humanoid") then 
    v.Character:FindFirstChildWhichIsA("Humanoid").Jump = true 
  end
end

----- CHANGELOGS -----

-- v1.0.0 | First publish.
-- v1.1.0 | New acquire feature V1.

----- CHANGELOGS -----
