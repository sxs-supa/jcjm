local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

local UI = Venyx.new("JCJM Hub | Steal a Brainrot", 5012544693)

local pageBrainrots = UI:addPage("Brainrots", 5012544693)
local pageVisuals  = UI:addPage("Visuals", 5012544693)
local pageMisc     = UI:addPage("Misc", 5012544693)
local pageSettings = UI:addPage("Settings", 5012544693)

local stealingSection = pageBrainrots:addSection("Stealing")
stealingSection:addButton("Tween to Base Steal (method 1)", function() end)
stealingSection:addButton("Tween to Base Steal (method 2)", function() end)  
stealingSection:addButton("Float to Base", function() end)
stealingSection:addButton("Laser Steal (requires rebirth 9)", function() end)
stealingSection:addButton("Move Up 5 Studs", function() end)
stealingSection:addButton("Move Down 5 Studs", function() end)
stealingSection:addToggle("Steal Boost", false, function(v) end)
local buyingSection = pageBrainrots:addSection("Buying")
local brainrotsSection = pageBrainrots:addSection("Finder")

local visualsSection = pageVisuals:addSection("Visuals")
visualsSection:addSlider("Placeholder", 1, 10, 5, function(v) end)

local miscSection = pageMisc:addSection("")
miscSection:addButton("Placeholder", function() end)

local settingsSection = pageSettings:addSection("Settings")
settingsSection:addTextbox("Placeholder", "Default", function(v) end)

UI:SelectPage(UI.pages[1], true)
