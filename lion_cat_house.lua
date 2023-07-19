-- Bridge Constructor

--1
-- Define Constants
BRIDGE_BASE_START_WIDTH = 10
BRIDGE_MAX_WIDTH = 75
BRIDGE_BASE_LENGTH = 25
BRIDGE_MAX_LENGTH = 100

--2
-- Set Up Variables
bridge_parts = {
	width = BRIDGE_BASE_START_WIDTH,
	length = BRIDGE_BASE_LENGTH
}

--3
-- Define bridgeStart() Function
function bridgeStart()
	-- Initialize the bridge
	bridge_parts.width = BRIDGE_BASE_START_WIDTH
	bridge_parts.length = BRIDGE_BASE_LENGTH
end

--4
-- Define bridgeWiden() Function
function bridgeWiden(increaseAmount)
	-- Increase the bridge width by increaseAmount
	bridge_parts.width = bridge_parts.width + increaseAmount
	-- Make sure it won't go above the maximum width
	if bridge_parts.width > BRIDGE_MAX_WIDTH then
		bridge_parts.width = BRIDGE_MAX_WIDTH
	end
end

--5
-- Define bridgeLengthen() Function
function bridgeLengthen(increaseAmount)
	-- Increase the bridge length by increaseAmount
	bridge_parts.length = bridge_parts.length + increaseAmount
	-- Make sure it won't go above the maximum length
	if bridge_parts.length > BRIDGE_MAX_LENGTH then
		bridge_parts.length = BRIDGE_MAX_LENGTH
	end
end

--6
-- Define bridgeCurrentStatus() Function
function bridgeCurrentStatus()
	-- Print the current bridge status
	print("Bridge Width: " .. bridge_parts.width .. " Bridge Length: " .. bridge_parts.length)
end

--7
-- Define bridgeFinish() Function
function bridgeFinish()
	-- Print that the bridge is finished
	print("Bridge Finished!")
end

--8
-- Define main() Function
function main()
	-- Start building the bridge
	bridgeStart()
	-- Widen the bridge
	bridgeWiden(5)
	-- Lengthen the bridge
	bridgeLengthen(15)
	-- Print the bridge status
	bridgeCurrentStatus()
	-- Finish the bridge
	bridgeFinish()
end

--9
-- Call main() Function
main()