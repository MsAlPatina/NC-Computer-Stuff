-- this is the most basic code ever made, it can even run on a goddamn potato!

local component = require("component")
local computer = require("computer")
local reactor = component.nc_fusion_reactor
local term = require("term")

if reactor == nil then

return "reactor is not present"

end

while true do 
print("rf stored: "..reactor.getEnergyStored())
print("temp: "..reactor.getTemperature())
print("efficiency: "..reactor.getEfficiency())
if reactor.getEfficiency() > 99.8 then

reactor.deactivate()

else

reactor.activate()
end

os.sleep(0.5)
term.clear()


os.sleep(0.1)
end
