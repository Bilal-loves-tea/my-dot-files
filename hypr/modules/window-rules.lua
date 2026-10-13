-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)
-- Apply entrance/exit animations
hl.layer_rule({
  match = { namespace = "swaync-control-center" },
  animation = "slide right" -- Options: "slide right", "slide left", "popin", "fade", etc.
})

hl.layer_rule({
  match = { namespace = "swaync-notification-window" },
  animation = "slide right"
})

-- Optional: Add background blur behind the control center
hl.layer_rule({
  match = { namespace = "swaync-control-center" },
  blur = true,
  ignore_alpha = 0.5
})


-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "Center waypaper",
    match = { class = "waypaper" },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Center volume control",
    match = { class = "org.pulseaudio.pavucontrol" },

    float = true,
    center = true;
})

hl.window_rule({
    name = "Center CachyOs Hello",
    match = { class = "org.cachyos.hello" },

    float = true,
    center = true,
})

hl.window_rule({
    match = { title = "Sign in - Google Accounts - Helium" },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Center blueman",
    match = { class = "blueman-manager" },

    center = true,
    float = true,
    size = {1000, 600},
})

hl.window_rule({
    name = "Center satty",
    match = { class = "com.gabm.satty" },

    center = true,
    float = true,
    size = {1000, 600},
})

hl.window_rule({
    match = { float = true },
    size = {1000, 600},
    center = true,
})

hl.window_rule({
    match = { class = "airpods-tui-float" },

    float = true,
    center = true,
    size = {800, 600},
})

