-- Johan Kamek ⚡ Hub
-- ESP & Big Head Script
-- 100% Work

local Player = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Membuat GUI Utama
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JohanKamekHub"
ScreenGui.Parent = CoreGui

-- Frame Utama
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Judul
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BackgroundTransparency = 0.2
Title.BorderSizePixel = 0
Title.Text = "Johan Kamek ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Tab Buttons
local ESPTab = Instance.new("TextButton")
ESPTab.Name = "ESPTab"
ESPTab.Size = UDim2.new(0.5, -1, 0, 40)
ESPTab.Position = UDim2.new(0, 0, 0, 40)
ESPTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ESPTab.BackgroundTransparency = 0.3
ESPTab.BorderSizePixel = 0
ESPTab.Text = "ESP"
ESPTab.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPTab.TextScaled = true
ESPTab.Font = Enum.Font.GothamBold
ESPTab.Parent = MainFrame

local BigHeadTab = Instance.new("TextButton")
BigHeadTab.Name = "BigHeadTab"
BigHeadTab.Size = UDim2.new(0.5, -1, 0, 40)
BigHeadTab.Position = UDim2.new(0.5, 1, 0, 40)
BigHeadTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BigHeadTab.BackgroundTransparency = 0.3
BigHeadTab.BorderSizePixel = 0
BigHeadTab.Text = "BIG HEAD"
BigHeadTab.TextColor3 = Color3.fromRGB(255, 255, 255)
BigHeadTab.TextScaled = true
BigHeadTab.Font = Enum.Font.GothamBold
BigHeadTab.Parent = MainFrame

-- Container untuk konten tab
local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -20, 1, -100)
ContentContainer.Position = UDim2.new(0, 10, 0, 90)
ContentContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ContentContainer.BackgroundTransparency = 0.2
ContentContainer.BorderSizePixel = 0
ContentContainer.Parent = MainFrame

-- ESP Tab Content
local ESPContent = Instance.new("ScrollingFrame")
ESPContent.Name = "ESPContent"
ESPContent.Size = UDim2.new(1, 0, 1, 0)
ESPContent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ESPContent.BackgroundTransparency = 0.3
ESPContent.BorderSizePixel = 0
ESPContent.ScrollBarThickness = 5
ESPContent.Visible = true
ESPContent.Parent = ContentContainer

-- Big Head Tab Content
local BigHeadContent = Instance.new("ScrollingFrame")
BigHeadContent.Name = "BigHeadContent"
BigHeadContent.Size = UDim2.new(1, 0, 1, 0)
BigHeadContent.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BigHeadContent.BackgroundTransparency = 0.3
BigHeadContent.BorderSizePixel = 0
BigHeadContent.ScrollBarThickness = 5
BigHeadContent.Visible = false
BigHeadContent.Parent = ContentContainer

-- Fungsi untuk mengganti tab
local function switchTab(tab)
    if tab == "ESP" then
        ESPTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        BigHeadTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ESPContent.Visible = true
        BigHeadContent.Visible = false
    elseif tab == "BIGHEAD" then
        ESPTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        BigHeadTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        ESPContent.Visible = false
        BigHeadContent.Visible = true
    end
end

ESPTab.MouseButton1Click:Connect(function()
    switchTab("ESP")
end)

BigHeadTab.MouseButton1Click:Connect(function()
    switchTab("BIGHEAD")
end)

-- ========== ESP SYSTEM ==========
local ESPEnabled = false
local ESPObjects = {}
local LineColor = Color3.fromRGB(255, 0, 0)
local BoxColor = Color3.fromRGB(255, 0, 0)
local TextColor = Color3.fromRGB(255, 255, 255)

-- ESP Toggle
local ESPToggle = Instance.new("TextButton")
ESPToggle.Name = "ESPToggle"
ESPToggle.Size = UDim2.new(1, -20, 0, 35)
ESPToggle.Position = UDim2.new(0, 10, 0, 10)
ESPToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ESPToggle.BackgroundTransparency = 0.3
ESPToggle.BorderSizePixel = 0
ESPToggle.Text = "ESP: OFF"
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.TextScaled = true
ESPToggle.Font = Enum.Font.GothamBold
ESPToggle.Parent = ESPContent

