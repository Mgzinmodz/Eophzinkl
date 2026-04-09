--// SERVICES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

--// VARIAVEIS
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

--// CONFIG PADRAO
local Config = {
    XerifeESP = false,
    MurderESP = false,
    PlayerESP = false,
    Chegar = false,
    
    CorXerife = Color3.new(0, 0, 255), -- AZUL
    CorMurder = Color3.new(255, 0, 0), -- VERMELHO
    CorPlayer = Color3.new(0, 255, 0)  -- VERDE
}

--// CRIAÇÃO DA GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MGCheatsMM2"
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
Main.Size = UDim2.new(0, 320, 0, 500)
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
Title.Text = "💜 MG CHEATS - MM2 💜"
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.TextSize = 16

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

--// BOLINHA FLUTUANTE
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

--// MINIMIZAR
MinimizeBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    MiniBall.Visible = true
end)
MiniBall.MouseButton1Click:Connect(function()
    Main.Visible = true
    MiniBall.Visible = false
end)

--// ==============================================
--// BOTOES PRINCIPAIS
--// ==============================================

local y = 10

--// XERIFE
local XerifeBtn = Instance.new("TextButton")
XerifeBtn.Parent = Content
XerifeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 70)
XerifeBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
XerifeBtn.Size = UDim2.new(1, 0, 0, 35)
XerifeBtn.Position = UDim2.new(0, 0, 0, y)
XerifeBtn.Font = Enum.Font.GothamBold
XerifeBtn.Text = "🔴 XERIFE ESP: OFF"
XerifeBtn.TextColor3 = Color3.fromRGB(255,255,255)
XerifeBtn.TextSize = 14

y = y + 45

--// MURDER
local MurderBtn = Instance.new("TextButton")
MurderBtn.Parent = Content
MurderBtn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
MurderBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
MurderBtn.Size = UDim2.new(1, 0, 0, 35)
MurderBtn.Position = UDim2.new(0, 0, 0, y)
MurderBtn.Font = Enum.Font.GothamBold
MurderBtn.Text = "🔴 MURDER ESP: OFF"
MurderBtn.TextColor3 = Color3.fromRGB(255,255,255)
MurderBtn.TextSize = 14

y = y + 45

--// PLAYERS
local PlayerBtn = Instance.new("TextButton")
PlayerBtn.Parent = Content
PlayerBtn.BackgroundColor3 = Color3.fromRGB(30, 70, 30)
PlayerBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
PlayerBtn.Size = UDim2.new(1, 0, 0, 35)
PlayerBtn.Position = UDim2.new(0, 0, 0, y)
PlayerBtn.Font = Enum.Font.GothamBold
PlayerBtn.Text = "🔴 PLAYERS ESP: OFF"
PlayerBtn.TextColor3 = Color3.fromRGB(255,255,255)
PlayerBtn.TextSize = 14

y = y + 45

--// CHEGAR
local ChegarBtn = Instance.new("TextButton")
ChegarBtn.Parent = Content
ChegarBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 70)
ChegarBtn.BorderColor3 = Color3.fromRGB(80, 80, 100)
ChegarBtn.Size = UDim2.new(1, 0, 0, 35)
ChegarBtn.Position = UDim2.new(0, 0, 0, y)
ChegarBtn.Font = Enum.Font.GothamBold
ChegarBtn.Text = "🔴 CHEGAR: OFF"
ChegarBtn.TextColor3 = Color3.fromRGB(255,255,255)
ChegarBtn.TextSize = 14

y = y + 60

--// ==============================================
--// SELEÇÃO DE CORES
--// ==============================================

local TitleCores = Instance.new("TextLabel")
TitleCores.Parent = Content
TitleCores.BackgroundTransparency = 1
TitleCores.Size = UDim2.new(1, 0, 0, 20)
TitleCores.Position = UDim2.new(0, 0, 0, y)
TitleCores.Text = "🎨 MUDAR CORES DO ESP"
TitleCores.TextColor3 = Color3.fromRGB(255, 200, 0)
TitleCores.Font = Enum.Font.GothamBold
TitleCores.TextSize = 14

y = y + 25

--// BOTOES DE COR
local CorXerifeBtn = Instance.new("TextButton")
CorXerifeBtn.Parent = Content
CorXerifeBtn.BackgroundColor3 = Config.CorXerife
CorXerifeBtn.BorderColor3 = Color3.new(1,1,1)
CorXerifeBtn.Size = UDim2.new(1, 0, 0, 30)
CorXerifeBtn.Position = UDim2.new(0, 0, 0, y)
CorXerifeBtn.Text = "Cor Xerife"
CorXerifeBtn.TextColor3 = Color3.new(1,1,1)
CorXerifeBtn.Font = Enum.Font.GothamBold

y = y + 35

