-- Load Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create main window
local Window = Library.CreateLib("JCJM Hub", "Gray") -- theme: Gray

-- Pages (Tabs)
local TabStealing = Window:NewTab("Stealing")
local TabVisuals  = Window:NewTab("Visuals")
local TabMisc     = Window:NewTab("Misc")
local TabSettings = Window:NewTab("Settings")

-- Sections
local SectionStealing = TabStealing:NewSection("Placeholder Section")
local SectionVisuals  = TabVisuals:NewSection("Placeholder Section")
local SectionMisc     = TabMisc:NewSection("Placeholder Section")
local SectionSettings = TabSettings:NewSection("Placeholder Section")

-- Add placeholders to Stealing
SectionStealing:NewButton("Placeholder Button", function() end)
SectionStealing:NewToggle("Placeholder Toggle", function(state) end)
SectionStealing:NewSlider("Placeholder Slider", 1, 100, 50, function(val) end)

-- Add placeholders to Visuals
SectionVisuals:NewButton("Placeholder Button", function() end)
SectionVisuals:NewToggle("Placeholder Toggle", function(state) end)
SectionVisuals:NewSlider("Placeholder Slider", 1, 100, 50, function(val) end)

-- Add placeholders to Misc
SectionMisc:NewButton("Placeholder Button", function() end)
SectionMisc:NewToggle("Placeholder Toggle", function(state) end)
SectionMisc:NewSlider("Placeholder Slider", 1, 100, 50, function(val) end)

-- Add placeholders to Settings
SectionSettings:NewButton("Placeholder Button", function() end)
SectionSettings:NewToggle("Placeholder Toggle", function(state) end)
SectionSettings:NewSlider("Placeholder Slider", 1, 100, 50, function(val) end)

-- Kavo UI windows are draggable by default
