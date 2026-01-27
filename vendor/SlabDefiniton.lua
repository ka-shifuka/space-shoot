---@meta

--- Unoficial type definition for Slab library

---@class Slab
local Slab = {}

--- Window

---@class Slab.BeginWindowOptions
---@field X? number
---@field Y? number
---@field W? number
---@field H? number
---@field ContentW? number
---@field ContentH? number
---@field BgColor? table
---@field Title? string
---@field TitleH? number
---@field TitleAlignX? "left" | "center" | "right"
---@field TitleAlignY? "top" | "center" | "bottom"
---@field AllowMove? boolean
---@field AllowResize? boolean
---@field AllowFocus? boolean
---@field Border? number
---@field NoOutline? boolean
---@field IsMenuBar? boolean
---@field AutoSizeWindow? boolean
---@field AutoSizeWindowW? boolean
---@field AutoSizeWindowH? boolean
---@field AutoSizeContent? boolean
---@field Layer? string
---@field ResetPosition? boolean
---@field ResetSize? boolean
---@field ResetContent? boolean
---@field ResetLayout? boolean
---@field SizerFilter? table
---@field CanObstruct? boolean
---@field Rounding? number
---@field IsOpen? boolean
---@field NoSaveSettings? boolean
---@field ConstrainPosition? boolean
---@field ShowMinimize? boolean
---@field ShowScrollbarX? boolean
---@field ShowScrollbarY? boolean

---@param id string
---@param options? Slab.BeginWindowOptions
---@return boolean
Slab.BeginWindow = function(id, options)
end

Slab.EndWindow = function()
end

---@return number, number
Slab.GetWindowPosition = function()
end

---@return number, number
Slab.GetWindowContentSize = function()
end

---@return number, number
Slab.GetWindowActiveSize = function()
end

---@return boolean
Slab.IsWindowAppearing = function()
end

---@param id string
Slab.PushID = function(id)
end

Slab.PopID = function()
end

--- End Window

--- Style

---@return table
Slab.GetStyle = function()
end

---@param font love.graphics.Font
Slab.PushFont = function(font)
end

Slab.PopFont = function()
end

--- Style Api Tomorrow
--- End Style

--- Menus Tomorrow
--- Dialog Tomorrow
--- Color Picker Tomorrow
--- Dock Tomorrow

--- Control

---@class Slab.ButtonOptions
---@field Tooltip? string
---@field Rounding? number
---@field Invisible? boolean
---@field W? number
---@field H? number
---@field Disable? boolean
---@field Image? table
---@field Color? table
---@field HoverColor? table
---@field PressColor? table
---@field PadX? number
---@field PadY? number
---@field VLines? number

---@param label string
---@param options? Slab.ButtonOptions
---@return boolean
Slab.Button = function(label, options)
end

---@class Slab.RadioButtonOptions
---@field Index? number
---@field SelectedInxex? number
---@field Tooltip? string

---@param label string
---@param options? Slab.RadioButtonOptions
---@return boolean
Slab.RadioButton = function(label, options)
end

---@class Slab.TextOptions
---@field Color? table
---@field Pad? number
---@field IsSelectable? boolean
---@field IsSelectableTextOnly? boolean
---@field IsSelected? boolean
---@field SleectOnHover? boolean
---@field HoverColor? table

---@param label string
---@param options? Slab.TextOptions
---@return boolean
Slab.Text = function(label, options)
end

---@param label string
---@param options Slab.TextOptions
---@return boolean
Slab.TextSelectable = function(label, options)
end

---@class Slab.TextfOptions
---@field Color table
---@field W number
---@field Align "left" | "center" | "right"

---@param label string
---@param options Slab.TextOptions
Slab.Textf = function(label, options)
end

---@param label string
---@return number, number
Slab.GetTextSize = function (label)
end

---@param label string
---@return number
Slab.GetTextWidth = function (label)
end

---@return number
Slab.GetTextHeight = function ()
end