local CorMurderBtn = Instance.new("TextButton")
CorMurderBtn.Parent = Content
CorMurderBtn.BackgroundColor3 = Config.CorMurder
CorMurderBtn.BorderColor3 = Color3.new(1,1,1)
CorMurderBtn.Size = UDim2.new(1, 0, 0, 30)
CorMurderBtn.Position = UDim2.new(0, 0, 0, y)
CorMurderBtn.Text = "Cor Murder"
CorMurderBtn.TextColor3 = Color3.new(1,1,1)
CorMurderBtn.Font = Enum.Font.GothamBold

y = y + 35

local CorPlayerBtn = Instance.new("TextButton")
CorPlayerBtn.Parent = Content
CorPlayerBtn.BackgroundColor3 = Config.CorPlayer
CorPlayerBtn.BorderColor3 = Color3.new(1,1,1)
CorPlayerBtn.Size = UDim2.new(1, 0, 0, 30)
CorPlayerBtn.Position = UDim2.new(0, 0, 0, y)
CorPlayerBtn.Text = "Cor Players"
CorPlayerBtn.TextColor3 = Color3.new(1,1,1)
CorPlayerBtn.Font = Enum.Font.GothamBold

--// ==============================================
--// LIGAR / DESLIGAR FUNÇÕES
--// ==============================================

XerifeBtn.MouseButton1Click:Connect(function()
    Config.XerifeESP = not Config.XerifeESP
    XerifeBtn.Text = Config.XerifeESP and "🟢 XERIFE ESP: ON" or "🔴 XERIFE ESP: OFF"
    XerifeBtn.BorderColor3 = Config.XerifeESP and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,100)
end)

MurderBtn.MouseButton1Click:Connect(function()
    Config.MurderESP = not Config.MurderESP
    MurderBtn.Text = Config.MurderESP and "🟢 MURDER ESP: ON" or "🔴 MURDER ESP: OFF"
    MurderBtn.BorderColor3 = Config.MurderESP and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,100)
end)

PlayerBtn.MouseButton1Click:Connect(function()
    Config.PlayerESP = not Config.PlayerESP
    PlayerBtn.Text = Config.PlayerESP and "🟢 PLAYERS ESP: ON" or "🔴 PLAYERS ESP: OFF"
    PlayerBtn.BorderColor3 = Config.PlayerESP and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,100)
end)

ChegarBtn.MouseButton1Click:Connect(function()
    Config.Chegar = not Config.Chegar
    ChegarBtn.Text = Config.Chegar and "🟢 CHEGAR: ON" or "🔴 CHEGAR: OFF"
    ChegarBtn.BorderColor3 = Config.Chegar and Color3.fromRGB(0,255,100) or Color3.fromRGB(80,80,100)
end)

--// MUDAR CORES (CICLO)
local CoresDisponiveis = {
    Color3.new(1,0,0), -- Vermelho
    Color3.new(0,1,0), -- Verde
    Color3.new(0,0,1), -- Azul
    Color3.new(1,1,0), -- Amarelo
    Color3.new(1,0,1), -- Roxo
    Color3.new(0,1,1), -- Ciano
    Color3.new(1,1,1)  -- Branco
}
local indiceCor = 1

CorXerifeBtn.MouseButton1Click:Connect(function()
    indiceCor = indiceCor + 1
    if indiceCor > #CoresDisponiveis then indiceCor = 1 end
    Config.CorXerife = CoresDisponiveis[indiceCor]
    CorXerifeBtn.BackgroundColor3 = Config.CorXerife
end)

CorMurderBtn.MouseButton1Click:Connect(function()
    indiceCor = indiceCor + 1
    if indiceCor > #CoresDisponiveis then indiceCor = 1 end
    Config.CorMurder = CoresDisponiveis[indiceCor]
    CorMurderBtn.BackgroundColor3 = Config.CorMurder
end)

CorPlayerBtn.MouseButton1Click:Connect(function()
    indiceCor = indiceCor + 1
    if indiceCor > #CoresDisponiveis then indiceCor = 1 end
    Config.CorPlayer = CoresDisponiveis[indiceCor]
    CorPlayerBtn.BackgroundColor3 = Config.CorPlayer
end)

--// ==============================================
--// SISTEMA DE ESP E CHEGAR
--// ==============================================

local function criarHighlight(alvo, cor)
    local hl = alvo:FindFirstChild("MG_HL")
    if not hl then
        hl = Instance.new("Highlight")
        hl.Name = "MG_HL"
        hl.Parent = alvo
        hl.Adornee = alvo
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
    hl.FillColor = cor
    hl.OutlineColor = Color3.new(1,1,1)
    hl.Enabled = true
    return hl
end

spawn(function()
    while wait(0.2) do
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character then
                local char = plr.Character
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                
                if hrp and hum and hum.Health > 0 then
                    
                    -- VERIFICA QUEM É QUEM
                    local ehXerife = false
                    local ehMurder = false
                    
                    -- CHECA FERR
            
