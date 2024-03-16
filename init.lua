ctf_settings.register("improvedcamera", {
    type = "bool",
    label = "Improved 3rd-person camera",
    description = "Move the 3rd-person camera so you can see where you are aiming",
    default = "false",
    on_change = function(player, new_value)
        if new_value == "true" then
	    player:set_eye_offset({x=0,y=0,z=0}, {x=8,y=4,z=-1})
        else
            player:set_eye_offset({x=0,y=0,z=0}, {x=0,y=0,z=0})
        end
    end
})

minetest.register_on_joinplayer(function(player)
	camera = ctf_settings.get(player, "improvedcamera")
	if camera == "true" then
	    minetest.chat_send_all("join camera is true")
	    player:set_eye_offset({x=0,y=0,z=0}, {x=8,y=4,z=-1})
	end
end)