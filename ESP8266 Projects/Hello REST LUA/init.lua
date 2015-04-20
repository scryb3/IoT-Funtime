print("hi")

print('init.lua ver 1.2')
wifi.setmode(wifi.STATION)
wifi.sta.disconnect()
print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())
-- wifi config start
wifi.sta.config("SSID","Password")
-- wifi config end
print(wifi.sta.getip())
tmr.alarm(5, 1000, 1, function()
   ip = wifi.sta.getip()
   print(ip)
   if ip=="0.0.0.0" or ip==nil then
      print("connecting to AP...") 
   else
      tmr.stop(5)
      print(wifi.sta.getip())
     -- dofile("server.lua")
   end
end)

NextFile="server.lua"
 l = file.list();
    for k,v in pairs(l) do
    --  print("name:"..k..", size:"..v)
         if k == NextFile then
         print("Wait 5 seconds please")
         tmr.alarm(0, 5000, 0, function() dofile(NextFile) end)
         print("Started file ".. NextFile)
         else
       --  do nothing
         end
    end
print("End of startup") 