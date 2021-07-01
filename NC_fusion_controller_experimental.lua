--EXPERIMENTAL VERSION OF THE FUSION CONTROLLER
--BUGS WILL HAPPEN AS ITS UNSTABLE!
-- this is the most basic code ever made, it can even run on a goddamn potato!
--update: trying to fix the issue were the reactor stays too long turned off

local component = require("component")
local computer = require("computer")
local reactor = component.nc_fusion_reactor
local term = require("term")
local gpu = component.gpu
local w, h = gpu.getResolution()


while true do 
  
gpu.setForeground(0x000000)
gpu.setBackground(0x000000)
print("Energy stored in RF: "..reactor.getEnergyStored())
print("Temperature in K: "..reactor.getTemperature())
print("Efficiency in %: "..reactor.getEfficiency())
print("Code version: TEST")
 
 gpu.setForeground(0xFFFFFF)
  
 gpu.set(1,6,"Efficiency:")
 gpu.fill(1,7,reactor.getEfficiency()/2,1, "")
 gpu.set(1,8,"0%")
 gpu.set(1,58,"100")
  
  
if reactor.getEfficiency() > 99.99000 then

reactor.deactivate()

else

reactor.activate()
end

os.sleep(0.2)
term.clear()


os.sleep(0.1)
end
