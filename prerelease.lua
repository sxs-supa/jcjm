-- Load Venyx UI
local Venyx = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

-- Create the main window
local UI = Venyx.new("Test Window", 5012544693) -- second arg is optional icon ID

-- Pages (Tabs)
local pageStealing = UI:addPage("Stealing", 5012544693)
local pageVisuals  = UI:addPage("Visuals", 5012544693)
local pageMisc     = UI:addPage("Misc", 5012544693)
local pageSettings = UI:addPage("Settings", 5012544693)

-- Sections and placeholders
local stealingSection = pageStealing:addSection("Placeholder")
stealingSection:addToggle("Placeholder", false, function(v) end)

local visualsSection = pageVisuals:addSection("Placeholder")
visualsSection:addSlider("Placeholder", 1, 10, 5, function(v) end)

local tpSection = pageTP:addSection("Placeholder")
tpSection:addButton("Placeholder", function() end)

local infoSection = pageInfo:addSection("Placeholder")
infoSection:addTextbox("Placeholder", "Default", function(v) end)

-- Show the UI
UI:SelectPage(UI.pages[1], true)
