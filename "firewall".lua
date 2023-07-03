--as a way to manage trafic flow, i made this code, so you have 2 modems, m1 and m2, m1 is the inside network by exemple, of your base
--m2 is the modem that talks to the world, so the data packet has 2 parts, the data but then it has the "magic" an string that either says
--"from base" or "to base", this tells the data flow and if the packets dont have this, they cant go thru, wich with some modifications
--could make this a great tool for making massive networks

local component = require("component")
local event = require("event")
local modems = {} --make table slash array
local modems = component.list("modem")--get the modems
local m1 = component.proxy(modems(0))
local m2 = component.proxy(modems(1)) --we give each modem an name
m1.open(1)
m2.open(1)

while true do
local _, receiver, sender, port, _, message,magic = event.pull(1,"modem_message")

print(receiver)
print(receiver == m1)
print(receiver == m2)
print(magic == "to base")
print(magic == "from base")

if magic == "to base" then
m1.broadcast(1,"hi")
end

if magic == "from base" then
print("got poked")
m2.broadcast(1,"hello")
end

end
