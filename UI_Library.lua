-- Inovoproductions UI Library
-- Modern & Smooth Animation System

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

-- Animation Presets
Library.Animations = {
    Fast = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Medium = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Slow = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    Bounce = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    Smooth = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
}

function Library:CreateWindow(config)
    local Window = {}
    
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "InovoProductions"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Main Frame
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
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
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
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 50)
    TopBar.BackgroundColor3 = Library.Theme.Secondary
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 12)
    TopBarCorner.Parent = TopBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = config.Title or "Inovoproductions"
    Title.TextColor3 = Library.Theme.Text
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -45, 0, 5)
    CloseButton.BackgroundColor3 = Library.Theme.Error
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Library.Theme.Text
    CloseButton.TextSize = 24
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
    MinimizeButton.Position = UDim2.new(1, -90, 0, 5)
    MinimizeButton.BackgroundColor3 = Library.Theme.Accent
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Library.Theme.Text
    MinimizeButton.TextSize = 24
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Parent = TopBar
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 8)
    MinimizeCorner.Parent = MinimizeButton
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, -60)
    TabContainer.Position = UDim2.new(0, 10, 0, 60)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -170, 1, -70)
    ContentContainer.Position = UDim2.new(0, 165, 0, 60)
    ContentContainer.BackgroundColor3 = Library.Theme.Secondary
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 10)
    ContentCorner.Parent = ContentContainer
    
    -- Dragging functionality
    local dragging = false
    local dragInput, mousePos, framePos
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
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
            TweenService:Create(MainFrame, Library.Animations.Fast, {
                Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
            }):Play()
        end
    end)
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.Fast, {
            BackgroundColor3 = Library.Theme.Error:lerp(Color3.new(0, 0, 0), 0.3)
        }):Play()
        
        wait(0.1)
        
        TweenService:Create(MainFrame, Library.Animations.Medium, {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Minimize functionality
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        
        if minimized then
            TweenService:Create(MainFrame, Library.Animations.Smooth, {
                Size = UDim2.new(0, 300, 0, 50)
            }):Play()
        else
            TweenService:Create(MainFrame, Library.Animations.Bounce, {
                Size = UDim2.new(0, 650, 0, 450)
            }):Play()
        end
    end)
    
    -- Hover effects
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.Fast, {
            BackgroundColor3 = Library.Theme.Error:lerp(Color3.new(1, 1, 1), 0.1)
        }):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, Library.Animations.Fast, {
            BackgroundColor3 = Library.Theme.Error
        }):Play()
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, Library.Animations.Fast, {
            BackgroundColor3 = Library.Theme.AccentHover
        }):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, Library.Animations.Fast, {
            BackgroundColor3 = Library.Theme.Accent
        }):Play()
    end)
    
    -- Open animation
    TweenService:Create(MainFrame, Library.Animations.Bounce, {
        Size = UDim2.new(0, 650, 0, 450)
    }):Play()
    
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
        TabButton.Size = UDim2.new(1, -10, 0, 40)
        TabButton.Position = UDim2.new(0, 0, 0, #self.Tabs * 45)
        TabButton.BackgroundColor3 = Library.Theme.Secondary
        TabButton.Text = name
        TabButton.TextColor3 = Library.Theme.TextDark
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.GothamMedium
        TabButton.BorderSizePixel = 0
        TabButton.Parent = self.TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
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
                TweenService:Create(tab.Button, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Secondary,
                    TextColor3 = Library.Theme.TextDark
                }):Play()
                tab.Content.Visible = false
            end
            
            TweenService:Create(TabButton, Library.Animations.Fast, {
                BackgroundColor3 = Library.Theme.Accent,
                TextColor3 = Library.Theme.Text
            }):Play()
            
            TabContent.Visible = true
            self.CurrentTab = Tab
        end)
        
        TabButton.MouseEnter:Connect(function()
            if self.CurrentTab ~= Tab then
                TweenService:Create(TabButton, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Border
                }):Play()
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if self.CurrentTab ~= Tab then
                TweenService:Create(TabButton, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Secondary
                }):Play()
            end
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        Tab.Elements = {}
        
        function Tab:AddButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Name = text
            Button.Size = UDim2.new(1, -10, 0, 35)
            Button.BackgroundColor3 = Library.Theme.Border
            Button.Text = text
            Button.TextColor3 = Library.Theme.Text
            Button.TextSize = 13
            Button.Font = Enum.Font.Gotham
            Button.BorderSizePixel = 0
            Button.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                TweenService:Create(Button, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Accent
                }):Play()
                
                wait(0.1)
                pcall(callback)
                
                wait(0.1)
                TweenService:Create(Button, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Border
                }):Play()
            end)
            
            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Secondary
                }):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, Library.Animations.Fast, {
                    BackgroundColor3 = Library.Theme.Border
                }):Play()
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
                
                TweenService:Create(ToggleButton, Library.Animations.Fast, {
                    BackgroundColor3 = toggled and Library.Theme.Success or Library.Theme.Secondary
                }):Play()
                
                TweenService:Create(Circle, Library.Animations.Smooth, {
                    Position = toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
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
    
    local NotificationCorner = Instance.new("UICorner")
    NotificationCorner.CornerRadius = UDim.new(0, 8)
    NotificationCorner.Parent = NotificationFrame
    
    local NotificationLabel = Instance.new("TextLabel")
    NotificationLabel.Size = UDim2.new(1, -20, 1, 0)
    NotificationLabel.Position = UDim2.new(0, 10, 0, 0)
    NotificationLabel.BackgroundTransparency = 1
    NotificationLabel.Text = text
    NotificationLabel.TextColor3 = Library.Theme.Text
    NotificationLabel.TextSize = 13
    NotificationLabel.Font = Enum.Font.Gotham
    NotificationLabel.TextXAlignment = Enum.TextXAlignment.Left
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
    
    TweenService:Create(NotificationFrame, Library.Animations.Bounce, {
        Size = UDim2.new(0, 300, 0, 50)
    }):Play()
    
    wait(duration)
    
    TweenService:Create(NotificationFrame, Library.Animations.Medium, {
        Size = UDim2.new(0, 0, 0, 50)
    }):Play()
    
    wait(0.3)
    NotificationFrame:Destroy()
end

return Library

