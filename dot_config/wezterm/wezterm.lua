local wezterm = require 'wezterm'
local action = wezterm.action
local config = wezterm.config_builder()
local on_mac = wezterm.target_triple == 'x86_64-apple-darwin'

-- Todo: remove this eventually
config.enable_wayland = false

-- support for undercurl, etc..
config.term = 'wezterm'

-- setting env variables for homebrew
config.set_environment_variables = {
    PATH = '/opt/homebrew/bin:' .. os.getenv 'PATH',
}
-- custom ssh domain with their config
config.ssh_domains = {
    {
        name = 'oci_server',
        remote_address = '80.225.197.249',
        username = 'opc',
        timeout = 60,
        default_prog = { 'zsh' },
        ssh_option = {
            identityfile = '~/.ssh/id_rsa_oci',
        },
    },
}
-- config shell as fish
config.default_prog = { '/usr/local/bin/fish', '-l' }

-- color theme.
local colors = {
    bg = '#0E1419',
    black = '#000000',
    dark_lilac = '#6D5978',
    lilac = '#BAA0E8',
}

config.color_scheme = 'Dracula (Official)'
config.colors = {
    background = colors.bg,
    tab_bar = {
        inactive_tab_edge = colors.black,
        active_tab = {
            bg_color = colors.lilac,
            fg_color = colors.black,
        },
        inactive_tab = {
            bg_color = colors.black,
            fg_color = colors.dark_lilac,
        },
        inactive_tab_hover = {
            bg_color = colors.black,
            fg_color = colors.lilac,
        },
        new_tab = {
            bg_color = colors.bg,
            fg_color = colors.lilac,
        },
        new_tab_hover = {
            bg_color = colors.lilac,
            fg_color = colors.black,
        },
    },
}
-- opacity
config.window_background_opacity = 0.3
config.macos_window_background_blur = 20

-- Inactive panes.
config.inactive_pane_hsb = {
    saturation = 0.6,
    brightness = 0.6,
}

-- Remove extra space.
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Native macOS fullscreen.
config.native_macos_fullscreen_mode = true

-- Cursor.
config.cursor_thickness = 1

-- Tab bar.
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
    font = wezterm.font('Hasklug Nerd Font Mono', { weight = 'DemiBold' }),
    font_size = on_mac and 14 or 18,
    active_titlebar_bg = colors.bg,
    inactive_titlebar_bg = colors.bg,
}

-- Fonts.
config.font_size = on_mac and 15 or 18
config.cell_width = 0.85
config.line_height = on_mac and 1.25 or 1.3
config.font = wezterm.font('Hasklug Nerd Font Mono', { weight = 'Medium' })
config.font_rules = {
    {
        intensity = 'Bold',
        font = wezterm.font('Hasklug Nerd Font Mono', { weight = 'DemiBold' }),
    },
    {
        intensity = 'Bold',
        italic = true,
        font = wezterm.font('Hasklug Nerd Font Mono', { weight = 'DemiBold', style = 'Italic' }),
    },
    {
        italic = true,
        font = wezterm.font('0xProto Nerd Font Mono', { style = 'Italic' }),
    },
}

-- Make underlines THICK.
config.underline_position = -6
config.underline_thickness = '250%'

-- automatic update notifications.
config.check_for_updates = true

-- Keybindings.
local function pane_navigation_action(direction, fallback_direction)
    return wezterm.action_callback(function(win, pane)
        local num_panes = #win:active_tab():panes()
        local pane_direction = num_panes == 2 and fallback_direction or direction
        win:perform_action({ ActivatePaneDirection = pane_direction }, pane)
    end)
end

config.disable_default_key_bindings = true
local mods = 'ALT|SHIFT'
local mod_key = ''
if on_mac then
    mod_key = 'CMD'
else
    mod_key = 'ALT'
end

config.keys = {
    { mods = mods, key = 'x', action = action.ActivateCopyMode },
    { mods = mods, key = 'd', action = action.ShowDebugOverlay },
    { mods = mods, key = 'v', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { mods = mods, key = 's', action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { mods = mods, key = 'h', action = pane_navigation_action('Left', 'Prev') },
    { mods = mods, key = 'l', action = pane_navigation_action('Right', 'Next') },
    { mods = mods, key = 'k', action = pane_navigation_action('Up', 'Prev') },
    { mods = mods, key = 'j', action = pane_navigation_action('Down', 'Next') },
    { mods = mod_key, key = 't', action = action.SpawnTab 'CurrentPaneDomain' },
    { mods = mods, key = 'q', action = action.CloseCurrentPane { confirm = true } },
    { mods = mods, key = 'y', action = action.CopyTo 'Clipboard' },
    { mods = mods, key = 'p', action = action.PasteFrom 'Clipboard' },
    { mods = mod_key, key = '-', action = action.DecreaseFontSize },
    { mods = mod_key, key = '=', action = action.IncreaseFontSize },
    { mods = mod_key, key = '0', action = action.ResetFontSize },
    { mods = mod_key, key = '1', action = action.ActivateTab(0) },
    { mods = mod_key, key = '2', action = action.ActivateTab(1) },
    { mods = mod_key, key = '3', action = action.ActivateTab(2) },
    { mods = mod_key, key = '4', action = action.ActivateTab(3) },
    { mods = mod_key, key = '5', action = action.ActivateTab(4) },
    { mods = mod_key, key = '6', action = action.ActivateTab(5) },
    { mods = mod_key, key = '7', action = action.ActivateTab(6) },
    { mods = mod_key, key = '8', action = action.ActivateTab(7) },
    { mods = mod_key, key = '9', action = action.ActivateTab(8) },
}
-- I just need to toggle fullscreen on Mac. On Linux I use the window manager.
if on_mac then
    table.insert(config.keys, { mods = mods, key = 'Enter', action = action.ToggleFullScreen })
end

wezterm.on('format-tab-title', function(tab)
    -- Get the process name.
    local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

    -- Current working directory.
    local cwd = tab.active_pane.current_working_dir
    cwd = cwd and string.format('%s ', cwd.file_path:gsub(os.getenv 'HOME', '~')) or ''

    -- Format and return the title.
    return string.format('(%d %s) %s', tab.tab_index + 1, process, cwd)
end)

return config
