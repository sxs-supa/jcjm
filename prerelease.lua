local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()
local UI = Venyx.new("JCJM Hub | Steal a Brainrot", 5012544693)

local pageBrainrots = UI:addPage("Brainrots", 5012544693)
local pageVisuals  = UI:addPage("Visuals", 5012544693)
local pageMisc     = UI:addPage("Misc", 5012544693)
local pageSettings = UI:addPage("Settings", 5012544693)

-- Brainrots stealing section
local stealingSection = pageBrainrots:addSection("Stealing")
stealingSection:addButton("Tween to Base Steal (method 1)", function() end)
stealingSection:addButton("Tween to Base Steal (method 2)", function() end)
stealingSection:addButton("Float to Base", function() end)
stealingSection:addButton("Move Up 5 Studs", function()
    verticalOffset = verticalOffset + 5
end)
stealingSection:addButton("Move Down 5 Studs", function()
    verticalOffset = verticalOffset - 5
end)
stealingSection:addToggle("Steal Boost", false, function(v) end)

-- Brainrots buying section
local buyingSection = pageBrainrots:addSection("Buying")
local brainrotsList = {
    "Noobini Pizzanini (Common)", "Lirili Larila (Common)", "Tim Cheese (Common)", "FluriFlura (Common)", "Talpa Di Fero (Common)",
    "Svinina Bombardino (Common)", "Raccooni Jandelini (Common)", "Pipi Kiwi (Common)", "Pipi Corni (Common)",
    "Trippi Troppi (Rare)", "Gangster Footera (Rare)", "Bandito Bobritto (Rare)", "Boneca Ambalabu (Rare)", "Cacto Hipopotamo (Rare)",
    "Ta Ta Ta Ta Sahur (Rare)", "Tric Trac Baraboom (Rare)", "Pipi Avocado (Rare)", "Cappuccino Assassino (Epic)",
    "Bandito Axolito (Epic)", "Brr Brr Patapim (Epic)", "Avocadini Antilopini (Epic)", "Trulimero Trulicina (Epic)", "Bambini Crostini (Epic)",
    "Malame Amarele (Epic)", "Bananita Dolphinita (Epic)", "Perochello Lemonchello (Epic)", "Brri Brri Bicus Dicus Bombicus (Epic)",
    "Avocadini Guffo (Epic)", "Ti Ti Ti Sahur (Epic)", "Mangolini Parrocini (Epic)", "Penguino Cocosino (Epic)", "Salamino Penguino (Epic)",
    "Burbaloni Lolololi (Legendary)", "Chimpanzini Bananini (Legendary)", "Ballerina Cappuccina (Legendary)", "Chef Crabracadabra (Legendary)",
    "Lionel Cactuseli (Legendary)", "Quivioli Ameleonni (Legendary)", "Glorbo Fruttodrillo (Legendary)", "Caramello Filtrello (Legendary)",
    "Pipi Potato (Legendary)", "Blueberrini Octopusin (Legendary)", "Strawberelli Flamingelli (Legendary)", "Pandaccini Bananini (Legendary)",
    "Cocosini Mama (Legendary)", "Pi Pi Watermelon (Legendary)", "Signore Carapace (Legendary)", "Sigma Boy (Legendary)",
    "Frigo Camelo (Mythic)", "Orangutini Ananassini (Mythic)", "Rhino Toasterino (Mythic)", "Bombardiro Crocodilo (Mythic)",
    "Brutto Gialutto (Mythic)", "Spioniro Golubiro (Mythic Lucky Block)", "Bombombini Gusini (Mythic)", "Zibra Zubra Zibralini (Mythic Lucky Block)",
    "Tigrilini Watermelini (Mythic Lucky Block)", "Avocadorilla (Mythic)", "Cavallo Virtuso (Mythic)", "Gorillo Subwoofero (Mythic)",
    "Gorillo Watermelondrillo (Mythic)", "Tob Tobi Tobi (Mythic)", "Lerulerulerule (Mythic)", "Ganganzelli Trulala (Mythic)", "Te Te Te Sahur (Mythic)",
    "Rhino Helicopterino (Mythic)", "Tracoducotulu Delapeladustuz (Mythic)", "Los Noobinis (Mythic)", "Carloo (Mythic)", "Carrotini Brainini (Mythic Lucky Block)",
    "Cocofanto Elefanto (Brainrot God)", "Antonio (Brainrot God)", "Coco Elefanto (Brainrot God)", "Girafa Celestre (Brainrot God)", "Gattatino Nyanino (Brainrot God)",
    "Chihuanini Taconini (Brainrot God)", "Matteo (Brainrot God)", "Tralalero Tralala (Brainrot God)", "Los Crocodillitos (Brainrot God)", "Trigoligre Frutonni (Brainrot God Lucky Block)",
    "Espresso Signora (Brainrot God)", "Odin Din Din Dun (Brainrot God)", "Statutino Libertino (Brainrot God)", "Tipi Topi Taco (Brainrot God)", "Unclito Samito (Brainrot God)",
    "Alessio (Brainrot God)", "Orcalero Orcala (Brainrot God)", "Tralalita Tralala (Brainrot God)", "Tukanno Bananno (Brainrot God)", "Trenostruzzo Turbo 3000 (Brainrot God)",
    "Urubini Flamenguini (Brainrot God)", "Gattito Tacoto (Brainrot God)", "Trippi Troppi Troppa Trippa (Brainrot God)", "Las Cappuchinas (Brainrot God)", "Ballerino Lololo (Brainrot God)",
    "Bulbito Bandito Traktorito (Brainrot God Lucky Block)", "Los Tungtungtungcitos (Brainrot God)", "Pakrahmatmamat (Brainrot God)", "Los Bombinitos (Brainrot God)",
    "Brr es Teh Patipum (Brainrot God)", "Piccione Macchina (Brainrot God)", "Bombardini Tortini (Brainrot God)", "Tractoro Dinosauro (Brainrot God)", "Los Orcalitos (Brainrot God)",
    "Orcalita Orcala (Brainrot God)", "Cacasito Satalito (Brainrot God)", "Tartaruga Cisterna (Brainrot God)", "Los Tipi Tacos (Brainrot God)", "Piccionetta Macchina (Brainrot God)",
    "Mastodontico Telepiedone (Brainrot God Lucky Block)", "Anpali Babel (Brainrot God)", "Belula Beluga (Brainrot God)", "La Vacca Saturno Saturnita (Secret)",
    "Bisonte Giuppitere (Secret)", "Los Matteos (Secret)", "La Karkerkar Combinasion (Secret)", "Trenostruzzo Turbo 4000 (Secret)", "Sammyni Spyderini (Secret)",
    "Torrtuginni Dragonfrutini (Secret Lucky Block)", "Dul Dul Dul (Secret)", "Blackhole Goat (Secret)", "Agarrini la Palini (Secret)", "Los Spyderinis (Secret)",
    "Fragola la la la (Secret)", "Chimpanzini Spiderini (Secret)", "Tortuginni Dragonfruitini (Secret Lucky Block)", "Los Tralaleritos (Secret)", "Guerriro Digitale (Secret)",
    "Las Tralaleritas (Secret)", "Job Job Job Sahur (Secret)", "To To To Sahur (Secret)", "La Sahur Combinasion (Secret)", "Las Vaquitas Saturnitas (Secret)",
    "Graipuss Medussi (Secret)", "Noo My Hotspot (Secret)", "Sahur Combinasion (Secret)", "Pot Hotspot (Secret Lucky Block)", "Chicleteira Bicicleteira (Secret)",
    "Los Nooo My Hotspotsitos (Secret)", "La Grande Combinasion (Secret)", "Los Combinasionas (Secret)", "Nuclearo Dinossauro (Secret)", "Los Hotspotsitos (Secret)",
    "Tralaledon (Secret)", "Esok Sekolah (Secret)", "Ketupat Kepat (Secret)", "Los Bros (Secret)", "La Supreme Combinasion (Secret)", "Ketchuru and Masturu (Secret)",
    "Garama and Madundung (Secret)", "Spaghetti Tualetti (Secret)", "Dragon Cannelloni (Secret)", "Strawberry Elephant (OG)"
}

