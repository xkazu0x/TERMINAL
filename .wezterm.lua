local wezterm = require("wezterm")

local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

wezterm.on("gui-startup", function(cmd)
       local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
-- config.initial_cols = 80

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.font = wezterm.font("Iosevka Fixed")
config.font_size = 18.0

config.front_end = "OpenGL"
config.prefer_egl = true
config.term = "xterm-256color"
config.max_fps = 144

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	font = wezterm.font({ family = "Iosevka", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}

config.keys = {
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
        	key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
}
-- config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "Black Metal (Burzum) (base16)"
config.color_scheme = "Black Metal (Marduk) (base16)"
-- config.color_scheme = "Black Metal (Gorgoroth) (base16)"

return config
