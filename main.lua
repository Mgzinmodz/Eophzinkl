--// SERVICES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

--// VARIAVEIS
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Mouse = Player:GetMouse()

--// CONFIG
local Config = {
    AutoFarm = false,
    AutoCollect = false
}

--// CRIAÇÃO DA GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MGCheats"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--// MAIN FRAME
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Main.BorderColor3 = Color3.fromRGB(0, 255, 100)
Main.BorderSizePixel = 2
Main.Position = UDim2.new(0.05, 0, 0.2, 0)
Main.Size = UDim2.new(0, 300, 0, 450)
Main.ClipsDescendants = true

--// TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
TopBar.BorderColor3 = Color3.fromRGB(0, 255, 100)
TopBar.Size = UDim2.new(1, 0, 0, 40)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "💜 MG CHEATS 💜"
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.TextSize = 18

--// BOTAO DE MINIMIZAR (-)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinBtn"
MinimizeBtn.Parent = TopBar
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
MinimizeBtn.BorderColor3 = Color3.fromRGB(0, 255, 100)
MinimizeBtn.Position = UDim2.new(0.82, 0, 0.1, 0)
MinimizeBtn.Size = UDim2.new(0.15, 0, 0.8, 0)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinimizeBtn.TextSize = 20

--// BOLINHA FLUTUANTE (QUANDO MINIMIZA)
local MiniBall = Instance.new("TextButton")
MiniBall.Name = "MiniBall"
MiniBall.Parent = ScreenGui
MiniBall.BackgroundColor3 = Color3.fromRGB(126, 34, 206)
MiniBall.BorderColor3 = Color3.fromRGB(0, 255, 100)
MiniBall.BorderSizePixel = 3
MiniBall.Size = UDim2.new(0, 60, 0, 60)
MiniBall.Position = UDim2.new(0.02, 0, 0.02, 0)
MiniBall.Font = Enum.Font.GothamBold
MiniBall.Text = "MG"
MiniBall.TextColor3 = Color3.fromRGB(255,255,255)
MiniBall.TextSize = 20
MiniBall.Visible = false

--// CONTEUDO
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = Main
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0.05, 0, 0.12, 0)
Content.Size = UDim2.new(0.9, 0, 0.8, 0)

--// BOTOES
local AutoFarmBtn = Instance.new("TextButton")
AutoFarmBtn.Parent = Content
AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
AutoFarmBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
AutoFarmBtn.Size = UDim2.new(1, 0, 0, 40)
AutoFarmBtn.Position = UDim2.new(0, 0, 0, 10)
AutoFarmBtn.Font = Enum.Font.GothamBold
AutoFarmBtn.Text = "🔴 AUTO FARM: OFF"
AutoFarmBtn.TextColor3 = Color3.fromRGB(255,255,255)
AutoFarmBtn.TextSize = 14

local AutoCollectBtn = Instance.new("TextButton")
AutoCollectBtn.Parent = Content
AutoCollectBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
AutoCollectBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
AutoCollectBtn.Size = UDim2.new(1, 0, 0, 40)
AutoCollectBtn.Position = UDim2.new(0, 0, 0, 60)
AutoCollectBtn.Font = Enum.Font.GothamBold
AutoCollectBtn.Text = "🔴 AUTO COLLECT: OFF"
AutoCollectBtn.TextColor3 = Color3.fromRGB(255,255,255)
AutoCollectBtn.TextSize = 14

--// TELEPORT
local TeleportLabel = Instance.new("TextLabel")
TeleportLabel.Parent = Content
TeleportLabel.BackgroundTransparency = 1
TeleportLabel.Position = UDim2.new(0, 0, 0, 110)
TeleportLabel.Size = UDim2.new(1, 0, 0, 20)
TeleportLabel.Text = "📍 TELEPORT PARA ILHA:"
TeleportLabel.TextColor3 = Color3.fromRGB(200,200,200)
TeleportLabel.TextSize = 14

local TeleportBox = Instance.new("TextBox")
TeleportBox.Parent = Content
TeleportBox.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TeleportBox.BorderColor3 = Color3.fromRGB(0, 255, 100)
TeleportBox.Position = UDim2.new(0, 0, 0, 135)
TeleportBox.Size = UDim2.new(1, 0, 0, 40)
TeleportBox.Font = Enum.Font.Gotham
TeleportBox.PlaceholderText = "Ex: Jungle, Desert, Pirate Village"
TeleportBox.Text = ""
TeleportBox.TextColor3 = Color3.fromRGB(255,255,255)

local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Parent = Content
TeleportBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
TeleportBtn.BorderColor3 = Color3.fromRGB(0, 200, 255)
TeleportBtn.Position = UDim2.new(0, 0, 0, 185)
TeleportBtn.Size = UDim2.new(1, 0, 0, 40)
TeleportBtn.Font = Enum.Font.GothamBold
TeleportBtn.Text = "⚡ TELEPORTAR"
TeleportBtn.TextColor3 = Color3.fromRGB(255,255,255)
TeleportBtn.TextSize = 16

