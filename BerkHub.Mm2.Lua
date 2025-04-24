-- BerkHub V1 GUI Script

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- GUI Oluştur
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "BerkHubMM2"

-- Arka Plan (Frame) - Gradient ve Saydam
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.1
Frame.Active = true
Frame.Draggable = true

-- Gradient Arka Plan
local uiGradient = Instance.new("UIGradient", Frame)
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 80))
}
uiGradient.Rotation = 45

-- Başlık
local title = Instance.new("TextLabel", Frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "BerkHub V1"
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextStrokeTransparency = 0.7

-- Rainbow başlık efekti
spawn(function()
    while wait(0.1) do
        title.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

-- Roller Label (Üstte)
local InfoLabel = Instance.new("TextLabel", ScreenGui)
InfoLabel.Size = UDim2.new(0, 400, 0, 40)
InfoLabel.Position = UDim2.new(0.5, -200, 0, 60)
InfoLabel.BackgroundTransparency = 0.3
InfoLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfoLabel.TextColor3 = Color3.new(1, 1, 1)
InfoLabel.Font = Enum.Font.SourceSansBold
InfoLabel.TextSize = 20
InfoLabel.Text = "BerkHub V1 Başlatıldı"
InfoLabel.Visible = false

-- Murderer ve Sheriff İsimlerini Gösteren TextLabel
local murdererSheriffLabel = Instance.new("TextLabel", ScreenGui)
murdererSheriffLabel.Size = UDim2.new(0, 400, 0, 40)
murdererSheriffLabel.Position = UDim2.new(0.5, -200, 0, 110)
murdererSheriffLabel.BackgroundTransparency = 0.3
murdererSheriffLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
murdererSheriffLabel.TextColor3 = Color3.new(1, 1, 1)
murdererSheriffLabel.Font = Enum.Font.SourceSansBold
murdererSheriffLabel.TextSize = 20
murdererSheriffLabel.Text = "Murderer : - | Sheriff : -"
murdererSheriffLabel.Visible = false -- Başlangıçta gizli

-- Buton Oluşturma Fonksiyonu
local function createButton(text, pos, callback)
    local button = Instance.new("TextButton", Frame)
    button.Size = UDim2.new(0, 360, 0, 50)
    button.Position = UDim2.new(0, 20, 0, pos)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.Gotham
    button.TextSize = 20
    button.Text = text
    button.TextStrokeTransparency = 0.5
    button.BorderRadius = UDim.new(0, 10)
    button.MouseButton1Click:Connect(callback)

    -- Hover Efekti
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    return button
end

-- Coin Farm
local farming = false
createButton("Coin Farm", 60, function()
    farming = not farming
    InfoLabel.Text = farming and "Coin Farm Aktif" or "Coin Farm Kapalı"
    InfoLabel.Visible = true
    if farming then
        task.spawn(function()
            while farming do
                for _,v in pairs(Workspace:GetChildren()) do
                    if v.Name == "CoinContainer" then
                        for _, coin in pairs(v:GetChildren()) do
                            if coin:IsA("BasePart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = coin.CFrame
                                wait(0.2)
                            end
                        end
                    end
                end
                wait(0.5)
            end
        end)
    end
end)

-- ESP Fonksiyonu
local function createESP(player, color)
    if player.Character and not player.Character:FindFirstChild("BerkESP") then
        local highlight = Instance.new("Highlight", player.Character)
        highlight.Name = "BerkESP"
        highlight.FillColor = color
        highlight.OutlineColor = color
        highlight.Adornee = player.Character
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

-- Murderer & Sheriff ESP
createButton("Murderer & Sheriff ESP", 120, function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Backpack then
            for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool.Name == "Knife" then
                    createESP(player, Color3.new(1, 0, 0)) -- Kırmızı = Murderer
                elseif tool.Name == "Gun" then
                    createESP(player, Color3.new(0, 0, 1)) -- Mavi = Sheriff
                end
            end
        end
    end
    InfoLabel.Text = "ESP Aktif Edildi"
    InfoLabel.Visible = true
end)

-- Roller Göstermek için Buton
createButton("Murderer & Sheriff Name", 180, function()
    local murderer = "Bulunamadı"
    local sheriff = "Bulunamadı"
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Backpack then
            for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool.Name == "Knife" then
                    murderer = player.Name
                elseif tool.Name == "Gun" then
                    sheriff = player.Name
                end
            end
        end
    end
    
    murdererSheriffLabel.Text = "Murderer : " .. murderer .. " | Sheriff : " .. sheriff
end)

-- Buton ile Murderer & Sheriff Label Gösterme/Kapatma
createButton("Toggle Murderer & Sheriff", 240, function()
    murdererSheriffLabel.Visible = not murdererSheriffLabel.Visible
end)

-- Minimize/Kapatma Butonu
local minimizeButton = Instance.new("TextButton", Frame)
minimizeButton.Size = UDim2.new(0, 360, 0, 50)
minimizeButton.Position = UDim2.new(0, 20, 0, 280)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Font = Enum.Font.Gotham
minimizeButton.TextSize = 20
minimizeButton.Text = "Minimize"
minimizeButton.TextStrokeTransparency = 0.5
minimizeButton.BorderRadius = UDim.new(0, 10)
minimizeButton.MouseButton1Click:Connect(function()
    -- Animasyonla Frame'i yukarı kaydır ve başlık da kaybolsun
    local tweenService = game:GetService("TweenService")
    local goal = {Position = UDim2.new(0.5, -200, 0, -100)}
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = tweenService:Create(Frame, tweenInfo, goal)
    tween:Play()

    -- Başlık da kaybolacak
    local goalTitle = {Position = UDim2.new(0.5, -200, 0, -50)}
    local tweenTitle = tweenService:Create(title, tweenInfo
