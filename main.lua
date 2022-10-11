local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Window = Library.CreateLib("Hydra Script", "Ocean")

Notification.new("warning", "Use RightShift to toggle menu!", "Use RightShift to toggle menu!"):deleteTimeout(10)
Notification.new("warning", "Use RightShift to toggle menu!", "Use RightShift to toggle menu!"):deleteTimeout(10)
Notification.new("success", "Successfully loaded Hydra Script", "Have fun!"):deleteTimeout(10)

local defaultJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local defaultWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed

local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("LocalPlayer")

PlayerSection:NewSlider("WalkSpeed", "Change your walkspeed", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Change your jump power", 350, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = s
end)

PlayerSection:NewSlider("FOV", "Change your FOV", 120, 70, function(s)
    game.Workspace.CurrentCamera.FieldOfView = s
end)

PlayerSection:NewButton("Reset Character", "Reset your character", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

PlayerSection:NewButton("Reset Player Mods", "Resets to all default", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = defaultJumpPower
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = defaultWalkSpeed
    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpHeight  = defaultJumpPower
    game.Workspace.CurrentCamera.FieldOfView = 70
end)

local InfiniteJumpEnabled;
PlayerSection:NewToggle("Infinite Jump", "By toggling this you can jump infinitely.", function(State)
    InfiniteJumpEnabled = State
end)

local Player = game:GetService("Players").LocalPlayer
game:GetService("UserInputService").JumpRequest:Connect(function()
     if InfiniteJumpEnabled then
         Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
     end
end)


--PlayerSection:NewDropdown("DropdownText", "DropdownInf", {"Option 1", "Option 2", "Option 3"}, function(currentOption)
--    print(currentOption)
--end)


-- SCRIPTS

local Universal = Window:NewTab("Universal Scripts")
local UniversalSect = Universal:NewSection("Universal Scripts")

UniversalSect:NewButton("Infinite Yield", "FE Admin Commands", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

UniversalSect:NewButton("DomainX", "FE Script Hub ( best universal aimbot )", function()
    Notification.new("warning", "Please be patient", "DomainX is loading ( this may take a while )"):deleteTimeout(7)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
end)

UniversalSect:NewButton("Aimbot & ESP", "FE Aimbot & ESP, glitchy, use DomainX", function()
    Notification.new("warning", "Injected Universal Aimbot", "Using Sirius Universal is recommended ( DomainX )"):deleteTimeout(7)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/Miscellaneous/main/UNIVERSAL.lua"))()
end)

UniversalSect:NewButton("Aimbot No ESP", "FE Aimbot, glitchy, use DomainX", function()
    Notification.new("warning", "Injected Universal Aimbot", "Using Sirius Universal is recommended ( DomainX )"):deleteTimeout(7)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua"))()
end)

local Troll = Window:NewTab("Trolling Scripts")
local TrollSect = Troll:NewSection("Trolling Scripts")

TrollSect:NewButton("Telekineses", "Lets you move unanchored blocks", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZlol/roblox-scripts/main/telekenisis.lua"))()
end)

TrollSect:NewButton("No Chat Filter", "Lets you say whatever you want in chat", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZlol/roblox-scripts/main/chatFilter.lua",true))()
end)

TrollSect:NewButton("Become Tall", "Become very tall, requires certain body type", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZlol/roblox-scripts/main/tall.lua",true))()
end)


TrollSect:NewButton("Unanchored TP", "Teleport all unachored blocks to a certain player", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WkZwcGjf", true))()
end)

-- HORROR SCRIPTS

local Horror = Window:NewTab("Horror Scripts")
local HorrorSect = Horror:NewSection("Horror Scripts")

HorrorSect:NewButton("Doors", "Doors script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua"))()
end)



-- SIMULATOR SCRIPTS

local Simulator = Window:NewTab("Simulator Scripts")
local SimulatorSect = Simulator:NewSection("Simulator Scripts")

SimulatorSect:NewButton("Ninja Legends", "Ninja Legends script / autofarm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/44"))()
end)


-- ADVENTURE GAME SCRIPTS

local Adventure = Window:NewTab("Adventure Scripts")
local AdventureSect = Adventure:NewSection("Adventure Scripts")

AdventureSect:NewButton("Jailbreak", "Jailbreak script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))()
end)

AdventureSect:NewButton("DaHood", "DaHood script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
end)


-- OTHER

local Other = Window:NewTab("Other")
local OtherSect = Other:NewSection("Other")

OtherSect:NewButton("test", "test", function()
    Notification.new("warning", "test", "test"):deleteTimeout(7)
end)


local u = game:GetService("UserInputService")

u.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        Library:ToggleUI()
   end
end)
