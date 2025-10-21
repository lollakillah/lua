-- Inovoproductions UI Library
-- Modern & Smooth Animation System

-- Prevent double loading
if getgenv().InovoLibraryLoaded then
    return getgenv().InovoLibrary
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Library = {}
Library.__index = Library

-- Theme Configuration
Library.Theme = {
    Background = Color3.fromRGB(15, 15, 20),
    Secondary = Color3.fromRGB(25, 25, 35),
    Accent = Color3.fromRGB(138, 43, 226), -- Purple accent
    AccentHover = Color3.fromRGB(158, 63, 246),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(150, 150, 160),
    Success = Color3.fromRGB(75, 210, 143),
    Error = Color3.fromRGB(234, 84, 85),
    Border = Color3.fromRGB(40, 40, 50)
}

-- Animation Presets - Ultra Smooth
Library.Animations = {
    UltraFast = TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    Fast = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    Medium = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    Slow = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    Bounce = TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    Spring = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    Smooth = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
    Silk = TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
}

function Library:CreateWindow(config)
    local Window = {}
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "InovoProductions"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Frame with glassmorphism
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Library.Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    -- Add rounded corners
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = MainFrame
    
    -- Glassmorphism effect with gradient
    local GlassGradient = Instance.new("UIGradient")
    GlassGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
    }
    GlassGradient.Rotation = 45
    GlassGradient.Parent = MainFrame
    
    -- Border glow effect
    local BorderGlow = Instance.new("UIStroke")
    BorderGlow.Color = Library.Theme.Accent
    BorderGlow.Thickness = 1
    BorderGlow.Transparency = 0.5
    BorderGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BorderGlow.Parent = MainFrame
    
    -- Drop shadow effect
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.Position = UDim2.new(0, -20, 0, -20)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.7
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 10, 10)
    Shadow.ZIndex = -1
    Shadow.Parent = MainFrame
    
    -- Top Bar with gradient
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 60)
    TopBar.BackgroundColor3 = Library.Theme.Secondary
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 16)
    TopBarCorner.Parent = TopBar
    
    -- Top bar gradient for depth
    local TopBarGradient = Instance.new("UIGradient")
    TopBarGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 42)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
    }
    TopBarGradient.Rotation = 90
    TopBarGradient.Parent = TopBar
    
    -- Accent line under top bar
    local AccentLine = Instance.new("Frame")
    AccentLine.Name = "AccentLine"
    AccentLine.Size = UDim2.new(1, -20, 0, 2)
    AccentLine.Position = UDim2.new(0, 10, 1, -3)
    AccentLine.BackgroundColor3 = Library.Theme.Accent
    AccentLine.BorderSizePixel = 0
    AccentLine.Parent = TopBar
    
    local AccentLineCorner = Instance.new("UICorner")
    AccentLineCorner.CornerRadius = UDim.new(1, 0)
    AccentLineCorner.Parent = AccentLine
    
    -- Animated gradient on accent line
    local AccentLineGradient = Instance.new("UIGradient")
    AccentLineGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Library.Theme.Accent),
        ColorSequenceKeypoint.new(0.5, Library.Theme.AccentHover),
        ColorSequenceKeypoint.new(1, Library.Theme.Accent)
    }
    AccentLineGradient.Parent = AccentLine
    
    -- Animate accent line gradient
    spawn(function()
        while AccentLine.Parent do
            TweenService:Create(AccentLineGradient, TweenInfo.new(3, Enum.EasingStyle.Linear), {
                Offset = Vector2.new(1, 0)
            }):Play()
            wait(3)
            AccentLineGradient.Offset = Vector2.new(-1, 0)
        end
    end)
    
    -- Logo icon (emoji/symbol)
    local Logo = Instance.new("TextLabel")
    Logo.Name = "Logo"
    Logo.Size = UDim2.new(0, 40, 0, 40)
    Logo.Position = UDim2.new(0, 10, 0, 10)
    Logo.BackgroundColor3 = Library.Theme.Accent
    Logo.Text = "IP"
    Logo.TextColor3 = Library.Theme.Text
    Logo.TextSize = 16
    Logo.Font = Enum.Font.GothamBold
    Logo.BorderSizePixel = 0
    Logo.Parent = TopBar
    
    local LogoCorner = Instance.new("UICorner")
    LogoCorner.CornerRadius = UDim.new(0, 10)
    LogoCorner.Parent = Logo
    
    local LogoGradient = Instance.new("UIGradient")
    LogoGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Library.Theme.Accent),
        ColorSequenceKeypoint.new(1, Library.Theme.AccentHover)
    }
    LogoGradient.Rotation = 45
    LogoGradient.Parent = Logo
    
    -- Pulsing glow effect on logo
    spawn(function()
        while Logo.Parent do
            TweenService:Create(Logo, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 42, 0, 42),
                Position = UDim2.new(0, 9, 0, 9)
            }):Play()
            wait(2)
            TweenService:Create(Logo, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 40, 0, 40),
                Position = UDim2.new(0, 10, 0, 10)
            }):Play()
            wait(2)
        end
    end)
    
    -- Title with gradient text effect
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 250, 1, -10)
    Title.Position = UDim2.new(0, 60, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = config.Title or "Inovoproductions"
    Title.TextColor3 = Library.Theme.Text
    Title.TextSize = 20
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    -- Subtitle/version
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Size = UDim2.new(0, 200, 0, 15)
    Subtitle.Position = UDim2.new(0, 60, 1, -20)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "v1.0 • Modern Hub"
    Subtitle.TextColor3 = Library.Theme.TextDark
    Subtitle.TextSize = 11
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = TopBar
    
    -- Close Button with gradient
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -50, 0, 10)
    CloseButton.BackgroundColor3 = Library.Theme.Error
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Library.Theme.Text
    CloseButton.TextSize = 24
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    local CloseGradient = Instance.new("UIGradient")
    CloseGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Library.Theme.Error),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 60, 60))
    }
    CloseGradient.Rotation = 45
    CloseGradient.Parent = CloseButton
    
    -- Minimize Button with gradient
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
    MinimizeButton.Position = UDim2.new(1, -100, 0, 10)
    MinimizeButton.BackgroundColor3 = Library.Theme.Accent
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Library.Theme.Text
    MinimizeButton.TextSize = 24
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Parent = TopBar
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 10)
    MinimizeCorner.Parent = MinimizeButton
    
    local MinimizeGradient = Instance.new("UIGradient")
    MinimizeGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Library.Theme.Accent),
        ColorSequenceKeypoint.new(1, Library.Theme.AccentHover)
    }
    MinimizeGradient.Rotation = 45
    MinimizeGradient.Parent = MinimizeButton
    
    -- Tab Container with background
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 160, 1, -80)
    TabContainer.Position = UDim2.new(0, 10, 0, 70)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame
    
    -- Add padding
    local TabPadding = Instance.new("UIPadding")
    TabPadding.PaddingTop = UDim.new(0, 5)
    TabPadding.PaddingBottom = UDim.new(0, 5)
    TabPadding.Parent = TabContainer
    
    -- Content Container with modern styling
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -190, 1, -90)
    ContentContainer.Position = UDim2.new(0, 180, 0, 70)
    ContentContainer.BackgroundColor3 = Library.Theme.Secondary
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 12)
    ContentCorner.Parent = ContentContainer
    
    -- Content gradient
    local ContentGradient = Instance.new("UIGradient")
    ContentGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 38)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
    }
    ContentGradient.Rotation = 135
    ContentGradient.Parent = ContentContainer
    
    -- Subtle border
    local ContentStroke = Instance.new("UIStroke")
    ContentStroke.Color = Library.Theme.Border
    ContentStroke.Thickness = 1
    ContentStroke.Transparency = 0.7
    ContentStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ContentStroke.Parent = ContentContainer
    
    -- Smooth dragging functionality with momentum
    local dragging = false
    local dragInput, mousePos, framePos
    local lastDragTime = tick()
    local velocity = Vector2.new(0, 0)
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = MainFrame.Position
            velocity = Vector2.new(0, 0)
            
            -- Scale effect on grab
            TweenService:Create(MainFrame, Library.Animations.UltraFast, {
                Size = UDim2.new(0, 645, 0, 445)
            }):Play()
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    -- Scale back on release
                    TweenService:Create(MainFrame, Library.Animations.Spring, {
                        Size = UDim2.new(0, 650, 0, 450)
                    }):Play()
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            local currentTime = tick()
            local deltaTime = currentTime - lastDragTime
            
            if deltaTime > 0 then
                velocity = delta / deltaTime
            end
            
            lastDragTime = currentTime
            
            -- Ultra smooth dragging without tween
            MainFrame.Position = UDim2.new(
                framePos.X.Scale, 
                framePos.X.Offset + delta.X, 
                framePos.Y.Scale, 
                framePos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Close button functionality with smooth fade out
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.UltraFast, {
            BackgroundColor3 = Library.Theme.Error:lerp(Color3.new(0, 0, 0), 0.3)
        }):Play()
        
        -- Smooth scale down and fade
        local closeTween = TweenService:Create(MainFrame, Library.Animations.Medium, {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        })
        closeTween:Play()
        
        -- Fade out all children
        for _, child in ipairs(MainFrame:GetDescendants()) do
            if child:IsA("GuiObject") then
                TweenService:Create(child, Library.Animations.Fast, {
                    BackgroundTransparency = 1
                }):Play()
                if child:IsA("TextLabel") or child:IsA("TextButton") then
                    TweenService:Create(child, Library.Animations.Fast, {
                        TextTransparency = 1
                    }):Play()
                end
            end
        end
        
        closeTween.Completed:Wait()
        ScreenGui:Destroy()
    end)
    
    -- Minimize functionality with elastic bounce
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        if minimized then
            -- Smooth collapse
            TweenService:Create(MainFrame, Library.Animations.Silk, {
                Size = UDim2.new(0, 300, 0, 50)
            }):Play()
            TweenService:Create(MinimizeButton, Library.Animations.UltraFast, {
                Rotation = 180
            }):Play()
        else
            -- Elastic expand
            TweenService:Create(MainFrame, Library.Animations.Bounce, {
                Size = UDim2.new(0, 650, 0, 450)
            }):Play()
            TweenService:Create(MinimizeButton, Library.Animations.UltraFast, {
                Rotation = 0
            }):Play()
        end
    end)
    
    -- Ultra smooth hover effects with scale
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.UltraFast, {
            BackgroundColor3 = Library.Theme.Error:lerp(Color3.new(1, 1, 1), 0.2),
            Size = UDim2.new(0, 42, 0, 42)
        }):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.UltraFast, {
            BackgroundColor3 = Library.Theme.Error,
            Size = UDim2.new(0, 40, 0, 40)
        }):Play()
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, Library.Animations.UltraFast, {
            BackgroundColor3 = Library.Theme.AccentHover,
            Size = UDim2.new(0, 42, 0, 42)
        }):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, Library.Animations.UltraFast, {
            BackgroundColor3 = Library.Theme.Accent,
            Size = UDim2.new(0, 40, 0, 40)
        }):Play()
    end)
    
    -- Smooth fade-in effect
    MainFrame.BackgroundTransparency = 1
    for _, child in ipairs(MainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            child.BackgroundTransparency = 1
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                child.TextTransparency = 1
            end
        end
    end
    
    -- Open animation with spring effect
    local openTween = TweenService:Create(MainFrame, Library.Animations.Spring, {
        Size = UDim2.new(0, 650, 0, 450)
    })
    openTween:Play()
    
    -- Fade in background
    wait(0.1)
    TweenService:Create(MainFrame, Library.Animations.Medium, {
        BackgroundTransparency = 0
    }):Play()
    
    -- Fade in all children with stagger effect
    for i, child in ipairs(MainFrame:GetDescendants()) do
        if child:IsA("GuiObject") then
            spawn(function()
                wait(i * 0.01)
                TweenService:Create(child, Library.Animations.Fast, {
                    BackgroundTransparency = child.Name == "Shadow" and 0.7 or (child.BackgroundTransparency == 1 and 0 or child.BackgroundTransparency)
                }):Play()
                if child:IsA("TextLabel") or child:IsA("TextButton") then
                    TweenService:Create(child, Library.Animations.Fast, {
                        TextTransparency = 0
                    }):Play()
                end
            end)
        end
    end
    
    Window.ScreenGui = ScreenGui
    Window.MainFrame = MainFrame
    Window.TabContainer = TabContainer
    Window.ContentContainer = ContentContainer
    Window.Tabs = {}
    Window.CurrentTab = nil
    
    function Window:CreateTab(name)
        local Tab = {}
        local TabButton = Instance.new("TextButton")
        TabButton.Name = name
        TabButton.Size = UDim2.new(1, 0, 0, 45)
        TabButton.Position = UDim2.new(0, 0, 0, #self.Tabs * 50)
        TabButton.BackgroundColor3 = Library.Theme.Secondary
        TabButton.Text = "  " .. name
        TabButton.TextColor3 = Library.Theme.TextDark
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.BorderSizePixel = 0
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.Parent = self.TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 10)
        TabCorner.Parent = TabButton
        
        -- Tab button gradient
        local TabGradient = Instance.new("UIGradient")
        TabGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
        }
        TabGradient.Rotation = 90
        TabGradient.Transparency = NumberSequence.new(1)
        TabGradient.Parent = TabButton
        
        -- Selection indicator
        local SelectionBar = Instance.new("Frame")
        SelectionBar.Name = "SelectionBar"
        SelectionBar.Size = UDim2.new(0, 0, 1, -10)
        SelectionBar.Position = UDim2.new(0, 0, 0, 5)
        SelectionBar.BackgroundColor3 = Library.Theme.Accent
        SelectionBar.BorderSizePixel = 0
        SelectionBar.Parent = TabButton
        
        local SelectionCorner = Instance.new("UICorner")
        SelectionCorner.CornerRadius = UDim.new(0, 4)
        SelectionCorner.Parent = SelectionBar
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Name = name .. "Content"
        TabContent.Size = UDim2.new(1, -20, 1, -20)
        TabContent.Position = UDim2.new(0, 10, 0, 10)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 4
        TabContent.ScrollBarImageColor3 = Library.Theme.Accent
        TabContent.Visible = false
        TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabContent.Parent = self.ContentContainer
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Padding = UDim.new(0, 10)
        UIListLayout.Parent = TabContent
        
        UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(self.Tabs) do
                local btn = tab.Button
                local selBar = btn:FindFirstChild("SelectionBar")
                local grad = btn:FindFirstChild("UIGradient")
                
                TweenService:Create(btn, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Secondary,
                    TextColor3 = Library.Theme.TextDark
                }):Play()
                
                if selBar then
                    TweenService:Create(selBar, Library.Animations.Fast, {
                        Size = UDim2.new(0, 0, 1, -10)
                    }):Play()
                end
                
                if grad then
                    TweenService:Create(grad, Library.Animations.Fast, {
                        Transparency = NumberSequence.new(1)
                    }):Play()
                end
                
                -- Smooth fade out content
                if tab.Content.Visible then
                    for _, child in ipairs(tab.Content:GetChildren()) do
                        if child:IsA("GuiObject") then
                            TweenService:Create(child, Library.Animations.UltraFast, {
                                BackgroundTransparency = 1,
                                TextTransparency = 1
                            }):Play()
                        end
                    end
                    wait(0.1)
                    tab.Content.Visible = false
                end
            end
            
            -- Animate selection bar
            local selectionBar = TabButton:FindFirstChild("SelectionBar")
            if selectionBar then
                TweenService:Create(selectionBar, Library.Animations.Spring, {
                    Size = UDim2.new(0, 4, 1, -10)
                }):Play()
            end
            
            -- Button color and gradient
            TweenService:Create(TabButton, Library.Animations.Fast, {
                BackgroundColor3 = Library.Theme.Border,
                TextColor3 = Library.Theme.Text
            }):Play()
            
            local tabGradient = TabButton:FindFirstChild("UIGradient")
            if tabGradient then
                TweenService:Create(tabGradient, Library.Animations.Fast, {
                    Transparency = NumberSequence.new(0)
                }):Play()
            end
            
            -- Smooth fade in content
            TabContent.Visible = true
            for i, child in ipairs(TabContent:GetChildren()) do
                if child:IsA("GuiObject") then
                    child.BackgroundTransparency = 1
                    if child:IsA("TextLabel") or child:IsA("TextButton") then
                        child.TextTransparency = 1
                    end
                    spawn(function()
                        wait(i * 0.02)
                        TweenService:Create(child, Library.Animations.Fast, {
                            BackgroundTransparency = 0
                        }):Play()
                        if child:IsA("TextLabel") or child:IsA("TextButton") then
                            TweenService:Create(child, Library.Animations.Fast, {
                                TextTransparency = 0
                            }):Play()
                        end
                    end)
                end
            end
            
            self.CurrentTab = Tab
        end)
        
        TabButton.MouseEnter:Connect(function()
            if self.CurrentTab ~= Tab then
                TweenService:Create(TabButton, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Border,
                    TextColor3 = Library.Theme.Text
                }):Play()
                
                local selBar = TabButton:FindFirstChild("SelectionBar")
                if selBar then
                    TweenService:Create(selBar, Library.Animations.UltraFast, {
                        Size = UDim2.new(0, 2, 1, -10)
                    }):Play()
                end
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if self.CurrentTab ~= Tab then
                TweenService:Create(TabButton, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Secondary,
                    TextColor3 = Library.Theme.TextDark
                }):Play()
                
                local selBar = TabButton:FindFirstChild("SelectionBar")
                if selBar then
                    TweenService:Create(selBar, Library.Animations.UltraFast, {
                        Size = UDim2.new(0, 0, 1, -10)
                    }):Play()
                end
            end
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        Tab.Elements = {}
        
        function Tab:AddButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Name = text
            Button.Size = UDim2.new(1, -10, 0, 38)
            Button.BackgroundColor3 = Library.Theme.Border
            Button.Text = text
            Button.TextColor3 = Library.Theme.Text
            Button.TextSize = 13
            Button.Font = Enum.Font.GothamMedium
            Button.BorderSizePixel = 0
            Button.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button
            
            -- Button gradient
            local ButtonGradient = Instance.new("UIGradient")
            ButtonGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 55)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
            }
            ButtonGradient.Rotation = 90
            ButtonGradient.Parent = Button
            
            -- Subtle border
            local ButtonStroke = Instance.new("UIStroke")
            ButtonStroke.Color = Library.Theme.Accent
            ButtonStroke.Thickness = 0
            ButtonStroke.Transparency = 0
            ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ButtonStroke.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                local stroke = Button:FindFirstChild("UIStroke")
                
                -- Press effect with glow
                TweenService:Create(Button, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Accent,
                    Size = UDim2.new(1, -12, 0, 36)
                }):Play()
                
                if stroke then
                    TweenService:Create(stroke, Library.Animations.UltraFast, {
                        Thickness = 2,
                        Transparency = 0.3
                    }):Play()
                end
                
                wait(0.08)
                pcall(callback)
                
                -- Spring back effect
                TweenService:Create(Button, Library.Animations.Spring, {
                    BackgroundColor3 = Library.Theme.Border,
                    Size = UDim2.new(1, -10, 0, 38)
                }):Play()
                
                if stroke then
                    TweenService:Create(stroke, Library.Animations.Fast, {
                        Thickness = 0,
                        Transparency = 1
                    }):Play()
                end
            end)
            
            Button.MouseEnter:Connect(function()
                local stroke = Button:FindFirstChild("UIStroke")
                
                TweenService:Create(Button, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Secondary,
                    Size = UDim2.new(1, -8, 0, 40)
                }):Play()
                
                if stroke then
                    TweenService:Create(stroke, Library.Animations.UltraFast, {
                        Thickness = 1,
                        Transparency = 0.5
                    }):Play()
                end
            end)
            
            Button.MouseLeave:Connect(function()
                local stroke = Button:FindFirstChild("UIStroke")
                
                TweenService:Create(Button, Library.Animations.UltraFast, {
                    BackgroundColor3 = Library.Theme.Border,
                    Size = UDim2.new(1, -10, 0, 38)
                }):Play()
                
                if stroke then
                    TweenService:Create(stroke, Library.Animations.UltraFast, {
                        Thickness = 0,
                        Transparency = 1
                    }):Play()
                end
            end)
            
            table.insert(self.Elements, Button)
            return Button
        end
        
        function Tab:AddToggle(text, default, callback)
            local toggled = default or false
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = text
            ToggleFrame.Size = UDim2.new(1, -10, 0, 35)
            ToggleFrame.BackgroundColor3 = Library.Theme.Border
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 6)
            ToggleCorner.Parent = ToggleFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -50, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Library.Theme.Text
            Label.TextSize = 13
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Position = UDim2.new(1, -45, 0.5, -10)
            ToggleButton.BackgroundColor3 = toggled and Library.Theme.Success or Library.Theme.Secondary
            ToggleButton.Text = ""
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Parent = ToggleFrame
            
            local ToggleButtonCorner = Instance.new("UICorner")
            ToggleButtonCorner.CornerRadius = UDim.new(1, 0)
            ToggleButtonCorner.Parent = ToggleButton
            
            local Circle = Instance.new("Frame")
            Circle.Size = UDim2.new(0, 16, 0, 16)
            Circle.Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            Circle.BackgroundColor3 = Library.Theme.Text
            Circle.BorderSizePixel = 0
            Circle.Parent = ToggleButton
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = Circle
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                -- Smooth color transition
                TweenService:Create(ToggleButton, Library.Animations.Silk, {
                    BackgroundColor3 = toggled and Library.Theme.Success or Library.Theme.Secondary
                }):Play()
                
                -- Elastic circle movement
                TweenService:Create(Circle, Library.Animations.Spring, {
                    Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
                    Size = toggled and UDim2.new(0, 16, 0, 16) or UDim2.new(0, 16, 0, 16)
                }):Play()
                
                -- Squeeze effect during transition
                TweenService:Create(Circle, Library.Animations.UltraFast, {
                    Size = UDim2.new(0, 14, 0, 18)
                }):Play()
                
                wait(0.1)
                TweenService:Create(Circle, Library.Animations.Spring, {
                    Size = UDim2.new(0, 16, 0, 16)
                }):Play()
                
                pcall(callback, toggled)
            end)
            
            table.insert(self.Elements, ToggleFrame)
            return ToggleFrame
        end
        
        function Tab:AddSlider(text, min, max, default, callback)
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Name = text
            SliderFrame.Size = UDim2.new(1, -10, 0, 50)
            SliderFrame.BackgroundColor3 = Library.Theme.Border
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Parent = TabContent
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 6)
            SliderCorner.Parent = SliderFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -20, 0, 20)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Library.Theme.Text
            Label.TextSize = 13
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = SliderFrame
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Size = UDim2.new(0, 50, 0, 20)
            ValueLabel.Position = UDim2.new(1, -60, 0, 5)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(default)
            ValueLabel.TextColor3 = Library.Theme.Accent
            ValueLabel.TextSize = 13
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = SliderFrame
            
            local SliderBar = Instance.new("Frame")
            SliderBar.Size = UDim2.new(1, -20, 0, 4)
            SliderBar.Position = UDim2.new(0, 10, 1, -15)
            SliderBar.BackgroundColor3 = Library.Theme.Secondary
            SliderBar.BorderSizePixel = 0
            SliderBar.Parent = SliderFrame
            
            local SliderBarCorner = Instance.new("UICorner")
            SliderBarCorner.CornerRadius = UDim.new(1, 0)
            SliderBarCorner.Parent = SliderBar
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Library.Theme.Accent
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderBar
            
            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(1, 0)
            SliderFillCorner.Parent = SliderFill
            
            local dragging = false
            
            SliderBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            SliderBar.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mousePos = input.Position.X
                    local sliderPos = SliderBar.AbsolutePosition.X
                    local sliderSize = SliderBar.AbsoluteSize.X
                    
                    local percent = math.clamp((mousePos - sliderPos) / sliderSize, 0, 1)
                    local value = math.floor(min + (max - min) * percent)
                    
                    ValueLabel.Text = tostring(value)
                    
                    TweenService:Create(SliderFill, Library.Animations.Fast, {
                        Size = UDim2.new(percent, 0, 1, 0)
                    }):Play()
                    
                    pcall(callback, value)
                end
            end)
            
            table.insert(self.Elements, SliderFrame)
            return SliderFrame
        end
        
        function Tab:AddTextbox(text, placeholder, callback)
            local TextboxFrame = Instance.new("Frame")
            TextboxFrame.Name = text
            TextboxFrame.Size = UDim2.new(1, -10, 0, 50)
            TextboxFrame.BackgroundColor3 = Library.Theme.Border
            TextboxFrame.BorderSizePixel = 0
            TextboxFrame.Parent = TabContent
            
            local TextboxCorner = Instance.new("UICorner")
            TextboxCorner.CornerRadius = UDim.new(0, 6)
            TextboxCorner.Parent = TextboxFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -20, 0, 20)
            Label.Position = UDim2.new(0, 10, 0, 5)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Library.Theme.Text
            Label.TextSize = 13
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = TextboxFrame
            
            local Textbox = Instance.new("TextBox")
            Textbox.Size = UDim2.new(1, -20, 0, 20)
            Textbox.Position = UDim2.new(0, 10, 1, -25)
            Textbox.BackgroundColor3 = Library.Theme.Secondary
            Textbox.Text = ""
            Textbox.PlaceholderText = placeholder
            Textbox.TextColor3 = Library.Theme.Text
            Textbox.PlaceholderColor3 = Library.Theme.TextDark
            Textbox.TextSize = 12
            Textbox.Font = Enum.Font.Gotham
            Textbox.BorderSizePixel = 0
            Textbox.ClearTextOnFocus = false
            Textbox.Parent = TextboxFrame
            
            local TextboxInputCorner = Instance.new("UICorner")
            TextboxInputCorner.CornerRadius = UDim.new(0, 4)
            TextboxInputCorner.Parent = Textbox
            
            Textbox.FocusLost:Connect(function(enter)
                if enter then
                    pcall(callback, Textbox.Text)
                end
            end)
            
            table.insert(self.Elements, TextboxFrame)
            return TextboxFrame
        end
        
        table.insert(self.Tabs, Tab)
        
        if #self.Tabs == 1 then
            TabButton.MouseButton1Click:Fire()
        end
        
        return Tab
    end
    
    return Window
