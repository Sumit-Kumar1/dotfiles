local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

config.ssh_domains = {
	{
		name = "oci_server",
		remote_address = "80.225.197.249",
		username = "opc",
		timeout = 60,
		default_prog = { "zsh" },
		ssh_option = {
			identityfile = "~/.ssh/id_rsa_oci",
		},
	},
}
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Macchiato"
	else
		return "Catppuccin Latte"
	end
end

-- config shell as fish
config.default_prog = { "/usr/local/bin/fish", "-l" }
-- toast notification
wezterm.on("window-config-reloaded", function(window, pane)
	window:toast_notification("wezterm", "configuration reloaded!", nil, 4000)
end)

-- config keys
config.keys = {
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "k", mods = "CMD", action = action.ClearScrollback("ScrollbackAndViewport") },
	{ key = "w", mods = "CMD", action = action.CloseCurrentPane({ confirm = false }) },
	{ key = "w", mods = "CMD|SHIFT", action = action.CloseCurrentTab({ confirm = false }) },
	{ key = "LeftArrow", mods = "CMD", action = action.SendKey({ key = "Home" }) },
	{ key = "RightArrow", mods = "CMD", action = action.SendKey({ key = "End" }) },
	{ key = "p", mods = "CMD|SHIFT", action = action.ActivateCommandPalette },
}

-- window config
config.initial_cols = 100
config.initial_rows = 80
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 20
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = "0.5cell",
}
config.default_cursor_style = "BlinkingBar"
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
-- font config
config.font_size = 15
config.bold_brightens_ansi_colors = true
config.font = wezterm.font({
	family = "0xProto Nerd Font Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.line_height = 1.0

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

return config
