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

local Clock = Roact.Component:extend("Clock3")

function Clock:init()
    self:setState({
        currentTime = 0
    })
end

function Clock:render()
    local currentTime = self.state.currentTime

    return Roact.createElement("ScreenGui", {}, {

        DisplayText = Roact.createElement("TextLabel", {
            Size = UDim2.fromScale(0.5, 0.2),
            Position = UDim2.fromScale(0.5, 0.1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = "Current Time: "..tostring(currentTime)            
        })

    })
end

function Clock:didMount()
    self.running = true
    
    task.spawn(function()
        while self.running do
            
            self:setState(function(state)
                return {currentTime = state.currentTime + 1}
            end)

            task.wait(1)
        end
    end)
end

function Clock:willUnmount()
    self.running = false
end

local handle = Roact.mount(Roact.createElement(Clock), playerGui, "Clock UI")

task.wait(10)

Roact.unmount(handle)    