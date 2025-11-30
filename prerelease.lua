local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()
local Window = Luna:CreateWindow({
    Name = "Supa Hub",
    Subtitle = "Free - Keyless",
    LoadingEnabled = true,
    LoadingTitle = "Supa Hub",
    LoadingSubtitle = "Free - Keyless",
    ConfigSettings = { RootFolder = nil, ConfigFolder = "SupaHub" },
    KeySystem = false
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TPUpActive = false
local TPHeight = 5
local HumanoidRoot = nil
local FloatPart = nil
local FloatActive = false
local OriginalY = nil
local AutoLoadEnabled = false

local function updateCharacter()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    HumanoidRoot = character:WaitForChild("HumanoidRootPart")
    OriginalY = HumanoidRoot.Position.Y
end

updateCharacter()
LocalPlayer.CharacterAdded:Connect(updateCharacter)

-- Brainrots tab
local Brainrots = Window:CreateTab({ Name = "Brainrots", Icon = "inventory", ImageSource = "Material", ShowTitle = true })
Brainrots:CreateSection("Patched")
Brainrots:CreateButton({ Name = "Instant Steal Taser", Callback = function() end })
Brainrots:CreateButton({ Name = "Instant Steal Lamp", Callback = function() end })
for _, name in ipairs({ "Laser Gun Spam", "Paintball Gun Spam", "Walkfling" }) do
    Brainrots:CreateToggle({ Name = name, CurrentValue = false, Callback = function(v) end })
end

Brainrots:CreateSection("Stealing")
Brainrots:CreateToggle({ Name = "Anti Hit", CurrentValue = false, Callback = function(v) end })
Brainrots:CreateToggle({ Name = "Desync", CurrentValue = false, Callback = function(v) end })
Brainrots:CreateButton({ Name = "Permanent Desync", Callback = function() end })
Brainrots:CreateToggle({
    Name = "TP Up",
    CurrentValue = false,
    Callback = function(v)
        TPUpActive = v
        if v and HumanoidRoot then
            OriginalY = HumanoidRoot.Position.Y
        elseif not v and HumanoidRoot then
            HumanoidRoot.CFrame = CFrame.new(HumanoidRoot.Position.X, OriginalY, HumanoidRoot.Position.Z)
        end
    end
})
Brainrots:CreateToggle({ Name = "Steal Boost", CurrentValue = false, Callback = function(v) end })
Brainrots:CreateToggle({ Name = "Kick on Steal", CurrentValue = false, Callback = function(v) end })
Brainrots:CreateToggle({
    Name = "Float",
    CurrentValue = false,
    Callback = function(v)
        FloatActive = v
        if v then
            if not FloatPart then
                FloatPart = Instance.new("Part")
                FloatPart.Anchored = true
                FloatPart.CanCollide = true
                FloatPart.Size = Vector3.new(5,0.2,5)
                FloatPart.Color = Color3.fromRGB(0,170,255)
                FloatPart.Transparency = 0.5
                FloatPart.Parent = workspace
            end
        else
            if FloatPart then
                FloatPart:Destroy()
                FloatPart = nil
            end
        end
    end
})

Brainrots:CreateSection("Buy / Sell")
local BrainrotList = { "Noobini Pizzanini", "Coming Soon" }
Brainrots:CreateDropdown({ Name = "Auto-Buy", Options = BrainrotList, CurrentOption = {BrainrotList[1]}, MultipleOptions = true, Callback = function(v) end })
Brainrots:CreateDropdown({ Name = "Auto-Buy Rarity", Options = {"Common","Rare","Epic","Legendary","Mythic","Brainrot God","Secret","OG"}, CurrentOption = {"Common"}, MultipleOptions = true, Callback = function(v) end })
Brainrots:CreateDropdown({ Name = "Auto-Sell", Options = BrainrotList, CurrentOption = {BrainrotList[1]}, MultipleOptions = true, Callback = function(v) end })
Brainrots:CreateDropdown({ Name = "Auto-Sell Rarity", Options = {"Common","Rare","Epic","Legendary","Mythic","Brainrot God","Secret","OG"}, CurrentOption = {"Common"}, MultipleOptions = true, Callback = function(v) end })

-- ESP tab
local ESP = Window:CreateTab({ Name = "ESP", Icon = "visibility", ImageSource = "Material", ShowTitle = true })
ESP:CreateSection("ESP")
for _, name in ipairs({ "Player Boxes", "Player Tracers", "Base Timer ESP", "Base Glow", "Base X-Ray", "Base Tracers", "Camera Noclip", "Fullbright" }) do
    ESP:CreateToggle({ Name = name, CurrentValue = false, Callback = function(v) end })
end
ESP:CreateColorPicker({ Name = "ESP Color", Color = Color3.new(1,1,1), Callback = function(c) end })
ESP:CreateToggle({ Name = "Rainbow ESP", CurrentValue = false, Callback = function(v) end })

-- Miscellaneous tab
local Misc = Window:CreateTab({ Name = "Miscellaneous", Icon = "build", ImageSource = "Material", ShowTitle = true })
Misc:CreateSection("Miscellaneous")
Misc:CreateSlider({ Name = "Walk Speed", Range = {1,500}, Increment = 1, CurrentValue = 16, Callback = function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
end })
Misc:CreateSlider({ Name = "Jump Power", Range = {1,200}, Increment = 1, CurrentValue = 50, Callback = function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = v
    end
end })
Misc:CreateToggle({ Name = "Infinite Jump", CurrentValue = false, Callback = function(v) _G.InfJump = v end })
Misc:CreateToggle({ Name = "Noclip", CurrentValue = false, Callback = function(v) _G.Noclip = v end })

-- Finder tab
local Finder = Window:CreateTab({ Name = "Finder", Icon = "search", ImageSource = "Material", ShowTitle = true })
Finder:CreateSection("Finder")
Finder:CreateToggle({ Name = "Start Serverhop", CurrentValue = false, Callback = function(v) _G.FinderServerhop = v end })
Finder:CreateDropdown({ Name = "Brainrot To Find", Options = BrainrotList, CurrentOption = {BrainrotList[1]}, MultipleOptions = false, Callback = function(v) end })
Finder:CreateDropdown({ Name = "Rarity To Find", Options = {"Common","Rare","Epic","Legendary","Mythic","Brainrot God","Secret","OG"}, CurrentOption = {"Common"}, MultipleOptions = false, Callback = function(v) end })
Finder:CreateSlider({
    Name = "Money To Find",
    Range = {1000,30000000000},
    Increment = 1000,
    CurrentValue = 10000000,
    Format = function(value)
        if value >= 1e9 then
            return math.floor(value/1e9).."b"
        elseif value >= 1e6 then
            return math.floor(value/1e6).."m"
        elseif value >= 1e3 then
            return math.floor(value/1e3).."k"
        else
            return value
        end
    end,
    Callback = function(v) _G.FinderMoneyTarget = v end
})

-- Settings tab
local Settings = Window:CreateTab({ Name = "Settings", Icon = "settings", ImageSource = "Material", ShowTitle = true })
Settings:CreateSection("Settings")
Settings:CreateToggle({ Name = "Auto-Load", CurrentValue = false, Callback = function(v) AutoLoadEnabled = v end })
Settings:CreateButton({ Name = "Rejoin", Callback = function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end })
Settings:CreateButton({ Name = "Serverhop", Callback = function()
    local TeleportService = game:GetService("TeleportService")
    local PlaceId = game.PlaceId
    local Servers = {}
    local Success,Response = pcall(function()
        return game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if Success and Response.data then
        for _,s in pairs(Response.data) do
            if s.id ~= game.JobId and s.maxPlayers > s.playing then
                table.insert(Servers,s.id)
            end
        end
    end
    if #Servers > 0 then
        TeleportService:TeleportToPlaceInstance(PlaceId, Servers[math.random(1,#Servers)], LocalPlayer)
    end
end })
Settings:CreateButton({ Name = "Leave", Callback = function() LocalPlayer:Kick("Left via Supa Hub") end })
Settings:CreateSlider({ Name = "UI Scale", Range = {50,200}, Increment = 1, CurrentValue = 50, Callback = function(v) Window:SetScale(v/100) end })

-- Auto-Load function on teleport
if AutoLoadEnabled then
    Players.LocalPlayer.OnTeleport:Connect(function()
        loadstring(game:HttpGet("SCRIPT_URL_HERE"))()
    end)
end

-- TP Up and Float loop
spawn(function()
    while true do
        if TPUpActive and HumanoidRoot then
            HumanoidRoot.CFrame = CFrame.new(HumanoidRoot.Position.X, OriginalY + TPHeight, HumanoidRoot.Position.Z)
        end
        if FloatActive and HumanoidRoot and FloatPart then
            FloatPart.Position = Vector3.new(HumanoidRoot.Position.X, HumanoidRoot.Position.Y - 2.5, HumanoidRoot.Position.Z)
        end
        wait(0.05)
    end
end)