-- Through Wall Toggle
local ThroughWallToggle = Instance.new("TextButton")
ThroughWallToggle.Name = "ThroughWallToggle"
ThroughWallToggle.Size = UDim2.new(1, -20, 0, 35)
ThroughWallToggle.Position = UDim2.new(0, 10, 0, 55)
ThroughWallToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ThroughWallToggle.BackgroundTransparency = 0.3
ThroughWallToggle.BorderSizePixel = 0
ThroughWallToggle.Text = "Through Wall: ON"
ThroughWallToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ThroughWallToggle.TextScaled = true
ThroughWallToggle.Font = Enum.Font.GothamBold
ThroughWallToggle.Parent = ESPContent

-- Line Opacity Slider Label
local LineOpacityLabel = Instance.new("TextLabel")
LineOpacityLabel.Name = "LineOpacityLabel"
LineOpacityLabel.Size = UDim2.new(1, -20, 0, 25)
LineOpacityLabel.Position = UDim2.new(0, 10, 0, 100)
LineOpacityLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LineOpacityLabel.BackgroundTransparency = 0.3
LineOpacityLabel.BorderSizePixel = 0
LineOpacityLabel.Text = "Line Opacity: 0.2"
LineOpacityLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LineOpacityLabel.TextScaled = true
LineOpacityLabel.Font = Enum.Font.Gotham
LineOpacityLabel.Parent = ESPContent

-- Line Opacity Slider
local LineOpacitySlider = Instance.new("Frame")
LineOpacitySlider.Name = "LineOpacitySlider"
LineOpacitySlider.Size = UDim2.new(1, -20, 0, 10)
LineOpacitySlider.Position = UDim2.new(0, 10, 0, 130)
LineOpacitySlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
LineOpacitySlider.BorderSizePixel = 0
LineOpacitySlider.Parent = ESPContent

local LineOpacityButton = Instance.new("TextButton")
LineOpacityButton.Name = "LineOpacityButton"
LineOpacityButton.Size = UDim2.new(0.2, 0, 1, 0)
LineOpacityButton.Position = UDim2.new(0, 0, 0, 0)
LineOpacityButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
LineOpacityButton.BorderSizePixel = 0
LineOpacityButton.Text = ""
LineOpacityButton.Parent = LineOpacitySlider

local LineOpacity = 0.2

-- Fungsi untuk update opacity line
local function updateLineOpacity()
    LineOpacity = LineOpacityButton.Position.X.Scale
    LineOpacityLabel.Text = "Line Opacity: " .. string.format("%.1f", LineOpacity)
    
    for _, espObj in pairs(ESPObjects) do
        if espObj and espObj.Line then
            espObj.Line.Transparency = 1 - LineOpacity
        end
    end
end

LineOpacityButton.MouseButton1Down:Connect(function()
    local dragging = true
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not dragging then
            connection:Disconnect()
            return
        end
        local mousePos = UserInputService:GetMouseLocation()
        local absPos = LineOpacitySlider.AbsolutePosition
        local absSize = LineOpacitySlider.AbsoluteSize
        local relativeX = math.clamp(mousePos.X - absPos.X, 0, absSize.X)
        local scale = relativeX / absSize.X
        LineOpacityButton.Position = UDim2.new(scale, 0, 0, 0)
        updateLineOpacity()
    end)
    
    local inputEnded
    inputEnded = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            connection:Disconnect()
            inputEnded:Disconnect()
        end
    end)
end)

-- Auto Execute Toggle
local AutoExecuteToggle = Instance.new("TextButton")
AutoExecuteToggle.Name = "AutoExecuteToggle"
AutoExecuteToggle.Size = UDim2.new(1, -20, 0, 35)
AutoExecuteToggle.Position = UDim2.new(0, 10, 0, 155)
AutoExecuteToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoExecuteToggle.BackgroundTransparency = 0.3
AutoExecuteToggle.BorderSizePixel = 0
AutoExecuteToggle.Text = "Auto Execute: ON"
AutoExecuteToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoExecuteToggle.TextScaled = true
AutoExecuteToggle.Font = Enum.Font.GothamBold
AutoExecuteToggle.Parent = ESPContent

-- ========== BIG HEAD SYSTEM ==========
local BigHeadEnabled = false
local BigHeadSize = 5

