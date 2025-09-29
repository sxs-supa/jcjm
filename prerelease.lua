local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Load MacLib
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:CreateWindow({
    Name = "JCJM Hub | Steal a Brainrot",
    Center = true,
    AutoShow = true
})

-- Pages (Tabs)
local pageBrainrots = Window:AddTab("Brainrots")
local pageVisuals  = Window:AddTab("Visuals")
local pageMisc     = Window:AddTab("Misc")
local pageSettings = Window:AddTab("Settings")

-- Floating logic
local verticalOffset = 0
local floatBP
local function updateFloat()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart
        if not floatBP then
            floatBP = Instance.new("BodyPosition")
            floatBP.MaxForce = Vector3.new(0, math.huge, 0)
            floatBP.P = 1250
            floatBP.D = 50
            floatBP.Parent = root
        end
        floatBP.Position = root.Position + Vector3.new(0, verticalOffset, 0)
    end
end
local function moveUp() verticalOffset = verticalOffset + 5 updateFloat() end
local function moveDown() verticalOffset = verticalOffset - 5 updateFloat() end

-- Brainrots Section
local stealingSection = pageBrainrots:AddSection("Stealing")
stealingSection:AddButton("Tween to Base Steal (method 1)", function() end)
stealingSection:AddButton("Tween to Base Steal (method 2)", function() end)
stealingSection:AddButton("Float to Base", function() end)
stealingSection:AddButton("Laser Steal (requires rebirth 9)", function() end)
stealingSection:AddButton("Move Up 5 Studs", moveUp)
stealingSection:AddButton("Move Down 5 Studs", moveDown)
stealingSection:AddToggle("Steal Boost", false, function(v) end)

-- Brainrot list
local brainrotList = {
    "Noobini Pizzanini (Common)","Lirili Larila (Common)","Tim Cheese (Common)","FluriFlura (Common)","Talpa Di Fero (Common)","Svinina Bombardino (Common)","Raccooni Jandelini (Common)","Pipi Kiwi (Common)","Pipi Corni (Common)",
    "Trippi Troppi (Rare)","Gangster Footera (Rare)","Bandito Bobritto (Rare)","Boneca Ambalabu (Rare)","Cacto Hipopotamo (Rare)","Ta Ta Ta Ta Sahur (Rare)","Tric Trac Baraboom (Rare)","Pipi Avocado (Rare)",
    "Cappuccino Assassino (Epic)","Bandito Axolito (Epic)","Brr Brr Patapim (Epic)","Avocadini Antilopini (Epic)","Trulimero Trulicina (Epic)","Bambini Crostini (Epic)","Malame Amarele (Epic)","Bananita Dolphinita (Epic)","Perochello Lemonchello (Epic)"
}

-- Finder & Buying
pageBrainrots:AddSection("Finder"):AddDropdown("Select Brainrot to Find", brainrotList, function(value)
    print("Finding:", value)
end)

pageBrainrots:AddSection("Buying"):AddDropdown("Select Brainrot to Buy", brainrotList, function(value)
    print("Buying:", value)
end)

-- Visuals
pageVisuals:AddSection("Visuals"):AddSlider("Placeholder", 1, 10, 5, function(v) print("Slider value:", v) end)

-- Misc Section
local miscSection = pageMisc:AddSection("Miscellaneous")
miscSection:AddButton("Anti Hit (reset to remove)", function() end)
miscSection:AddButton("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
miscSection:AddButton("Server Hop", function()
    local PlaceID = game.PlaceId
    local Success, Servers = pcall(function()
        return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if Success and Servers and Servers.data then
        local ServerList = {}
        for _, v in pairs(Servers.data) do
            if type(v) == "table" and v.id ~= game.JobId then
                table.insert(ServerList, v.id)
            end
        end
        if #ServerList > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceID, ServerList[math.random(1,#ServerList)], LocalPlayer)
        end
    end
end)

miscSection:AddSlider("Walkspeed", 1, 1000, 25, function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
end)

miscSection:AddSlider("Jump Power", 1, 2000, 75, function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = v
    end
end)

miscSection:AddToggle("Infinite Jump", false, function(v)
    _G.InfJump = v
end)

miscSection:AddToggle("Noclip", false, function(v)
    _G.Noclip = v
end)

-- RunService loops
RunService.Stepped:Connect(function()
    if _G.Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end
end)

-- Settings Section
local settingsSection = pageSettings:AddSection("Settings")
settingsSection:AddToggle("Auto-Load Script on Serverhop", true, function(v) _G.JCJMAutoLoad = v end)
settingsSection:AddSlider("UI Scale", 50, 200, 100, function(v)
    local scale = v / 100
    Window.Window.Size = UDim2.new(Window.Window.Size.X.Scale * scale, Window.Window.Size.X.Offset * scale, Window.Window.Size.Y.Scale * scale, Window.Window.Size.Y.Offset * scale)
end)
