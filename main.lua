local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

-- SPAWN BUTTON
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 220, 0, 50)
button.Position = UDim2.new(0.5, -110, 0.60, -25)
button.Text = "Spawn Block"
button.Parent = gui

button.BackgroundColor3 = Color3.fromRGB(255,255,255)
button.TextColor3 = Color3.fromRGB(0,120,255)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Active = true
button.Draggable = true

Instance.new("UIStroke", button).Color = Color3.fromRGB(0,120,255)

-- MODE BUTTON
local modeButton = Instance.new("TextButton")
modeButton.Size = UDim2.new(0, 220, 0, 40)
modeButton.Position = UDim2.new(0.5, -110, 0.50, -25)
modeButton.Text = "Mode: FRONT"
modeButton.Parent = gui

modeButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
modeButton.TextColor3 = Color3.fromRGB(0,120,255)
modeButton.TextScaled = true
modeButton.Font = Enum.Font.GothamBold
modeButton.Active = true
modeButton.Draggable = true

Instance.new("UIStroke", modeButton).Color = Color3.fromRGB(0,120,255)

-- AUTO BUTTON
local autoButton = Instance.new("TextButton")
autoButton.Size = UDim2.new(0, 220, 0, 40)
autoButton.Position = UDim2.new(0.5, -110, 0.70, -25)
autoButton.Text = "AUTO: OFF"
autoButton.Parent = gui

autoButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
autoButton.TextColor3 = Color3.fromRGB(0,120,255)
autoButton.TextScaled = true
autoButton.Font = Enum.Font.GothamBold
autoButton.Active = true
autoButton.Draggable = true

Instance.new("UIStroke", autoButton).Color = Color3.fromRGB(0,120,255)

-- STATE
local mode = "FRONT"
local auto = false
local holdingClick = false
local holdingKey = false

-- SPAWN FUNCTION
local function spawnBlock()
    local char = player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local part = Instance.new("Part")
    part.Size = Vector3.new(5,5,5)
    part.Anchored = true
    part.Color = Color3.fromRGB(0,170,255)

    if mode == "FRONT" then
        part.Position = hrp.Position + hrp.CFrame.LookVector * 10
    else
        part.Position = hrp.Position - Vector3.new(0,6,0)
    end

    part.Parent = workspace
end

-- MODE SWITCH
modeButton.MouseButton1Click:Connect(function()
    if mode == "FRONT" then
        mode = "DOWN"
        modeButton.Text = "Mode: DOWN"
    else
        mode = "FRONT"
        modeButton.Text = "Mode: FRONT"
    end
end)

-- AUTO TOGGLE
autoButton.MouseButton1Click:Connect(function()
    auto = not auto

    if auto then
        autoButton.Text = "AUTO: ON"
        autoButton.BackgroundColor3 = Color3.fromRGB(60,200,60)
    else
        autoButton.Text = "AUTO: OFF"
        autoButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
    end
end)

-- CLICK
button.Activated:Connect(function()
    spawnBlock()
end)

-- HOLD CLICK
button.MouseButton1Down:Connect(function()
    holdingClick = true
end)

button.MouseButton1Up:Connect(function()
    holdingClick = false
end)

-- KEYBOARD (T + Y)
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.Y then
        holdingKey = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.Y then
        holdingKey = false
    end
end)

-- LOOP (UPDATED SPEED)
task.spawn(function()
    while true do
        if auto or holdingClick or holdingKey then
            spawnBlock()
            task.wait(0.10) -- ⚡ NEW SPEED
        else
            task.wait(0.1)
        end
    end
end)


AND AGAIN ;

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

-- SPAWN BUTTON
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 220, 0, 50)
button.Position = UDim2.new(0.5, -110, 0.60, -25)
button.Text = "Spawn Block"
button.Parent = gui

button.BackgroundColor3 = Color3.fromRGB(255,255,255)
button.TextColor3 = Color3.fromRGB(0,120,255)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Active = true
button.Draggable = true

Instance.new("UIStroke", button).Color = Color3.fromRGB(0,120,255)

-- MODE BUTTON
local modeButton = Instance.new("TextButton")
modeButton.Size = UDim2.new(0, 220, 0, 40)
modeButton.Position = UDim2.new(0.5, -110, 0.50, -25)
modeButton.Text = "Mode: FRONT"
modeButton.Parent = gui

modeButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
modeButton.TextColor3 = Color3.fromRGB(0,120,255)
modeButton.TextScaled = true
modeButton.Font = Enum.Font.GothamBold
modeButton.Active = true
modeButton.Draggable = true

Instance.new("UIStroke", modeButton).Color = Color3.fromRGB(0,120,255)

-- AUTO BUTTON
local autoButton = Instance.new("TextButton")
autoButton.Size = UDim2.new(0, 220, 0, 40)
autoButton.Position = UDim2.new(0.5, -110, 0.70, -25)
autoButton.Text = "AUTO: OFF"
autoButton.Parent = gui

autoButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
autoButton.TextColor3 = Color3.fromRGB(0,120,255)
autoButton.TextScaled = true
autoButton.Font = Enum.Font.GothamBold
autoButton.Active = true
autoButton.Draggable = true

Instance.new("UIStroke", autoButton).Color = Color3.fromRGB(0,120,255)

-- STATE
local mode = "FRONT"
local auto = false
local holdingClick = false
local holdingKey = false

-- SPAWN FUNCTION
local function spawnBlock()
    local char = player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local part = Instance.new("Part")
    part.Size = Vector3.new(5,5,5)
    part.Anchored = true
    part.Color = Color3.fromRGB(0,170,255)

    if mode == "FRONT" then
        part.Position = hrp.Position + hrp.CFrame.LookVector * 10
    else
        part.Position = hrp.Position - Vector3.new(0,6,0)
    end

    part.Parent = workspace
end

-- MODE SWITCH
modeButton.MouseButton1Click:Connect(function()
    if mode == "FRONT" then
        mode = "DOWN"
        modeButton.Text = "Mode: DOWN"
    else
        mode = "FRONT"
        modeButton.Text = "Mode: FRONT"
    end
end)

-- AUTO TOGGLE
autoButton.MouseButton1Click:Connect(function()
    auto = not auto

    if auto then
        autoButton.Text = "AUTO: ON"
        autoButton.BackgroundColor3 = Color3.fromRGB(60,200,60)
    else
        autoButton.Text = "AUTO: OFF"
        autoButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
    end
end)

-- CLICK
button.Activated:Connect(function()
    spawnBlock()
end)

-- HOLD CLICK
button.MouseButton1Down:Connect(function()
    holdingClick = true
end)

button.MouseButton1Up:Connect(function()
    holdingClick = false
end)

-- KEYBOARD (T + Y)
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.Y then
        holdingKey = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T or input.KeyCode == Enum.KeyCode.Y then
        holdingKey = false
    end
end)

-- LOOP (UPDATED SPEED)
task.spawn(function()
    while true do
        if auto or holdingClick or holdingKey then
            spawnBlock()
            task.wait(0.10) -- ⚡ NEW SPEED
        else
            task.wait(0.1)
        end
    end
end)