-- Big Head Toggle
local BigHeadToggle = Instance.new("TextButton")
BigHeadToggle.Name = "BigHeadToggle"
BigHeadToggle.Size = UDim2.new(1, -20, 0, 35)
BigHeadToggle.Position = UDim2.new(0, 10, 0, 10)
BigHeadToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BigHeadToggle.BackgroundTransparency = 0.3
BigHeadToggle.BorderSizePixel = 0
BigHeadToggle.Text = "BIG HEAD: OFF"
BigHeadToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BigHeadToggle.TextScaled = true
BigHeadToggle.Font = Enum.Font.GothamBold
BigHeadToggle.Parent = BigHeadContent

-- Big Head Size Slider Label
local BigHeadSizeLabel = Instance.new("TextLabel")
BigHeadSizeLabel.Name = "BigHeadSizeLabel"
BigHeadSizeLabel.Size = UDim2.new(1, -20, 0, 25)
BigHeadSizeLabel.Position = UDim2.new(0, 10, 0, 55)
BigHeadSizeLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BigHeadSizeLabel.BackgroundTransparency = 0.3
BigHeadSizeLabel.BorderSizePixel = 0
BigHeadSizeLabel.Text = "Head Size: 5"
BigHeadSizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BigHeadSizeLabel.TextScaled = true
BigHeadSizeLabel.Font = Enum.Font.Gotham
BigHeadSizeLabel.Parent = BigHeadContent

-- Big Head Size Slider
local BigHeadSlider = Instance.new("Frame")
BigHeadSlider.Name = "BigHeadSlider"
BigHeadSlider.Size = UDim2.new(1, -20, 0, 10)
BigHeadSlider.Position = UDim2.new(0, 10, 0, 85)
BigHeadSlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
BigHeadSlider.BorderSizePixel = 0
BigHeadSlider.Parent = BigHeadContent

local BigHeadButton = Instance.new("TextButton")
BigHeadButton.Name = "BigHeadButton"
BigHeadButton.Size = UDim2.new(0.2, 0, 1, 0)
BigHeadButton.Position = UDim2.new(0.2, 0, 0, 0)
BigHeadButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BigHeadButton.BorderSizePixel = 0
BigHeadButton.Text = ""
BigHeadButton.Parent = BigHeadSlider

-- Fungsi untuk update big head size
local function updateBigHeadSize()
    BigHeadSize = math.floor(BigHeadButton.Position.X.Scale * 10)
    if BigHeadSize < 1 then BigHeadSize = 1 end
    BigHeadSizeLabel.Text = "Head Size: " .. BigHeadSize
    
    if BigHeadEnabled then
        for _, player in pairs(Player:GetPlayers()) do
            if player ~= Player.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                head.Size = Vector3.new(BigHeadSize, BigHeadSize, BigHeadSize)
            end
        end
    end
end

BigHeadButton.MouseButton1Down:Connect(function()
    local dragging = true
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not dragging then
            connection:Disconnect()
            return
        end
        local mousePos = UserInputService:GetMouseLocation()
        local absPos = BigHeadSlider.AbsolutePosition
        local absSize = BigHeadSlider.AbsoluteSize
        local relativeX = math.clamp(mousePos.X - absPos.X, 0, absSize.X)
        local scale = relativeX / absSize.X
        BigHeadButton.Position = UDim2.new(scale, 0, 0, 0)
        updateBigHeadSize()
    end)
    
    local inputEnded
    inputEnded = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            connection:Disconnect()
            inputEnded:Disconnect()
        end
    end)
end)

-- Initialize big head button position
BigHeadButton.Position = UDim2.new(0.5, 0, 0, 0) -- Size 5

