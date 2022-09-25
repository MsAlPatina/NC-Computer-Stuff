local t = require "term"
local c = require "component"
local event = require "event"
local rla = c.reactor_logic_adapter

local lastEfficiency = 0
local curEfficiency = 0
local adjustment = 1

print("Hold CTRL+C to exit...")
os.sleep(3)

while not event.pull(0.1,"interrupted") do
  curEfficiency = rla.getEfficiency()
  if curEfficiency > 0 then
	if lastEfficiency > curEfficiency then
	  rla.adjustReactivity(adjustment)
	end
	
	if  rla.getErrorLevel() > 0 then
	
	rla.adjustReactivity(-adjustment)
	
	end
	
	
	
	
	
	
	
	rla.adjustReactivity(adjustment)
	t.clear()
	print("Efficiency = " .. curEfficiency .. "\n" .. "Adjustment: " ..adjustment)
	lastEfficiency = curEfficiency
	os.sleep(5.5)
  end
end
