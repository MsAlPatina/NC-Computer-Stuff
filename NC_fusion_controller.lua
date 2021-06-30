-- this is the most basic code ever made, it can even run on a goddamn potato!

local component = require("component")
local computer = require("computer")
local reactor = component.nc_fusion_reactor
local term = require("term")


while true do 
print("Energy stored in RF: "..reactor.getEnergyStored())
print("Temperature in K: "..reactor.getTemperature())
print("Efficiency in %: "..reactor.getEfficiency())
print("Code version: 1.0")
if reactor.getEfficiency() > 99.8 then

reactor.deactivate()

else

reactor.activate()
end

os.sleep(0.5)
term.clear()


os.sleep(0.1)
end
