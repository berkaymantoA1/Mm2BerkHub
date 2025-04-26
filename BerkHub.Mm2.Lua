-- MM2 HUB Script with BerkHub Rainbow Text

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ESPButton = Instance.new("TextButton")
local AutoFarmButton = Instance.new("TextButton")
local GodmodeButton = Instance.new("TextButton")
local RoleInfo = Instance.new("TextLabel")
local ToggleRoleButton = Instance.new("TextButton")
local BerkHubText = Instance.new("TextLabel")

-- Parent Setup
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true  -- Now draggable
MainFrame.BackgroundTransparency = 0.25
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.LayoutOrder = 1
MainFrame.BorderRadius = UDim.new(0, 20) -- Rounded corners

-- BerkHub Rainbow Text
BerkHubText.Name = "BerkHubText"
BerkHubText.Parent = MainFrame
BerkHubText.BackgroundTransparency = 1
BerkHubText.Size = UDim2.new(1, 0, 0, 50)
BerkHubText.Font = Enum.Font.GothamBold
BerkHubText.TextSize = 28
BerkHubText.TextColor3 = Color3.fromRGB(255, 255, 255)
BerkHubText.TextStrokeTransparency = 0.6
BerkHubText.Text = "BerkHub"
BerkHubText.TextAlignment = Enum.TextAlignment.Center
BerkHubText.Position = UDim2.new(0, 0, 0, 0)

-- Rainbow effect for the text
local function changeColor()
    while true do
        for i = 0, 255, 5 do
            BerkHubText.TextColor3 = Color3.fromHSV(i/255, 1, 1)
            wait(0.05)
        end
    end
end

-- Start the rainbow effect
coroutine.wrap(changeColor)()

-- Title
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "MM2 HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.TextStrokeTransparency = 0.6
Title.BorderSizePixel = 0
Title.BorderRadius = UDim.new(0, 15) -- Rounded corners

-- ESP Button
ESPButton.Name = "ESPButton"
ESPButton.Parent = MainFrame
ESPButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ESPButton.Position = UDim2.new(0.1, 0, 0.2, 0)
ESPButton.Size = UDim2.new(0.8, 0, 0, 40)
ESPButton.Font = Enum.Font.GothamBold
ESPButton.Text = "Enable ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.TextSize = 20
ESPButton.BorderSizePixel = 0
ESPButton.BorderRadius = UDim.new(0, 12) -- Rounded corners
ESPButton.MouseEnter:Connect(function()
    ESPButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)
ESPButton.MouseLeave:Connect(function()
    ESPButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

-- AutoFarm Button
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.35, 0)
AutoFarmButton.Size = UDim2.new(0.8, 0, 0, 40)
AutoFarmButton.Font = Enum.Font.GothamBold
AutoFarmButton.Text = "Enable AutoFarm"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.TextSize = 20
AutoFarmButton.BorderSizePixel = 0
AutoFarmButton.BorderRadius = UDim.new(0, 12) -- Rounded corners
AutoFarmButton.MouseEnter:Connect(function()
    AutoFarmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)
AutoFarmButton.MouseLeave:Connect(function()
    AutoFarmButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

-- Godmode Button
GodmodeButton.Name = "GodmodeButton"
GodmodeButton.Parent = MainFrame
GodmodeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
GodmodeButton.Position = UDim2.new(0.1, 0, 0.5, 0)
GodmodeButton.Size = UDim2.new(0.8, 0, 0, 40)
GodmodeButton.Font = Enum.Font.GothamBold
GodmodeButton.Text = "Enable Godmode"
GodmodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GodmodeButton.TextSize = 20
GodmodeButton.BorderSizePixel = 0
GodmodeButton.BorderRadius = UDim.new(0, 12) -- Rounded corners
GodmodeButton.MouseEnter:Connect(function()
    GodmodeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)
GodmodeButton.MouseLeave:Connect(function()
    GodmodeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

-- Role Info TextLabel
RoleInfo.Name = "RoleInfo"
RoleInfo.Parent = MainFrame
RoleInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RoleInfo.Position = UDim2.new(0.1, 0, 0.7, 0)
RoleInfo.Size = UDim2.new(0.8, 0, 0, 60)
RoleInfo.Font = Enum.Font.Gotham
RoleInfo.Text = "Murderer: Unknown\nSheriff: Unknown"
RoleInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
RoleInfo.TextSize = 18
RoleInfo.TextWrapped = true
RoleInfo.BorderSizePixel = 0
RoleInfo.Visible = false

-- Toggle Role Info Button
ToggleRoleButton.Name = "ToggleRoleButton"
ToggleRoleButton.Parent = MainFrame
ToggleRoleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ToggleRoleButton.Position = UDim2.new(0.1, 0, 0.65, 0)
ToggleRoleButton.Size = UDim2.new(0.8, 0, 0, 30)
ToggleRoleButton.Font = Enum.Font.GothamBold
ToggleRoleButton.Text = "Show Role Info"
ToggleRoleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleRoleButton.TextSize = 16
ToggleRoleButton.BorderSizePixel = 0
ToggleRoleButton.BorderRadius = UDim.new(0, 12) -- Rounded corners
ToggleRoleButton.MouseEnter:Connect(function()
    ToggleRoleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)
ToggleRoleButton.MouseLeave:Connect(function()
    ToggleRoleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
end)

-- Functions
ToggleRoleButton.MouseButton1Click:Connect(function()
    RoleInfo.Visible = not RoleInfo.Visible
    if RoleInfo.Visible then
        ToggleRoleButton.Text = "Hide Role Info"
    else
        ToggleRoleButton.Text = "Show Role Info"
    end
end)

-- Murderer and Sheriff Detection (Example Code)
local function UpdateRoles()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Backpack:FindFirstChild("Knife") then
            RoleInfo.Text = "Murderer: "..v.Name.."\nSheriff: Unknown"
        elseif v.Backpack:FindFirstChild("Gun") then
            local murdererName = RoleInfo.Text:match("Murderer: (.-)\n") or "Unknown"
            RoleInfo.Text = "Murderer: "..murdererName.."\nSheriff: "..v.Name
        end
    end
end

game.Players.PlayerAdded:Connect(UpdateRoles)
game.Players.PlayerRemoving:Connect(UpdateRoles)
while task.wait(2) do
    UpdateRoles()
end

-- Smooth Drag Function
local dragging = false
local dragInput, mousePos, framePos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.User
