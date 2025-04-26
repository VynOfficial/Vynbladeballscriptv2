--// REAL Blade Ball Auto Parry
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local humanoidRootPart = char:WaitForChild("HumanoidRootPart")

-- Find the "Parry" function
local replicatedStorage = game:GetService("ReplicatedStorage")
local parryRemote = replicatedStorage:WaitForChild("Remotes"):WaitForChild("Parry")

-- Settings
local parryDistance = 25 -- distance to auto-parry (edit this if needed)

-- Auto Parry Loop
game:GetService("RunService").Heartbeat:Connect(function()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Part") and v.Name == "Ball" then
            local distance = (v.Position - humanoidRootPart.Position).Magnitude
            if distance <= parryDistance then
                parryRemote:FireServer()
            end
        end
    end
end)