--// LISTA DE LOCAIS
local Locais = {
    ["Starter"] = Vector3.new(-2748, 10, 364),
    ["Jungle"] = Vector3.new(-4585, 10, 3773),
    ["Pirate Village"] = Vector3.new(-4189, 10, 6161),
    ["Desert"] = Vector3.new(-3138, 10, 8065),
    ["Middle Town"] = Vector3.new(-1941, 10, 4881),
    ["Frozen Village"] = Vector3.new(-1005, 10, 9675),
    ["Marine Fortress"] = Vector3.new(1148, 10, 5800),
    ["Skylands"] = Vector3.new(-1985, 200, 4796)
}

--// FUNÇÕES DE ARRASTAR
local Dragging, DragStart, StartPos = false, nil, nil
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = Main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = input.Position - DragStart
        Main.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)

--// FUNÇÃO MINIMIZAR / MAXIMIZAR
MinimizeBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    MiniBall.Visible = true
end)

MiniBall.MouseButton1Click:Connect(function()
    Main.Visible = true
    MiniBall.Visible = false
end)

--// LIGAR/DESLIGAR FUNÇÕES
AutoFarmBtn.MouseButton1Click:Connect(function()
    Config.AutoFarm = not Config.AutoFarm
    if Config.AutoFarm then
        AutoFarmBtn.Text = "🟢 AUTO FARM: ON"
        AutoFarmBtn.BorderColor3 = Color3.fromRGB(0,255,100)
    else
        AutoFarmBtn.Text = "🔴 AUTO FARM: OFF"
        AutoFarmBtn.BorderColor3 = Color3.fromRGB(80,80,100)
    end
end)

AutoCollectBtn.MouseButton1Click:Connect(function()
    Config.AutoCollect = not Config.AutoCollect
    if Config.AutoCollect then
        AutoCollectBtn.Text = "🟢 AUTO COLLECT: ON"
        AutoCollectBtn.BorderColor3 = Color3.fromRGB(0,255,100)
    else
        AutoCollectBtn.Text = "🔴 AUTO COLLECT: OFF"
        AutoCollectBtn.BorderColor3 = Color3.fromRGB(80,80,100)
    end
end)

TeleportBtn.MouseButton1Click:Connect(function()
    local Alvo = TeleportBox.Text
    if Locais[Alvo] then
        RootPart.CFrame = CFrame.new(Locais[Alvo])
        game.StarterGui:SetCore("SendNotification", {Title = "MG CHEATS"; Text = "Teleportado!"; Duration = 2})
    else
        game.StarterGui:SetCore("SendNotification", {Title = "ERRO"; Text = "Local não encontrado!"; Duration = 2})
    end
end)

--// AUTO FARM FUNCIONANDO
spawn(function()
    while wait(0.1) do
        if Config.AutoFarm and Humanoid.Health > 0 then
            local ClosestEnemy = nil
            local DistanciaMinima = 150
            
            for _, NPC in pairs(workspace:GetChildren()) do
                if NPC:FindFirstChild("Humanoid") and NPC.Humanoid.Health > 0 and NPC.Name ~= Player.Name then
                    local Dist = (RootPart.Position - NPC.HumanoidRootPart.Position).Magnitude
                    if Dist < DistanciaMinima then
                        DistanciaMinima = Dist
                        ClosestEnemy = NPC
                    end
                end
            end
            
            if ClosestEnemy then
                RootPart.CFrame = CFrame.new(RootPart.Position, ClosestEnemy.HumanoidRootPart.Position) * CFrame.new(0,0,-2)
                Mouse.TargetFilter = ClosestEnemy
                VirtualUser:Button1Down(Vector2.new(0,0))
                wait(0.1)
                VirtualUser:Button1Up(Vector2.new(0,0))
            end
        end
    end
end)

--// AUTO COLLECT FUNCIONANDO
spawn(function()
    while wait(0.3) do
        if Config.AutoCollect then
            for _, Item in pairs(workspace:GetChildren()) do
                if Item:IsA("Part") or Item:IsA("MeshPart") then
                    local NomeBaixo = string.lower(Item.Name)
                    if NomeBaixo:find("money") or NomeBaixo:find("belly") or NomeBaixo:find("fruit") or NomeBaixo:find("drop") then
                        local Dist = (RootPart.Position - Item.Position).Magnitude
                        if Dist < 20 then
                            Item.CFrame = RootPart.CFrame
                            firetouchinterest(Item, Character.Torso, 0)
                            firetouchinterest(Item, Character.Torso, 1)
                        end
                    end
                end
            end
        end
    end
end)

--// AVISO
game.StarterGui:SetCore("SendNotification", {
    Title = "✅ MG CHEATS CARREGADO";
    Text = "Sistema 100% Funcional!";
    Duration = 3;
})
