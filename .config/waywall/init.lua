local waywall = require("waywall")
local helpers = require("waywall.helpers")

local primary_col = "#ec6e4e"
local secondary_col = "#E446C4"
local third_col = "#46CE66"

local make_image = function(path, dst)
    local this = nil

    return function(enable)
        if enable and not this then
            this = waywall.image(path, dst)
        elseif this and not enable then
            this:close()
            this = nil
        end
    end
end

local is_process_running = function(name)
    local handle = io.popen("pgrep -af '" .. name .. "' | grep -v pgrep | grep -v lua")
    if not handle then
        return false
    end
    local result = handle:read("*a")
    print(result)
    handle:close()
    return result and result:match("%S") ~= nil
end

local make_mirror = function(options)
    local this = nil

    return function(enable)
        if enable and not this then
            this = waywall.mirror(options)
        elseif this and not enable then
            this:close()
            this = nil
        end
    end
end

local make_res = function(width, height, enable, disable)
    return function()
        local active_width, active_height = waywall.active_res()

        if active_width == width and active_height == height then
            waywall.set_resolution(0, 0)
            disable()
        else
            waywall.set_resolution(width, height)
            enable()
        end
    end
end

-- Mirrors and resolution toggles
local mirrors = {
    eye_measure = make_mirror({
        src = { x = 162, y = 7902, w = 60, h = 580 },
		dst = { x = 30, y = 340, w = 700, h = 400 },
    }),
    e_counter = make_mirror({
        src = { x = 0, y = 29, w = 50, h = 18 },
        dst = { x = 1230, y = 200, w = 343, h = 126 },
        color_key = {
            input = "#dddddd",
            -- output = "#000000ff",
            output = "#dddddd",
        },
    }),
    thin_pie_entities = make_mirror({
        src = { x = 0,  y = 674, w = 340, h = 178 },
        dst = { x = 1200, y = 345, w = 420, h = 423 },
        color_key = {
            input = "#E446C4",
            output = secondary_col,
        },
    }),
    thin_pie_unspec = make_mirror({
        src = { x = 0,  y = 674, w = 340, h = 178 },
        dst = { x = 1200, y = 345, w = 420, h = 423 },
        color_key = {
            input = "#46CE66",
            output = third_col,
        },
    }),
    thin_pie_blockentities = make_mirror({
        src = { x = 0,  y = 674, w = 340, h = 178 },
        dst = { x = 1200, y = 345, w = 420, h = 423 },
        color_key = {
            input = "#ec6e4e",
            output = primary_col,
        },
    }),
    thin_pie_destroyProgress = make_mirror({
        src = { x = 0,  y = 674, w = 340, h = 178 },
        dst = { x = 1200, y = 345, w = 420, h = 423 },
        color_key = {
            input = "#CC6C46",
            output = secondary_col,
        },
    }),
    thin_pie_prepare = make_mirror({
        src = { x = 0,  y = 674, w = 340, h = 178 },
        dst = { x = 1200, y = 345, w = 420, h = 423 },
        color_key = {
            input = "#464C46",
            output = secondary_col,
        },
    }),

    tall_pie_entities = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = 1490, y = 645, w = 420, h = 423 },
		color_key = {
			input = "#E446C4",
			output = secondary_col,
		},
	}),
    tall_pie_unspecified = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = 1490, y = 645, w = 420, h = 423 },
		color_key = {
			input = "#46CE66",
			output = third_col,
		},
	}),
    tall_pie_blockentities = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = 1490, y = 645, w = 420, h = 423 },
		color_key = {
			input = "#ec6e4e",
			output = primary_col,
		},
	}),
	tall_pie_destroyProgress = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = 1490, y = 645, w = 420, h = 423 },
		color_key = {
			input = "#CC6C46",
			output = secondary_col,
		},
	}),
	tall_pie_prepare = make_mirror({
		src = { x = 44, y = 15978, w = 340, h = 178 },
		dst = { x = 1490, y = 645, w = 420, h = 423 },
		color_key = {
			input = "#464C46",
			output = secondary_col,
		},
	}),
}

local images = {
    overlay = make_image(
        "/home/vj/mcsr/nb-overlay.png", -- chemin image pour boat eye (pixels)
        {dst = { x = 30, y = 340, w = 700, h = 400 }}
    )
}

local show_mirrors = function(eye, f3, tall, thin)
    images.overlay(eye)
    mirrors.eye_measure(eye)

    mirrors.e_counter(f3)

    mirrors.thin_pie_entities(thin)
    mirrors.thin_pie_blockentities(thin)
    mirrors.thin_pie_unspec(thin)
    mirrors.thin_pie_destroyProgress(thin)
    mirrors.thin_pie_prepare(thin)

    mirrors.tall_pie_entities(tall)
    mirrors.tall_pie_unspecified(tall)
    mirrors.tall_pie_blockentities(tall)
    mirrors.tall_pie_destroyProgress(tall)
    mirrors.tall_pie_prepare(tall)
