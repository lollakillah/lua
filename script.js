// InovoProductions Script Hub - Main JavaScript File
class ScriptHub {
    constructor() {
        this.currentTheme = 'dark';
        this.scripts = [];
        this.currentTab = 'scripts';
        this.isExecuting = false;
        
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.loadScripts();
        this.updateTime();
        this.loadTheme();
        this.setupKeyboardShortcuts();
        
        // Initialize with smooth animations
        setTimeout(() => {
            document.body.style.opacity = '1';
        }, 100);
    }

    setupEventListeners() {
        // Navigation tabs
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', (e) => {
                const tab = e.currentTarget.dataset.tab;
                this.switchTab(tab);
            });
        });

        // Editor tabs
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const editor = e.currentTarget.dataset.editor;
                this.switchEditor(editor);
            });
        });

        // Theme selector
        document.getElementById('themeSelect').addEventListener('change', (e) => {
            this.changeTheme(e.target.value);
        });

        // Search functionality
        document.getElementById('scriptSearch').addEventListener('input', (e) => {
            this.filterScripts(e.target.value);
        });

        // Window controls
        window.addEventListener('beforeunload', () => {
            this.saveSettings();
        });

        // Auto-save editor content
        document.getElementById('scriptEditor').addEventListener('input', () => {
            this.saveEditorContent();
        });
    }

    switchTab(tabName) {
        // Remove active class from all nav items and tab contents
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
        });
        document.querySelectorAll('.tab-content').forEach(content => {
            content.classList.remove('active');
        });

        // Add active class to selected nav item and tab content
        document.querySelector(`[data-tab="${tabName}"]`).classList.add('active');
        document.getElementById(tabName).classList.add('active');

        this.currentTab = tabName;

        // Add smooth transition animation
        const activeContent = document.getElementById(tabName);
        activeContent.classList.add('fade-in');
        setTimeout(() => {
            activeContent.classList.remove('fade-in');
        }, 300);
    }

    switchEditor(editorType) {
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.classList.remove('active');
        });
        document.querySelector(`[data-editor="${editorType}"]`).classList.add('active');

        const editor = document.getElementById('scriptEditor');
        if (editorType === 'js') {
            editor.placeholder = `// Enter your JavaScript here...
// Example:
console.log('Hello from InovoProductions!');

// Your script goes here...`;
        } else {
            editor.placeholder = `-- Enter your Lua script here...
-- Example:
print('Hello from InovoProductions!')

-- Your script goes here...`;
        }
    }

    loadScripts() {
        // Sample scripts for demonstration
        this.scripts = [
            {
                id: 1,
                title: 'ESP Script',
                description: 'Enhanced ESP with customizable colors and features for better visibility.',
                icon: 'fas fa-eye',
                tags: ['ESP', 'Visual', 'Utility'],
                code: `-- ESP Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function createESP(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(0, 100, 0, 100)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.Parent = humanoidRootPart
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = billboardGui
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = character.Parent.Name
    textLabel.TextColor3 = Color3.new(1, 0, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer and player.Character then
        createESP(player.Character)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createESP(character)
    end)
end)`
            },
            {
                id: 2,
                title: 'Speed Script',
                description: 'Increase your walking and running speed for faster movement.',
                icon: 'fas fa-running',
                tags: ['Speed', 'Movement', 'Utility'],
                code: `-- Speed Script
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function speedUp()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 50 -- Adjust speed as needed
    end
end

speedUp()

player.CharacterAdded:Connect(speedUp)`
            },
            {
                id: 3,
                title: 'Fly Script',
                description: 'Enable flying mode with smooth controls and customizable speed.',
                icon: 'fas fa-plane',
                tags: ['Fly', 'Movement', 'Advanced'],
                code: `-- Fly Script
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local flySpeed = 50
local flyEnabled = false

local function fly()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local humanoidRootPart = player.Character.HumanoidRootPart
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = humanoidRootPart
    
    local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
    bodyAngularVelocity.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
    bodyAngularVelocity.Parent = humanoidRootPart
    
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if flyEnabled then
            local camera = workspace.CurrentCamera
            local moveVector = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVector = moveVector + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVector = moveVector - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVector = moveVector - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVector = moveVector + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveVector = moveVector + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVector = moveVector - Vector3.new(0, 1, 0)
            end
            
            bodyVelocity.Velocity = moveVector * flySpeed
        else
            bodyVelocity:Destroy()
            bodyAngularVelocity:Destroy()
            connection:Disconnect()
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        flyEnabled = not flyEnabled
        if flyEnabled then
            fly()
        end
    end
end)`
            },
            {
                id: 4,
                title: 'Noclip Script',
                description: 'Walk through walls and objects with collision detection disabled.',
                icon: 'fas fa-ghost',
                tags: ['Noclip', 'Collision', 'Utility'],
                code: `-- Noclip Script
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local noclipEnabled = false

local function noclip()
    if not player.Character then return end
    
    for _, part in pairs(player.Character:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.CanCollide = not noclipEnabled
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.N then
        noclipEnabled = not noclipEnabled
        noclip()
    end
end)

player.CharacterAdded:Connect(function()
    wait(1)
    noclip()
end)`
            },
            {
                id: 5,
                title: 'Auto Farm Script',
                description: 'Automated farming script for various games with customizable settings.',
                icon: 'fas fa-seedling',
                tags: ['Farm', 'Automation', 'Advanced'],
                code: `-- Auto Farm Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local farmEnabled = false

local function findNearestTarget()
    local nearestTarget = nil
    local shortestDistance = math.huge
    
    -- This is a template - customize based on your game
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:FindFirstChild("Humanoid") and obj ~= player.Character then
            local distance = (player.Character.HumanoidRootPart.Position - obj.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestTarget = obj
            end
        end
    end
    
    return nearestTarget
end

local function farm()
    if not farmEnabled or not player.Character then return end
    
    local target = findNearestTarget()
    if target then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:MoveTo(target.HumanoidRootPart.Position)
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.B then
        farmEnabled = not farmEnabled
        if farmEnabled then
            RunService.Heartbeat:Connect(farm)
        end
    end
end)`
            },
            {
                id: 6,
                title: 'Teleport Script',
                description: 'Teleport to any player or location with smooth transitions.',
                icon: 'fas fa-map-marker-alt',
                tags: ['Teleport', 'Movement', 'Utility'],
                code: `-- Teleport Script
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local function teleportToPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
    local humanoidRootPart = player.Character.HumanoidRootPart
    
    -- Smooth teleport with tween
    local tween = TweenService:Create(
        humanoidRootPart,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = targetPosition + Vector3.new(0, 5, 0)}
    )
    
    tween:Play()
end

-- Example usage: teleportToPlayer(Players:FindFirstChild("PlayerName"))`
            }
        ];

        this.renderScripts();
    }

    renderScripts() {
        const scriptsGrid = document.getElementById('scriptsGrid');
        scriptsGrid.innerHTML = '';

        this.scripts.forEach(script => {
            const scriptCard = document.createElement('div');
            scriptCard.className = 'script-card slide-up';
            scriptCard.innerHTML = `
                <div class="script-header">
                    <div class="script-icon">
                        <i class="${script.icon}"></i>
                    </div>
                    <div class="script-title">${script.title}</div>
                </div>
                <div class="script-description">${script.description}</div>
                <div class="script-tags">
                    ${script.tags.map(tag => `<span class="script-tag">${tag}</span>`).join('')}
                </div>
            `;

            scriptCard.addEventListener('click', () => {
                this.loadScriptToEditor(script);
                this.switchTab('executor');
            });

            scriptsGrid.appendChild(scriptCard);
        });
    }

    filterScripts(searchTerm) {
        const filteredScripts = this.scripts.filter(script =>
            script.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
            script.description.toLowerCase().includes(searchTerm.toLowerCase()) ||
            script.tags.some(tag => tag.toLowerCase().includes(searchTerm.toLowerCase()))
        );

        const scriptsGrid = document.getElementById('scriptsGrid');
        scriptsGrid.innerHTML = '';

        filteredScripts.forEach(script => {
            const scriptCard = document.createElement('div');
            scriptCard.className = 'script-card slide-up';
            scriptCard.innerHTML = `
                <div class="script-header">
                    <div class="script-icon">
                        <i class="${script.icon}"></i>
                    </div>
                    <div class="script-title">${script.title}</div>
                </div>
                <div class="script-description">${script.description}</div>
                <div class="script-tags">
                    ${script.tags.map(tag => `<span class="script-tag">${tag}</span>`).join('')}
                </div>
            `;

            scriptCard.addEventListener('click', () => {
                this.loadScriptToEditor(script);
                this.switchTab('executor');
            });

            scriptsGrid.appendChild(scriptCard);
        });
    }

    loadScriptToEditor(script) {
        const editor = document.getElementById('scriptEditor');
        editor.value = script.code;
        
        // Add smooth transition
        editor.style.opacity = '0';
        setTimeout(() => {
            editor.style.opacity = '1';
        }, 150);
    }

    executeScript() {
        if (this.isExecuting) return;
        
        const editor = document.getElementById('scriptEditor');
        const script = editor.value.trim();
        
        if (!script) {
            this.showNotification('Please enter a script to execute', 'warning');
            return;
        }

        this.isExecuting = true;
        this.showExecutionModal();

        // Simulate script execution
        setTimeout(() => {
            this.hideExecutionModal();
            this.isExecuting = false;
            this.showNotification('Script executed successfully!', 'success');
        }, 2000);
    }

    showExecutionModal() {
        const modal = document.getElementById('executionModal');
        modal.classList.add('active');
    }

    hideExecutionModal() {
        const modal = document.getElementById('executionModal');
        modal.classList.remove('active');
    }

    clearEditor() {
        const editor = document.getElementById('scriptEditor');
        editor.value = '';
        editor.focus();
        this.showNotification('Editor cleared', 'info');
    }

    changeTheme(theme) {
        this.currentTheme = theme;
        document.documentElement.setAttribute('data-theme', theme);
        this.saveSettings();
        
        // Add theme transition animation
        document.body.style.transition = 'all 0.3s ease';
        setTimeout(() => {
            document.body.style.transition = '';
        }, 300);
    }

    loadTheme() {
        const savedTheme = localStorage.getItem('scriptHubTheme') || 'dark';
        this.changeTheme(savedTheme);
        document.getElementById('themeSelect').value = savedTheme;
    }

    saveSettings() {
        localStorage.setItem('scriptHubTheme', this.currentTheme);
        localStorage.setItem('scriptHubEditorContent', document.getElementById('scriptEditor').value);
    }

    saveEditorContent() {
        localStorage.setItem('scriptHubEditorContent', document.getElementById('scriptEditor').value);
    }

    loadEditorContent() {
        const savedContent = localStorage.getItem('scriptHubEditorContent');
        if (savedContent) {
            document.getElementById('scriptEditor').value = savedContent;
        }
    }

    updateTime() {
        const timeElement = document.getElementById('currentTime');
        const updateTime = () => {
            const now = new Date();
            timeElement.textContent = now.toLocaleTimeString();
        };
        
        updateTime();
        setInterval(updateTime, 1000);
    }

    setupKeyboardShortcuts() {
        document.addEventListener('keydown', (e) => {
            // Ctrl + Enter to execute script
            if (e.ctrlKey && e.key === 'Enter') {
                e.preventDefault();
                this.executeScript();
            }
            
            // Ctrl + Shift + C to clear editor
            if (e.ctrlKey && e.shiftKey && e.key === 'C') {
                e.preventDefault();
                this.clearEditor();
            }
            
            // Escape to close modal
            if (e.key === 'Escape') {
                this.hideExecutionModal();
            }
        });
    }

    showNotification(message, type = 'info') {
        // Create notification element
        const notification = document.createElement('div');
        notification.className = `notification notification-${type}`;
        notification.innerHTML = `
            <div class="notification-content">
                <i class="fas fa-${this.getNotificationIcon(type)}"></i>
                <span>${message}</span>
            </div>
        `;

        // Add styles
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: var(--radius-md);
            padding: 12px 16px;
            color: var(--text-primary);
            box-shadow: var(--shadow-lg);
            z-index: 1001;
            transform: translateX(100%);
            transition: transform 0.3s ease;
        `;

        document.body.appendChild(notification);

        // Animate in
        setTimeout(() => {
            notification.style.transform = 'translateX(0)';
        }, 100);

        // Auto remove
        setTimeout(() => {
            notification.style.transform = 'translateX(100%)';
            setTimeout(() => {
                document.body.removeChild(notification);
            }, 300);
        }, 3000);
    }

    getNotificationIcon(type) {
        const icons = {
            success: 'check-circle',
            warning: 'exclamation-triangle',
            error: 'times-circle',
            info: 'info-circle'
        };
        return icons[type] || 'info-circle';
    }
}

// Window control functions
function minimizeWindow() {
    // In a real application, this would minimize the window
    document.body.style.transform = 'scale(0.95)';
    setTimeout(() => {
        document.body.style.transform = 'scale(1)';
    }, 200);
}

function closeWindow() {
    // In a real application, this would close the window
    document.body.style.opacity = '0';
    setTimeout(() => {
        if (confirm('Are you sure you want to close the Script Hub?')) {
            window.close();
        } else {
            document.body.style.opacity = '1';
        }
    }, 300);
}

function closeModal() {
    const modal = document.getElementById('executionModal');
    modal.classList.remove('active');
}

// Initialize the Script Hub when the page loads
document.addEventListener('DOMContentLoaded', () => {
    // Set initial opacity to 0 for fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    
    // Initialize the script hub
    window.scriptHub = new ScriptHub();
    
    // Load saved editor content
    window.scriptHub.loadEditorContent();
    
    // Add some initial animations
    setTimeout(() => {
        document.querySelectorAll('.script-card').forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
        });
    }, 500);
});

// Add some extra visual effects
document.addEventListener('mousemove', (e) => {
    const particles = document.querySelectorAll('.particle');
    particles.forEach((particle, index) => {
        const speed = (index + 1) * 0.5;
        const x = (e.clientX / window.innerWidth) * speed;
        const y = (e.clientY / window.innerHeight) * speed;
        particle.style.transform = `translate(${x}px, ${y}px)`;
    });
});

// Add click effects
document.addEventListener('click', (e) => {
    const ripple = document.createElement('div');
    ripple.style.cssText = `
        position: fixed;
        width: 20px;
        height: 20px;
        background: rgba(99, 102, 241, 0.3);
        border-radius: 50%;
        pointer-events: none;
        z-index: 9999;
        left: ${e.clientX - 10}px;
        top: ${e.clientY - 10}px;
        animation: ripple 0.6s ease-out;
    `;
    
    document.body.appendChild(ripple);
    
    setTimeout(() => {
        document.body.removeChild(ripple);
    }, 600);
});

// Add ripple animation
const style = document.createElement('style');
style.textContent = `
    @keyframes ripple {
        0% {
            transform: scale(0);
            opacity: 1;
        }
        100% {
            transform: scale(4);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);
