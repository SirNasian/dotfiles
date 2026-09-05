hl.monitor({ output = "",     mode = "preferred",        position = "auto", scale = "auto" })
hl.monitor({ output = "DP-2", mode = "1920x1080@180.00", position = "auto", scale = "auto" })

hl.env("XCURSOR_SIZE",     "24")
hl.env("XCURSOR_THEME",    "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE",  "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
hl.device({ name = "dualsense-wireless-controller-touchpad", enabled = false })
hl.device({ name = "sony-interactive-entertainment-dualsense-wireless-controller-touchpad", enabled = false })

local mod = "ALT"

hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + SHIFT + C",      hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q",      hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mod .. " + SHIFT + SPACE",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + P",      hl.dsp.exec_cmd("kitty $HOME/.dotfiles/scripts/hypr-pass.sh /tmp/hypr-pass && sh /tmp/hypr-pass && rm /tmp/hypr-pass*"))
hl.bind(mod .. " + SHIFT + S",      hl.dsp.exec_cmd("caelestia shell picker openFreeze"))
hl.bind(mod .. " + ESCAPE",         hl.dsp.exec_cmd("caelestia shell lock lock"))
hl.bind(mod .. " + P",              hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
hl.bind(mod .. " + F",              hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mod .. " + h",     hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + l",     hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + k",     hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j",     hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/hypr-toggle-float-focus.sh"))

hl.bind(mod .. " + 1",   hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + 2",   hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + 3",   hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + 4",   hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + 5",   hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + 6",   hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + 7",   hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + 8",   hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + 9",   hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + 0",   hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + TAB", hl.dsp.focus({ workspace = "previous" }))

hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "special:magic", follow = false }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "kitty-float",
    match = { class = "kitty" },
    float = true,
})

hl.config({
    xwayland = { force_zero_scaling = true },
    general = {
        gaps_in = 4,
        gaps_out = 12,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 8,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
    master = { new_status = "master" },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "altwin:swap_alt_super",
        kb_rules = "",
        follow_mouse = 1,
        accel_profile = "custom 32 32",
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("caelestia shell -d")
end)
