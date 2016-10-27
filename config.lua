application = {
	content = {
        orientation = 
        {
            default = "landscapeRight",
            supported = { "landscapeRight", "landscapeLeft" }
        }
		width = 800,
		height = 600, 
		scale = "letterBox",
		fps = 30,
		
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
		--]]
	},


    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}