end

local thin_enable = function()
    -- waywall.set_sensitivity(0)
    show_mirrors(false, true, false, true)
end

local thin_disable = function()
    show_mirrors(false, false, false, false)
end

local tall_enable = function()
    -- waywall.set_sensitivity(0.25)
    show_mirrors(true, true, true, false)
end

local tall_disable = function()
    -- waywall.set_sensitivity(0)
    show_mirrors(false, false, false, false)
end

local wide_enable = function()
    -- waywall.set_sensitivity(0)
    show_mirrors(false, false, false, false)
end

local wide_disable = function()
    -- nothing
end

local resolutions = {
    thin = make_res(340, 1080, thin_enable, thin_disable),
    tall = make_res(384, 16384, tall_enable, tall_disable),
    wide = make_res(1920, 300, wide_enable, wide_disable),
}

-- switch keymap

-- local active_keymap = "mc_ca"
-- local active_keymap_text = nil

-- local set_keymap = function(layout)
--     waywall.set_keymap({layout = layout})
--     active_keymap = layout

--     if active_keymap_text then
--         active_keymap_text:close()
--         active_keymap_text = nil
--     end

--     if active_keymap ~= "mc_ca" then
--         active_keymap_text = waywall.text(active_keymap, 5, 1280, "#ee4444", 5)
--     end
-- end
 
-- local stats_l1 = nil
-- local stats_l2 = nil
-- local stats_l3 = nil
-- local inspect = require('inspect')
-- local update_stats = function()
--     if stats_l1 then
--         stats_l1:close()
--         stats_l1 = nil
--         stats_l2:close()
--         stats_l2 = nil
--         stats_l3:close()
--         stats_l3 = nil
--     end

--     local state = waywall.state()

--     if state.screen == "wall" then
--         local headers, stream = assert(http.new_from_uri("https://paceman.gg/stats/api/getSessionNethers?name=Grooble_&hours=12&hoursBetween=5"):go())
--         local body = assert(stream:get_body_as_string())
--         if headers:get ":status" == "200" then
--             local data = json.decode(body)
--             stats_l1 = waywall.text(data.count, 22, 428, "#a76969", 6)
--             stats_l2 = waywall.text(data.avg, 22, 518, "#a76969", 6)
--             stats_l3 = waywall.text(data.rnph, 22, 608, "#a76969", 6)
--         end
--     end
-- end

-- waywall.listen("state", update_stats)

-- One Shot

Cross_overlay = nil

local toggle_oneshot = function()
    return function()
        if Cross_overlay == nil then
            Cross_overlay = waywall.text("+", 947, 515, "#ff0000ff", 3)
        else
            Cross_overlay:close()
            Cross_overlay = nil
        end
    end
end

local config = {
    input = {
        remaps = { --remap
            -- ["TAB"] = "F3",
            -- ["0"] = "UP",
            -- ["1"] = "LEFT",
            -- ["2"] = "DOWN",
            -- ["3"] = "RIGHT",
            -- ["LEFT"] = "1",
            -- ["DOWN"] = "2",
            -- ["RIGHT"] = "3",
            -- ["UP"] = "0",
            -- ["GRAVE"] = "TAB",
            -- ["F1"] = "F2",
            -- ["capslock"] = "BACKSPACE",
            -- ["MB4"] = "HOME",
            -- ["MB5"] = "COMMA",
        },

        layout = "us",
        model = "",
        rules = "",
        variant = "",
        options = "caps:none",
        repeat_rate = 70,
        repeat_delay = 170,
        -- sensitivity = 0.15,
        confine = false,
    },
    theme = {
        -- background = "#00000000", --color si pas image
        -- background_png = "....", --background du wall (path)
        ninb_opacity = 1.0, --nin bot opacité
        -- ninb_anchor = "topright",
        ninb_anchor = "separate",
        cursor_icon = "", -- "d9ce0ab605698f320427677b458ad60b",
        cursor_theme = ""
    },
    actions = {
        -- show/hide ninb
        ["*-9"] = function()
            if is_process_running("/mcsr/nin") then
                os.execute("pkill -f /mcsr/nin")
                print("killing nin")
            else
                waywall.show_floating(true)
                waywall.exec("/usr/lib/jvm/openjdk17/bin/java -Dawt.useSystemAAFontSettings=on -jar /home/vj/mcsr/nin")
                waywall.show_floating(true)
                print("living nin")
            end
            return false
        end,
        ["*-F7"] = resolutions.tall,
        ["*-F6"] = resolutions.wide,
        ["*-F2"] = resolutions.thin,
        -- ["*-H"] = function ()
        --     waywall.toggle_fullscreen()
        -- end,
        ["*-8"] = toggle_oneshot(),
    },
    experimental = {
        debug = false,
        tearing = true,
    },
}

return config
