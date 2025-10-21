# 🚀 Inovoproductions - Roblox Script Hub

Een moderne en krachtige Roblox script hub met een strakke interface geïnspireerd op vansirius.menu. Gemaakt met smooth animaties en een intuïtieve gebruikerservaring.

## ✨ Features

### 🎨 Modern Design
- Smooth animaties en transitions
- Dark theme met paarse accenten
- Volledig responsieve interface
- Drag-and-drop venster
- Minimaliseer functionaliteit

### 📦 Functies

#### 🏠 Home Tab
- Welkomstbericht
- Update checker
- Discord link

#### 🌐 Universal Scripts
- **Infinite Yield** - Krachtige command-line admin tool
- **Dex Explorer V4** - Game explorer
- **Simple Spy** - Remote spy tool
- **Unnamed ESP** - Player ESP
- **FPS Booster** - Verbeter je performance
- **Anti-AFK** - Blijf online

#### 👤 Player Tab
- **WalkSpeed slider** - Pas je loop snelheid aan (16-200)
- **JumpPower slider** - Pas je spring kracht aan (50-300)
- **Loop WalkSpeed** - Blijf je snelheid behouden
- **Loop JumpPower** - Blijf je spring kracht behouden
- **Infinite Jump** - Spring oneindig
- **God Mode (FE)** - Onsterfelijkheid
- **Noclip** - Loop door muren (Toggle met N)

#### 🎮 Game Scripts
- Auto game detectie
- Aangepaste scripts voor populaire games:
  - Blox Fruits
  - Arsenal
  - Brookhaven
  - Adopt Me
  - En meer...

#### ⚡ Executor
- Ingebouwde script executor
- Voer custom Lua scripts uit
- Clipboard support
- Script opslag

#### ⚙️ Settings
- Auto-Execute bij join
- Notificatie instellingen
- Rejoin server
- Server hop
- Game ID tools

## 🚀 Installatie

### Methode 1: Direct laden (Aanbevolen)
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_GITHUB/loader.lua"))()
```

### Methode 2: Via executor
1. Download `loader.lua`
2. Open je Roblox executor
3. Plak de inhoud van `loader.lua`
4. Klik op Execute

### Methode 3: Lokale bestanden
1. Download alle bestanden
2. Plaats ze in je executor's workspace folder
3. Voer `loader.lua` uit

## 📁 Bestandsstructuur

```
Inovoproductions/
│
├── UI_Library.lua      # UI Library met animaties en componenten
├── main.lua            # Hoofd script hub interface
├── loader.lua          # Snelle loader met loading screen
└── README.md           # Deze documentatie
```

## 🎨 UI Componenten

De UI Library bevat verschillende componenten:

### Buttons
```lua
Tab:AddButton("Button Text", function()
    print("Button clicked!")
end)
```

### Toggles
```lua
Tab:AddToggle("Toggle Text", false, function(state)
    print("Toggle state:", state)
end)
```

### Sliders
```lua
Tab:AddSlider("Slider Text", min, max, default, function(value)
    print("Slider value:", value)
end)
```

### Textboxes
```lua
Tab:AddTextbox("Label", "Placeholder", function(text)
    print("Input:", text)
end)
```

### Notifications
```lua
Library:Notification("Notification text", duration)
```

## 🎨 Theme Kleuren

```lua
Background = Color3.fromRGB(15, 15, 20)      -- Donker zwart
Secondary = Color3.fromRGB(25, 25, 35)       -- Lichter zwart
Accent = Color3.fromRGB(138, 43, 226)        -- Paars
AccentHover = Color3.fromRGB(158, 63, 246)   -- Licht paars
Text = Color3.fromRGB(255, 255, 255)         -- Wit
TextDark = Color3.fromRGB(150, 150, 160)     -- Grijs
Success = Color3.fromRGB(75, 210, 143)       -- Groen
Error = Color3.fromRGB(234, 84, 85)          -- Rood
Border = Color3.fromRGB(40, 40, 50)          -- Donker grijs
```

## 🔧 Custom Scripts Toevoegen

Je kunt gemakkelijk je eigen scripts toevoegen:

```lua
-- In main.lua
local CustomTab = Window:CreateTab("🔥 Custom")

CustomTab:AddButton("Mijn Script", function()
    Library:Notification("Laden...", 2)
    loadstring(game:HttpGet("YOUR_SCRIPT_URL"))()
end)
```

## 🛠️ Development

### Vereisten
- Roblox Executor (Synapse X, KRNL, Fluxus, etc.)
- Basis kennis van Lua

### Eigen UI maken
```lua
local Library = loadstring(game:HttpGet("YOUR_UI_LIBRARY_URL"))()

local Window = Library:CreateWindow({
    Title = "Jouw Hub Naam"
})

local Tab = Window:CreateTab("Tab Naam")

Tab:AddButton("Button", function()
    print("Hallo wereld!")
end)
```

## 🔐 Beveiliging

- Alle scripts worden lokaal uitgevoerd
- Geen data wordt verzonden naar externe servers
- Open source - bekijk de code zelf!

## 📱 Compatibiliteit

### Executors
✅ Synapse X  
✅ KRNL  
✅ Fluxus  
✅ Electron  
✅ Script-Ware  
✅ En de meeste andere executors

### Roblox
✅ Windows  
✅ Mac (met compatibele executor)  

## ⚠️ Disclaimer

Dit script is alleen voor educatieve doeleinden. Het gebruik van executors en scripts kan tegen de Roblox Terms of Service zijn. Gebruik op eigen risico.

## 🤝 Contributing

Wil je bijdragen? Geweldig!

1. Fork het project
2. Maak een feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit je changes (`git commit -m 'Add some AmazingFeature'`)
4. Push naar de branch (`git push origin feature/AmazingFeature`)
5. Open een Pull Request

## 📞 Contact & Support

- **Discord:** discord.gg/inovoproductions
- **YouTube:** youtube.com/@inovoproductions
- **GitHub Issues:** Voor bug reports en feature requests

## 📄 Licentie

Dit project is open source en beschikbaar onder de MIT License.

## 🌟 Credits

- **Ontwikkeld door:** Inovoproductions
- **Geïnspireerd door:** vansirius.menu
- **UI Design:** Modern & Minimalistisch
- **Animaties:** Smooth & Professioneel

## 📊 Versie History

### v1.0 (Huidig)
- ✨ Initiële release
- 🎨 Moderne UI met smooth animaties
- 🚀 6 Hoofdtabs (Home, Universal, Player, Game Scripts, Executor, Settings)
- 🔧 20+ Ingebouwde functies
- 🎮 Game-specifieke script detectie

---

**Gemaakt met ❤️ door Inovoproductions**

*Enjoy scripting! 🚀*