finderSection = pageBrainrots:addSection("Finder")
finderSection:addDropdown("Select Brainrot to Find", brainrotsList, nil, function() end)
buyingSection:addDropdown("Select Brainrot to Buy", brainrotsList, nil, function() end)

-- Floating system
local verticalOffset = 0
local floatBP
RunService.RenderStepped:Connect(function()
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
end)

-- Visuals section
local visualsSection = pageVisuals:addSection("Visuals")
visualsSection:addSlider("Placeholder", 1, 10, 5, function(v) end)

-- Misc
local miscSection = pageMisc:addSection("Miscellaneous")
miscSection:addButton("Anti Hit (reset to remove)", function() end)
miscSection:addButton("Rejoin", function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)
miscSection:addButton("Server Hop", function()
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
            local RandomServer = ServerList[math.random(1,#ServerList)]
            TeleportService:TeleportToPlaceInstance(PlaceID, RandomServer, LocalPlayer)
        end
    end
end)
miscSection:addSlider("Walkspeed", 1, 1000, 25, function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
end)
miscSection:addSlider("Jump Power", 1, 2000, 75, function(v)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = v
    end
end)
miscSection:addToggle("Infinite Jump", false, function(v)
    _G.InfJump = v
    if v then
        UserInputService.JumpRequest:Connect(function()
            if _G.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end
end)
miscSection:addToggle("Noclip", false, function(v)
    _G.Noclip = v
    if v then
        RunService.Stepped:Connect(function()
            if _G.Noclip and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end
end)

-- Settings
local settingsSection = pageSettings:addSection("Settings")
settingsSection:addSlider("UI Scale", 50, 200, 100, function(v)
    UI.container.Size = UDim2.new(0, 500*v/100, 0, 500*v/100)
end)
settingsSection:addToggle("Auto-Load Script on Serverhop", true, function(v)
    _G.JCJMAutoLoad = v
end)

-- Draggable Open/Close Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0,60,0,60)
button.Position = UDim2.new(0,100,0,100)
button.BackgroundColor3 = Color3.fromRGB(0,0,0)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextScaled = true
button.Text = "Close"
button.AnchorPoint = Vector2.new(0.5,0.5)
button.Parent = game.CoreGui
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.5,0)
uiCorner.Parent = button

local dragging = false
local dragInput, dragStart, startPos

local function toggleGUI()
    local gui = UI.container
    if gui.Visible then
        local tweenOut = TweenService:Create(gui, TweenInfo.new(0.3), {BackgroundTransparency = 1})
        tweenOut:Play()
        tweenOut.Completed:Connect(function() gui.Visible = false end)
        button.Text = "Open"
    else
        gui.Visible = true
        gui.BackgroundTransparency = 1
        local tweenIn = TweenService:Create(gui, TweenInfo.new(0.3), {BackgroundTransparency = 0})
        tweenIn:Play()
        button.Text = "Close"
    end
end

button.MouseButton1Click:Connect(toggleGUI)
button.TouchTap:Connect(toggleGUI)

local function update(input)
    local delta = input.Position - dragStart
    button.Position = UDim2.new(0, startPos.X + delta.X, 0, startPos.Y + delta.Y)
end

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Vector2.new(button.Position.X.Offset, button.Position.Y.Offset)
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

UI:SelectPage(UI.pages[1], true)
