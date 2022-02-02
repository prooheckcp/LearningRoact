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
local currentTime : number = 0

local function clock(currentTime)
    return Roact.createElement("ScreenGui", {}, {
        TimeLabel = Roact.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            Text = "Time Elapsed: " .. currentTime,
            TextScaled = true,
            BackgroundTransparency = 1
        })
    })
end
--[[
local handle = Roact.mount(clock(currentTime), playerGui, "Clock UI")

while task.wait(1) do
    currentTime = currentTime + 1
    handle = Roact.update(handle, clock(currentTime))
end    
]]
