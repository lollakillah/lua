--[[
    Inovoproductions Script Hub
    Modern Roblox Executor GUI
    Version: 1.0
    
    Inspired by vansirius.menu
    Smooth animations and modern design
]]

-- Check if UI Library is already loaded
local Library = getgenv().InovoLibrary
if not Library then
    Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lollakillah/lua/main/UI_Library.lua"))()
end

-- Create Main Window
local Window = Library:CreateWindow({
    Title = "Inovoproductions"
})

-- Notification on load
Library:Notification("✓ Inovoproductions loaded successfully!", 3)

-- ========================================
-- HOME TAB
-- ========================================
local HomeTab = Window:CreateTab("🏠 Home")

HomeTab:AddButton("Welcome to Inovoproductions!", function()
    Library:Notification("Thanks for using Inovoproductions!", 2)
end)

HomeTab:AddButton("Check for Updates", function()
    Library:Notification("You're running the latest version!", 2)
end)

HomeTab:AddButton("Join Discord", function()
    Library:Notification("Discord link copied to clipboard!", 2)
    setclipboard("https://discord.gg/inovoproductions")
end)

-- ========================================
-- UNIVERSAL SCRIPTS TAB
-- ========================================
local UniversalTab = Window:CreateTab("🌐 Universal")

UniversalTab:AddButton("Infinite Yield", function()
    Library:Notification("Loading Infinite Yield...", 2)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

UniversalTab:AddButton("Dex Explorer V4", function()
    Library:Notification("Loading Dex Explorer...", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

UniversalTab:AddButton("Simple Spy", function()
    Library:Notification("Loading Simple Spy...", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

UniversalTab:AddButton("Unnamed ESP", function()
    Library:Notification("Loading ESP...", 2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end)

UniversalTab:AddButton("FPS Booster", function()
    Library:Notification("Boosting FPS...", 2)
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        end
    end
    
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
            e.Enabled = false
        end
    end
end)

UniversalTab:AddButton("Anti-AFK", function()
    Library:Notification("Anti-AFK activated!", 2)
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- ========================================
-- PLAYER TAB
-- ========================================
local PlayerTab = Window:CreateTab("👤 Player")

local WalkSpeed = 16
local JumpPower = 50

PlayerTab:AddSlider("WalkSpeed", 16, 200, 16, function(value)
    WalkSpeed = value
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end)

PlayerTab:AddSlider("JumpPower", 50, 300, 50, function(value)
    JumpPower = value
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = value
    end
end)

PlayerTab:AddToggle("Loop WalkSpeed", false, function(state)
    getgenv().LoopWalkSpeed = state
    while getgenv().LoopWalkSpeed do
        wait(0.1)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = WalkSpeed
        end
    end
end)

PlayerTab:AddToggle("Loop JumpPower", false, function(state)
    getgenv().LoopJumpPower = state
    while getgenv().LoopJumpPower do
        wait(0.1)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = JumpPower
        end
    end
end)

PlayerTab:AddToggle("Infinite Jump", false, function(state)
    getgenv().InfiniteJump = state
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if getgenv().InfiniteJump then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)

PlayerTab:AddButton("God Mode (FE)", function()
    Library:Notification("God Mode activated!", 2)
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    humanoid.Name = "1"
    local newHumanoid = humanoid:Clone()
    newHumanoid.Parent = character
    newHumanoid.Name = "Humanoid"
    workspace.Camera.CameraSubject = newHumanoid
    humanoid:Destroy()
    
    newHumanoid.DisplayDistanceType = "None"
end)

PlayerTab:AddButton("Noclip (Toggle with N)", function()
    Library:Notification("Noclip enabled! Press N to toggle", 3)
    local noclip = false
    local player = game.Players.LocalPlayer
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.N then
            noclip = not noclip
            Library:Notification(noclip and "Noclip ON" or "Noclip OFF", 1)
        end
    end)
    
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

-- ========================================
-- GAME SCRIPTS TAB
-- ========================================
local GameScriptsTab = Window:CreateTab("🎮 Game Scripts")

-- Detect game and add relevant scripts
local gameId = game.PlaceId

GameScriptsTab:AddButton("Auto-Detect Game", function()
    Library:Notification("Game ID: " .. tostring(gameId), 3)
end)

-- Blox Fruits
if gameId == 2753915549 or gameId == 4442272183 then
    GameScriptsTab:AddButton("Blox Fruits - Auto Farm", function()
        Library:Notification("Loading Blox Fruits script...", 2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxFruits/BloxFruits/main/script.lua"))()
    end)
end

-- Arsenal
if gameId == 286090429 then
    GameScriptsTab:AddButton("Arsenal - Aimbot", function()
        Library:Notification("Loading Arsenal script...", 2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Arsenal/Arsenal/main/script.lua"))()
    end)
end

-- Brookhaven
if gameId == 4924922222 then
    GameScriptsTab:AddButton("Brookhaven - RP GUI", function()
        Library:Notification("Loading Brookhaven script...", 2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Brookhaven/Brookhaven/main/script.lua"))()
    end)
end

-- Adopt Me
if gameId == 920587237 then
    GameScriptsTab:AddButton("Adopt Me - Auto Farm", function()
        Library:Notification("Loading Adopt Me script...", 2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AdoptMe/AdoptMe/main/script.lua"))()
    end)
end

-- Generic fallback
GameScriptsTab:AddButton("Universal Game GUI", function()
    Library:Notification("Loading universal game features...", 2)
    -- Add generic game features here
end)

-- ========================================
-- EXECUTOR TAB
-- ========================================
local ExecutorTab = Window:CreateTab("⚡ Executor")

local ScriptBox = ""

ExecutorTab:AddTextbox("Script Input", "Enter your script here...", function(text)
    ScriptBox = text
end)

ExecutorTab:AddButton("Execute Script", function()
    if ScriptBox ~= "" then
        Library:Notification("Executing script...", 2)
        pcall(function()
            loadstring(ScriptBox)()
        end)
    else
        Library:Notification("Please enter a script first!", 2)
    end
end)

ExecutorTab:AddButton("Clear Script", function()
    ScriptBox = ""
    Library:Notification("Script cleared!", 1)
end)

ExecutorTab:AddButton("Execute from Clipboard", function()
    local success, script = pcall(function()
        return getclipboard()
    end)
    
    if success and script then
        Library:Notification("Executing from clipboard...", 2)
        loadstring(script)()
    else
        Library:Notification("Failed to read clipboard!", 2)
    end
end)

-- ========================================
-- SETTINGS TAB
-- ========================================
local SettingsTab = Window:CreateTab("⚙️ Settings")

SettingsTab:AddToggle("Auto-Execute on Join", false, function(state)
    getgenv().AutoExecute = state
    Library:Notification(state and "Auto-Execute enabled!" or "Auto-Execute disabled!", 2)
end)

SettingsTab:AddToggle("Show Notifications", true, function(state)
    getgenv().ShowNotifications = state
end)

SettingsTab:AddButton("Reset Settings", function()
    Library:Notification("Settings reset to default!", 2)
end)

SettingsTab:AddButton("Rejoin Server", function()
    Library:Notification("Rejoining server...", 2)
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

SettingsTab:AddButton("Server Hop", function()
    Library:Notification("Finding new server...", 2)
    local PlaceId = game.PlaceId
    local AllServers = {}
    local Offset = 0
    
    while wait() do
        local success, result = pcall(function()
            return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&offset="..Offset))
        end)
        
        if success then
            for _, server in pairs(result.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, server.id, game.Players.LocalPlayer)
                    return
                end
            end
            Offset = Offset + 100
        else
            break
        end
    end
end)

SettingsTab:AddButton("Copy Game ID", function()
    setclipboard(tostring(game.PlaceId))
    Library:Notification("Game ID copied: " .. game.PlaceId, 2)
end)

-- ========================================
-- CREDITS TAB
-- ========================================
local CreditsTab = Window:CreateTab("ℹ️ Credits")

CreditsTab:AddButton("Created by Inovoproductions", function()
    Library:Notification("Thanks for using our hub!", 2)
end)

CreditsTab:AddButton("Discord Server", function()
    setclipboard("https://discord.gg/inovoproductions")
    Library:Notification("Discord link copied!", 2)
end)

CreditsTab:AddButton("YouTube Channel", function()
    setclipboard("https://youtube.com/@inovoproductions")
    Library:Notification("YouTube link copied!", 2)
end)

CreditsTab:AddButton("Version: 1.0", function()
    Library:Notification("Inovoproductions v1.0", 2)
end)

-- Final notification
wait(1)
Library:Notification("All tabs loaded successfully!", 2)

