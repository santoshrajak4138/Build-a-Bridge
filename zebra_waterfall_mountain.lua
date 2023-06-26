--BUILD A BRIDGE  --
 
--Load necessary libraries
local bridge = require "bridge"
local physics = require "physics"
 
--Initialize bridge size and dimensions
local xSize = 10
local ySize = 15
local width = 2
local length = 6
 
--Create a bridge object
local myBridge = bridge.new(xSize, ySize, width, length)
 
--Set bridge physical properties
physics.setMass(myBridge, 10)
physics.setFriction(myBridge, 0.5)
physics.setDensity(myBridge, 0.3)
 
--Set bridge visual properties
myBridge:setColor(0.3, 0.5, 0.2)
myBridge:setTexture("stone.png")
 
--Add bridge to physics engine
physics.addBody(myBridge)
 
--Set bridge position and rotation
mybridge:setPosition(10, 10)
myBridge:setRotation(math.pi/2)
 
--Render bridge
myBridge:render()
 
--*****************************
 
--Build the Bridge--
 
--Set the bridge properties
myBridge:setType("static")
 
--Create the bridge segments
local segments = myBridge:build(xSize, ySize, width, length)
 
--Add the segments to the physics engine
for i = 1, #segments do
	physics.addBody(segments[i])
end
 
--Set the bridge position and rotation
myBridge:setPosition(100, 200)
myBridge:setRotation(math.pi/4)
 
--Render the bridge
myBridge:render()