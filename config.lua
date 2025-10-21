--[[
    Inovoproductions Configuration
    Pas deze instellingen aan naar jouw voorkeur
]]

return {
    -- GUI Settings
    GUI = {
        Title = "Inovoproductions",
        DefaultSize = UDim2.new(0, 650, 0, 450),
        Position = UDim2.new(0.5, 0, 0.5, 0), -- Center screen
        Draggable = true,
        ShowNotifications = true,
        NotificationDuration = 3,
    },
    
    -- Theme Colors (RGB)
    Theme = {
        Background = {15, 15, 20},
        Secondary = {25, 25, 35},
        Accent = {138, 43, 226}, -- Purple
        AccentHover = {158, 63, 246},
        Text = {255, 255, 255},
        TextDark = {150, 150, 160},
        Success = {75, 210, 143},
        Error = {234, 84, 85},
        Border = {40, 40, 50}
    },
    
    -- Animation Settings
    Animations = {
        OpenSpeed = 0.4,
        CloseSpeed = 0.3,
        TransitionSpeed = 0.25,
        ButtonClickSpeed = 0.15,
        UseBouncyAnimations = true,
    },
    
    -- Feature Toggles
    Features = {
        EnableUniversalScripts = true,
        EnablePlayerMods = true,
        EnableGameScripts = true,
        EnableExecutor = true,
        EnableSettings = true,
        
        -- Auto-Execute
        AutoExecute = false,
        AutoExecuteScript = "", -- URL or local path
        
        -- Safety
        SafeMode = false, -- Prevents dangerous scripts
        ConfirmDestructiveActions = true,
    },
    
    -- Script URLs (Update deze met je eigen GitHub repository)
    URLs = {
        UILibrary = "https://raw.githubusercontent.com/lollakillah/lua/main/UI_Library.lua",
        MainScript = "https://raw.githubusercontent.com/lollakillah/lua/main/main.lua",
        Loader = "https://raw.githubusercontent.com/lollakillah/lua/main/loader.lua",
        
        -- Update check
        VersionCheck = "https://raw.githubusercontent.com/lollakillah/lua/main/version.txt",
    },
    
    -- Version Info
    Version = {
        Major = 1,
        Minor = 0,
        Patch = 0,
        Release = "Stable",
        BuildDate = "2025-10-21"
    },
    
    -- Social Links
    Social = {
        Discord = "https://discord.gg/inovoproductions",
        YouTube = "https://youtube.com/@inovoproductions",
        GitHub = "https://github.com/lollakillah/lua",
        Website = "https://inovoproductions.com"
    },
    
    -- Keybinds
    Keybinds = {
        ToggleGUI = Enum.KeyCode.RightControl, -- Toggle GUI visibility
        Noclip = Enum.KeyCode.N, -- Toggle noclip
        -- Add more custom keybinds here
    },
    
    -- Player Settings Defaults
    PlayerDefaults = {
        WalkSpeed = 16,
        JumpPower = 50,
        Gravity = 196.2,
    },
    
    -- Script Hub Settings
    ScriptHub = {
        MaxRecentScripts = 10,
        SaveScriptHistory = true,
        AutoSaveExecutedScripts = false,
    },
    
    -- Game-Specific Settings
    GameDetection = {
        AutoLoadGameScripts = true,
        SupportedGames = {
            [2753915549] = "Blox Fruits",
            [4442272183] = "Blox Fruits (New)",
            [286090429] = "Arsenal",
            [4924922222] = "Brookhaven RP",
            [920587237] = "Adopt Me",
            [189707] = "Natural Disaster Survival",
            [142823291] = "Murder Mystery 2",
            [1224212277] = "Project Lazarus",
        }
    },
    
    -- Debug Settings
    Debug = {
        EnableDebugMode = false,
        ShowConsole = false,
        LogErrors = true,
        VerboseLogging = false,
    }
}