end

function Library:Notification(text, duration)
    duration = duration or 3
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Size = UDim2.new(0, 0, 0, 50)
    NotificationFrame.Position = UDim2.new(1, -10, 1, -70)
    NotificationFrame.AnchorPoint = Vector2.new(1, 0)
    NotificationFrame.BackgroundColor3 = Library.Theme.Secondary
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.BackgroundTransparency = 0.1
    
    local NotificationCorner = Instance.new("UICorner")
    NotificationCorner.CornerRadius = UDim.new(0, 10)
    NotificationCorner.Parent = NotificationFrame
    
    -- Gradient effect
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Library.Theme.Accent),
        ColorSequenceKeypoint.new(1, Library.Theme.Secondary)
    }
    UIGradient.Rotation = 45
    UIGradient.Parent = NotificationFrame
    
    local NotificationLabel = Instance.new("TextLabel")
    NotificationLabel.Size = UDim2.new(1, -20, 1, 0)
    NotificationLabel.Position = UDim2.new(0, 10, 0, 0)
    NotificationLabel.BackgroundTransparency = 1
    NotificationLabel.Text = text
    NotificationLabel.TextColor3 = Library.Theme.Text
    NotificationLabel.TextSize = 13
    NotificationLabel.Font = Enum.Font.GothamMedium
    NotificationLabel.TextXAlignment = Enum.TextXAlignment.Left
    NotificationLabel.TextTransparency = 1
    NotificationLabel.Parent = NotificationFrame
    
    if game:GetService("CoreGui"):FindFirstChild("InovoProductions") then
        NotificationFrame.Parent = game:GetService("CoreGui"):FindFirstChild("InovoProductions")
    else
        local TempGui = Instance.new("ScreenGui")
        TempGui.Name = "InovoNotifications"
        TempGui.ResetOnSpawn = false
        TempGui.Parent = game:GetService("CoreGui")
        NotificationFrame.Parent = TempGui
    end
    
    -- Slide in with elastic bounce
    TweenService:Create(NotificationFrame, Library.Animations.Bounce, {
        Size = UDim2.new(0, 300, 0, 50),
        BackgroundTransparency = 0
    }):Play()
    
    TweenService:Create(NotificationLabel, Library.Animations.Fast, {
        TextTransparency = 0
    }):Play()
    
    -- Gradient animation
    spawn(function()
        while NotificationFrame.Parent do
            TweenService:Create(UIGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                Rotation = UIGradient.Rotation + 360
            }):Play()
            wait(2)
        end
    end)
    
    wait(duration)
    
    -- Smooth slide out
    TweenService:Create(NotificationFrame, Library.Animations.Silk, {
        Size = UDim2.new(0, 0, 0, 50),
        BackgroundTransparency = 1,
        Position = UDim2.new(1, 50, 1, -70)
    }):Play()
    
    TweenService:Create(NotificationLabel, Library.Animations.Fast, {
        TextTransparency = 1
    }):Play()
    
    wait(0.4)
    NotificationFrame:Destroy()
end

-- Mark library as loaded
getgenv().InovoLibraryLoaded = true
getgenv().InovoLibrary = Library

return Library

