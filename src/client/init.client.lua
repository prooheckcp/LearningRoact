--[[
    This file is being used to learn Roact
]]

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--Root folders
local vendor = ReplicatedStorage.Vendor

--Variables
local player : Player = Players.LocalPlayer
local playerGui : PlayerGui = player.PlayerGui

--Dependencies
local Roact = require(vendor.Roact)

local app = Roact.createElement("ScreenGui", {}, {
    HelloWorld = Roact.createElement("TextLabel", {
        Size = UDim2.fromScale(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        TextScaled = true,
        Text = "Hello World"
    })
})

Roact.mount(app, playerGui)