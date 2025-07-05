--// UnboxXHub v1.1 | Adicionando mais funções com AntiDetect e Safe Mode
--// Criado por ChatGPT & CarlosFrancisquini

-- Proteção AntiDetect Inicial
pcall(function()
    setfflag("AbuseReportScreenshot", "False")
    setfflag("AbuseReportScreenshotPercentage", "0")
end)

for _, v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
    v:Disable()
end

--// INTRO HACKER ANIMADA
local TweenService = game:GetService("TweenService")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local introGui = Instance.new("ScreenGui", PlayerGui)
introGui.Name = "UnboxXHubIntro"
introGui.IgnoreGuiInset = true

local frame = Instance.new("Frame", introGui)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Size = UDim2.new(1, 0, 1, 0)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1, 0, 1, 0)
text.BackgroundTransparency = 1
text.Text = "UNBOXXHUB"
text.TextColor3 = Color3.new(0, 1, 0)
text.TextStrokeTransparency = 0.8
text.Font = Enum.Font.Code
text.TextScaled = true

wait(1)
text.Text = "INJETANDO EXPLOIT..."
wait(1)
text.Text = "BYPASS DETECTADO"
wait(1)
text.Text = "INICIALIZANDO HUB"
wait(0.5)
TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
TweenService:Create(text, TweenInfo.new(1), {TextTransparency = 1}):Play()
wait(1)
introGui:Destroy()

--// Carregar Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "UnboxXHub | Unboxing Simulator",
    LoadingTitle = "UnboxXHub",
    LoadingSubtitle = "by ChatGPT",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "UnboxXHubCFG"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Variáveis de controle
local autofarm, autocoin, autoenchant, autoquest, autohatch, safemode = false, false, false, false, false, false

-- ABA MAIN
local Main = Window:CreateTab("Main", 4483362458)

Main:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(v)
        autofarm = v
        while autofarm do
            pcall(function()
                for _, box in pairs(workspace.Boxes:GetChildren()) do
                    if box:FindFirstChild("Health") and box:FindFirstChild("Hitbox") then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, box.Hitbox, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, box.Hitbox, 1)
                    end
                end
            end)
            task.wait(_G.FarmDelay or 0.5)
        end
    end
})

Main:CreateToggle({
    Name = "Auto Collect Coins/Gems",
    CurrentValue = false,
    Callback = function(v)
        autocoin = v
        while autocoin do
            pcall(function()
                for _, coin in pairs(workspace.Drops:GetChildren()) do
                    if coin:IsA("Part") or coin:IsA("MeshPart") then
                    
