--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--Root folders
local vendor = ReplicatedStorage.Vendor

--Dependencies
local Roact = require(vendor.Roact)

--Variables
local player : Player = Players.LocalPlayer
local playerGui : PlayerGui = player.PlayerGui

local function clockText(props)
    return Roact.createElement("TextLabel",{
        Size = UDim2.fromScale(0.5, 0.2),
        Position = UDim2.fromScale(0.5, 0.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = "Current Time: "..tostring(props.text)
    })
end

local function clock(props)
    return Roact.createElement("ScreenGui", {}, {
        TextContainer = clockText(props)
    })
end

local clockElement = Roact.createElement(clock, {text = 1})

--[[
local handle = Roact.mount(clockElement, playerGui, "Some Clock Gui")

local counter = 0
while task.wait(1) do
    counter += 1
    Roact.update(handle, Roact.createElement(clock, {text = counter}))
end    
]]
