--local values = {
--    "a", "b", "c", "d" 
--}
--
--local script = [[(script continuous multiplayer_lift_{value}_control
--    (sleep_until (= (device_get_position lift_{value}_control_a) 1) 1)
--    (device_set_position_immediate lift_{value}_control_b 0)
--    (device_set_position lift_{value} 1)
--    (sleep_until (= (device_get_position lift_{value}_control_b) 1) 1)
--    (device_set_position_immediate lift_{value}_control_a 0)
--    (device_set_position lift_{value} 0)
--)]]
--
--for k,v in pairs (values) do
--    local result = script:gsub("{value}",v)
--    print(result)
--end

local script = [[(object_teleport (player1 )player1_pause_base )]]

for i = 2,15 do
    local result = script:gsub("player1 ", "player" .. i  .. " ")
    print(result)
end