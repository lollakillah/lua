--[[
    Inovoproductions Loader
    Quick load script for the hub
]]

-- Loading screen
local LoadingScreen = Instance.new("ScreenGui")
LoadingScreen.Name = "InovoLoader"
LoadingScreen.ResetOnSpawn = false
LoadingScreen.Parent = game:GetService("CoreGui")

local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(0, 300, 0, 150)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = LoadingScreen

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = LoadingFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 20)
Title.BackgroundTransparency = 1
Title.Text = "Inovoproductions"
Title.TextColor3 = Color3.fromRGB(138, 43, 226)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = LoadingFrame

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.new(0, 0, 0, 70)
Status.BackgroundTransparency = 1
Status.Text = "Loading..."
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham
Status.Parent = LoadingFrame

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0.8, 0, 0, 4)
ProgressBar.Position = UDim2.new(0.1, 0, 0, 110)
ProgressBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = LoadingFrame

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(1, 0)
ProgressCorner.Parent = ProgressBar

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBar

local ProgressFillCorner = Instance.new("UICorner")
ProgressFillCorner.CornerRadius = UDim.new(1, 0)
ProgressFillCorner.Parent = ProgressFill

-- Animate progress
local TweenService = game:GetService("TweenService")

local function updateProgress(percent, text)
    Status.Text = text
    TweenService:Create(ProgressFill, TweenInfo.new(0.3), {Size = UDim2.new(percent, 0, 1, 0)}):Play()
end

-- Load UI Library
updateProgress(0.2, "Loading UI Library...")
wait(0.5)

local success, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/lollakillah/lua/main/UI_Library.lua"))()
end)

if not success then
    -- Fallback to local file if available
    Library = loadstring(readfile("UI_Library.lua"))()
end

updateProgress(0.5, "Initializing components...")
wait(0.5)

-- Load Main Script
updateProgress(0.8, "Loading main script...")
wait(0.5)

local mainSuccess = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lollakillah/lua/main/main.lua"))()
end)

if not mainSuccess then
    -- Fallback to local file
    loadstring(readfile("main.lua"))()
end

updateProgress(1, "Complete!")
wait(0.5)

-- Remove loading screen
TweenService:Create(LoadingFrame, TweenInfo.new(0.3), {
    Size = UDim2.new(0, 0, 0, 0),
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

wait(0.3)
LoadingScreen:Destroy()

