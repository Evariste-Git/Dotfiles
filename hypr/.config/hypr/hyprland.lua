
----------------
-- CATPPUCCIN MOCHA THEME
----------------

local palette = {
    rosewater = "f5e0dc",
    flamingo  = "f2cdcd",
    pink      = "f5c2e7",
    mauve     = "cba6f7",
    red       = "f38ba8",
    maroon    = "eba0ac",
    peach     = "fab387",
    yellow    = "f9e2af",
    green     = "a6e3a1",
    teal      = "94e2d5",
    sky       = "89dceb",
    sapphire  = "74c7ec",
    blue      = "89b4fa",
    lavender  = "b4befe",

    text      = "cdd6f4",
    subtext1  = "bac2de",
    subtext0  = "a6adc8",

    overlay2  = "9399b2",
    overlay1  = "7f849c",
    overlay0  = "6c7086",

    surface2  = "585b70",
    surface1  = "45475a",
    surface0  = "313244",

    base      = "1e1e2e",
    mantle    = "181825",
    crust     = "11111b",
}

-- Hyprland color helpers
local theme = {}

for name, hex in pairs(palette) do
    theme[name] = "rgb(" .. hex .. ")"
    theme[name .. "Alpha"] = hex
end

-- Optional alpha helper: 0 = transparent, 255 = opaque
local function rgba(name, alpha)
    return "rgba(" .. palette[name] ..
        string.format("%02x", alpha or 255) .. ")"
end


-- Hyprland Lua configuration
-- Official native Lua API (Hyprland 0.55+)

----------------
-- MONITORS
----------------

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1,
})

----------------
-- PROGRAMS
----------------

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "rofi -show drun"

----------------
-- AUTOSTART
----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("clipse -listen")
end)

----------------
-- ENVIRONMENT
----------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

----------------
-- GENERAL / DECORATION
----------------

hl.config({
    general = {
        border_size = 2,
        gaps_in = 2,
        gaps_out = 6,

        col = {
            active_border = theme.overlay2,
            inactive_border = theme.overlay0,
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 5,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
    },

    input = {
        kb_layout = "de",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

----------------
-- ANIMATION CURVES
----------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {{0.23, 1}, {0.32, 1}},
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {{0.65, 0.05}, {0.36, 1}},
})

hl.curve("linear", {
    type = "bezier",
    points = {{0, 0}, {1, 1}},
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {{0.5, 0.5}, {0.75, 1}},
})

hl.curve("quick", {
    type = "bezier",
    points = {{0.15, 0}, {0.1, 1}},
})

----------------
-- ANIMATIONS
----------------

local animations = {
    {"global", 10, "default"},
    {"border", 5.39, "easeOutQuint"},
    {"windows", 4.79, "easeOutQuint"},
    {"windowsIn", 4.1, "easeOutQuint", "popin 87%"},
    {"windowsOut", 1.49, "linear", "popin 87%"},
    {"fadeIn", 1.73, "almostLinear"},
    {"fadeOut", 1.46, "almostLinear"},
    {"fade", 3.03, "quick"},
    {"layers", 3.81, "easeOutQuint"},
    {"layersIn", 4, "easeOutQuint", "fade"},
    {"layersOut", 1.5, "linear", "fade"},
    {"fadeLayersIn", 1.79, "almostLinear"},
    {"fadeLayersOut", 1.39, "almostLinear"},
    {"workspaces", 1.94, "almostLinear", "fade"},
    {"workspacesIn", 1.21, "almostLinear", "fade"},
    {"workspacesOut", 1.94, "almostLinear", "fade"},
}

for _, a in ipairs(animations) do
    hl.animation({
        leaf = a[1],
        enabled = true,
        speed = a[2],
        bezier = a[3],
        style = a[4],
    })
end

----------------
-- INPUT DEVICES
----------------

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

----------------
-- KEYBINDINGS
----------------

local mod = "SUPER"

local function bind(key, dispatcher)
    hl.bind(mod .. " + " .. key, dispatcher)
end

local function exec(key, command)
    bind(key, hl.dsp.exec_cmd(command))
end

-- Applications
exec("Q", terminal)
bind("C", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exec_cmd(
    "hyprctl dispatch exit"
))
exec("E", fileManager)
bind("V", hl.dsp.window.float({action = "toggle"}))
exec("R", menu)
bind("P", hl.dsp.window.pseudo())

-- Clipboard manager
exec("V", "kitty clipse")

-- Focus
bind("H", hl.dsp.focus({direction = "left"}))
bind("J", hl.dsp.focus({direction = "down"}))
bind("K", hl.dsp.focus({direction = "up"}))
bind("L", hl.dsp.focus({direction = "right"}))

-- Workspaces
for i = 1, 10 do
    local key = tostring(i % 10)

    bind(key, hl.dsp.focus({workspace = i}))
    bind("SHIFT + " .. key,
        hl.dsp.window.move({workspace = i}))
end

-- Special workspace
bind("S", hl.dsp.workspace.toggle_special("magic"))
bind("SHIFT + S",
    hl.dsp.window.move({workspace = "special:magic"}))

-- Scroll workspaces
hl.bind(mod .. " + mouse_down",
    hl.dsp.focus({workspace = "e+1"}))
hl.bind(mod .. " + mouse_up",
    hl.dsp.focus({workspace = "e-1"}))

-- Move / resize with mouse
hl.bind(mod .. " + mouse:272",
    hl.dsp.window.drag(), {mouse = true})
hl.bind(mod .. " + mouse:273",
    hl.dsp.window.resize(), {mouse = true})

-- Volume and microphone
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    {locked = true, repeating = true})

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    {locked = true, repeating = true})

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    {locked = true})

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    {locked = true})

-- Brightness
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl s 5%+"),
    {locked = true, repeating = true})

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl s 5%-"),
    {locked = true, repeating = true})

-- Media keys
hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"), {locked = true})

-- Waybar reload
exec("SHIFT + B", "~/.config/waybar/scripts/launch.sh")

-- Lock screen
exec("N", "hyprlock")

----------------
-- WINDOW RULES
----------------

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
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
    match = {
        class = "hyprland-run",
    },
    move = "20 monitor_h-120",
    float = true,
})