-- ========== ESP FUNCTIONS ==========
local function createESP(player)
    if not player.Character then return end
    
    local character = player.Character
    local humanoid = character:FindFirstChild("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not rootPart then return end
    
    -- Box
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP_Box"
    box.Size = Vector3.new(4, 5, 2)
    box.AlwaysOnTop = true
    box.ZIndex = 5
    box.Adornee = character
    box.Color3 = BoxColor
    box.Transparency = 0.3
    box.Visible = ESPEnabled
    box.Parent = character
    
    -- Line (through wall)
    local line = Instance.new("SelectionBox")
    line.Name = "ESP_Line"
    line.Adornee = character
    line.LineThickness = 0.05
    line.Color3 = LineColor
    line.Transparency = 1 - LineOpacity
    line.SurfaceTransparency = 1
    line.Visible = ESPEnabled
    line.Parent = character
    
    -- Name tag
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Name"
    billboard.Adornee = rootPart
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = ESPEnabled
    billboard.Parent = character
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "Name"
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = TextColor
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Parent = billboard
    
    table.insert(ESPObjects, {
        Player = player,
        Box = box,
        Line = line,
        Billboard = billboard
    })
end

local function removeESP(player)
    for i, espObj in pairs(ESPObjects) do
        if espObj.Player == player then
            if espObj.Box then espObj.Box:Destroy() end
            if espObj.Line then espObj.Line:Destroy() end
            if espObj.Billboard then espObj.Billboard:Destroy() end
            table.remove(ESPObjects, i)
        end
    end
end

local function updateESPVisibility()
    for _, espObj in pairs(ESPObjects) do
        if espObj.Box then espObj.Box.Visible = ESPEnabled end
        if espObj.Line then espObj.Line.Visible = ESPEnabled end
        if espObj.Billboard then espObj.Billboard.Enabled = ESPEnabled end
    end
end

-- ========== BIG HEAD FUNCTIONS ==========
local function setBigHead(player, enabled)
    if player == Player.LocalPlayer then return end
    if not player.Character then return end
    
    local head = player.Character:FindFirstChild("Head")
    if head then
        if enabled then
            head.Size = Vector3.new(BigHeadSize, BigHeadSize, BigHeadSize)
        else
            head.Size = Vector3.new(2, 1, 1) -- Ukuran normal head
        end
    end
end

local function updateAllBigHeads()
    for _, player in pairs(Player:GetPlayers()) do
        setBigHead(player, BigHeadEnabled)
    end
end

-- ========== EVENT HANDLERS ==========
-- ESP Toggle
ESPToggle.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ESPToggle.Text = "ESP: " .. (ESPEnabled and "ON" or "OFF")
    ESPToggle.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    updateESPVisibility()
end)

-- Through Wall Toggle
local throughWall = true
ThroughWallToggle.MouseButton1Click:Connect(function()
    throughWall = not throughWall
    ThroughWallToggle.Text = "Through Wall: " .. (throughWall and "ON" or "OFF")
    ThroughWallToggle.BackgroundColor3 = throughWall and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    
    for _, espObj in pairs(ESPObjects) do
        if espObj.Line then
            espObj.Line.AlwaysOnTop = throughWall
        end
    end
end)

-- Auto Execute Toggle
local autoExecute = true
AutoExecuteToggle.MouseButton1Click:Connect(function()
    autoExecute = not autoExecute
    AutoExecuteToggle.Text = "Auto Execute: " .. (autoExecute and "ON" or "OFF")
    AutoExecuteToggle.BackgroundColor3 = autoExecute and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

-- Big Head Toggle
BigHeadToggle.MouseButton1Click:Connect(function()
    BigHeadEnabled = not BigHeadEnabled
    BigHeadToggle.Text = "BIG HEAD: " .. (BigHeadEnabled and "ON" or "OFF")
    BigHeadToggle.BackgroundColor3 = BigHeadEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    updateAllBigHeads()
end)

-- Player Added
Player.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        task.wait(0.5)
        createESP(player)
        
        if autoExecute then
            -- Auto execute will handle through wall setting
            if throughWall then
                task.wait(0.1)
                for _, espObj in pairs(ESPObjects) do
                    if espObj.Player == player and espObj.Line then
                        espObj.Line.AlwaysOnTop = true
                    end
                end
            end
        end
        
        if BigHeadEnabled then
            setBigHead(player, true)
        end
    end)
    
    if player.Character then
        task.wait(0.5)
        createESP(player)
        
        if BigHeadEnabled then
            setBigHead(player, true)
        end
    end
end)

-- Player Removed
Player.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- Existing Players
for _, player in pairs(Player:GetPlayers()) do
    if player ~= Player.LocalPlayer then
        if player.Character then
            task.wait(0.5)
            createESP(player)
            
            if BigHeadEnabled then
                setBigHead(player, true)
            end
        end
        
        player.CharacterAdded:Connect(function(character)
            task.wait(0.5)
            createESP(player)
            
            if BigHeadEnabled then
                setBigHead(player, true)
            end
        end)
    end
end

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BackgroundTransparency = 0.2
CloseButton.BorderSizePixel = 0
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("Johan Kamek ⚡ Hub loaded successfully! 100% WORK")
