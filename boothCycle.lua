local phrases = {
    "🎁 Spin the wheel! Donate to reveal your prize (it's joy 😄)",
    "💸 Broke IRL? At least help me be rich here!",
    "🧠 Donating increases IQ (unconfirmed, but try it)",
    "🐟 I need Robux to feed my pet fish 😭",
    "🎮 Goal: 69 Robux. Why? Just feels right.",
    "🔥 Donate = +10 style points instantly",
    "👽 Help a fellow NPC become sentient",
    "📉 Every second you don’t donate, I lose hope"
}

local rep = game:GetService("ReplicatedStorage")
local updateEvent = rep:WaitForChild("UpdateStand")
local player = game.Players.LocalPlayer

local function getStandId()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "Booth" and v:FindFirstChild("Owner") and v.Owner.Value == player then
            return v:FindFirstChild("ID") and v.ID.Value
        end
    end
end

local standId = getStandId()
if not standId then
    warn("No tienes un stand reclamado aún.")
    return
end

spawn(function()
    while true do
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and player.Character.PrimaryPart then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            player.Character:SetPrimaryPartCFrame(player.Character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(15), 0))
        end
        wait(2)
    end
end)

while true do
    for _, msg in pairs(phrases) do
        updateEvent:FireServer(standId, msg)
        wait(6)
    end
end
