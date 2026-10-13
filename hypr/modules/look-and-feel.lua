hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgb(180, 190, 254)", "rgb(137, 180, 250)"}, angle = 45 },
            inactive_border = "rgb(17, 17, 27)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 3,
        rounding_power = 4,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 10,
            passes    = 0,
            new_optimizations = true,
            vibrancy  = 0.1696,
        },

        glow = {
            enabled = false,
            range = 5,
            color = "rgb(116, 199, 236)",
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 100.2633, dampening = 15 })

hl.animation({ leaf = "global",        enabled = true,  speed = 1,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 1.39, bezier = "quick" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier= "easeOutExpo" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 5.1,  bezier = "easeOutExpo" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "easeOutExpo",       style = "popin 70%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutExpo" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  spring = "easy" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "quick" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "quick" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "quick" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
