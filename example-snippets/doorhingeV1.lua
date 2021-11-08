local module = {}
module.__index = module
-- Typecheck --
type keytable = {
	[any]: any?
}
type array = { 
	[number]: any?
}
--
--[[
CONTENT 
]]--
-- Door Constructor --
function module.new(doorModel: Model, DoorFrame: BasePart, Door: BasePart)
	local DoorOpened = Instance.new("BindableEvent")
	local DoorDestroyedEvent = Instance.new("BindableEvent")
	local self = setmetatable({
		cache = {
			DoorHinge = DoorFrame,
			DoorModel = doorModel,
			Door = Door
		},
		Opened = DoorOpened.Event,
		Destroyed = DoorDestroyedEvent.Event
	}, module)
	-- General Events --
	workspace.DescendantRemoving:Connect(function(descendant)
		if descendant == self.door then
			DoorDestroyedEvent:Fire()
		end
	end)
	--
	return self
end
--[[
Client Methods
]]--
function module:SetClientDoorOpen()
	assert(getfenv(2).script.ClassName == "LocalScript", "Error: Attempt to SetClientDoorOpen of class Script")
	print(self.door)
end
return module
