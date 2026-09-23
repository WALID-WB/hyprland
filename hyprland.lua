--------------------------------------------------------------------------------
-- Hyprland Lua configuration — ملف إعدادات موحد
-- تم تجميع جميع الملفات المقسمة (modules/*) هنا دون أي تغيير في الإعدادات.
-- الترتيب يطابق تسلسل التحميل الأصلي:
-- vars → monitors → environment → permissions → appearance → animations →
-- layout → input → windows → workspaces → keybinds → startup
--------------------------------------------------------------------------------

---@diagnostic disable: undefined-global

--------------------------------------------------------------------------------
-- المتغيرات المشتركة (vars)
-- تُستخدم لاحقًا في قسم اختصارات لوحة المفاتيح
--------------------------------------------------------------------------------

local vars = {
    main_mod = "SUPER",
    terminal = "kitty",
    file_manager = "dolphin",
    menu = "rofi -show run",
    special_workspace = "magic",
}

local m = vars.main_mod

--------------------------------------------------------------------------------
-- الشاشات (monitors)
--------------------------------------------------------------------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

--------------------------------------------------------------------------------
-- متغيرات البيئة (environment)
--------------------------------------------------------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--------------------------------------------------------------------------------
-- الصلاحيات (permissions)
-- تغيير الصلاحيات يتطلب إعادة تشغيل Hyprland بالكامل.
-- أبقِ هذا القسم معطّلًا إلا إذا كنت تعرف تمامًا ما تحتاجه.
--------------------------------------------------------------------------------

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

--------------------------------------------------------------------------------
-- المظهر العام (appearance)
--------------------------------------------------------------------------------

-- Rounded corners for fullscreen windows: 45° instead of sharp edges.
-- (rounding = 0 means fully sharp corners in Hyprland, so we use a small value.)
hl.window_rule({
    name = "fullscreen-rounded-45",
    match = {
        fullscreen = true,
    },
    rounding    = 1,
    rounding_power = 4.0,
})

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(33ccffee)",
                    "rgba(00ff99ee)",
                },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },

        -- Resize windows by dragging borders/gaps.
        resize_on_border = false,

        -- Tearing can improve latency in some games, but can also cause artifacts.
        -- Keep false for stability.
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    misc = {
        -- -1 keeps default Hyprland behavior.
        -- Set to 0 or 1 only if you want to force/disable the default wallpaper.
        force_default_wallpaper = -1,

        -- Keep the Hyprland logo/background unless you replace it properly.
        disable_hyprland_logo = false,
    },
})

--------------------------------------------------------------------------------
-- الحركات (animations)
--------------------------------------------------------------------------------

hl.config({
    animations = {
        enabled = true,
    },
})

-- Curves.
hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        { 0.23, 1 },
        { 0.32, 1 },
    },
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        { 0.65, 0.05 },
        { 0.36, 1 },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        { 0, 0 },
        { 1, 1 },
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        { 0.5, 0.5 },
        { 0.75, 1 },
    },
})

hl.curve("quick", {
    type = "bezier",
    points = {
        { 0.15, 0 },
        { 0.1, 1 },
    },
})

-- Spring curve — snappier yet smooth (no overshoot), tuned for Intel HD 620.
hl.curve("easy", {
    type = "spring",
    mass = 1,
    stiffness = 350,
    dampening = 32,
})

-- Professional ease-out curve with a gentle start and quick settle.
hl.curve("smoothOut", {
    type = "bezier",
    points = {
        { 0.26, 0.04 },
        { 0.18, 1 },
    },
})

-- Animation leaves.
-- Values are kept moderate for Intel HD 620.

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    spring = "easy",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5.5,
    spring = "easy",
    style = "popin 92%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "smoothOut",
    style = "popin 92%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 2,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.8,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.5,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 3.5,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 2,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 2,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.8,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 2.5,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 2.5,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 5,
    bezier = "quick",
})

--------------------------------------------------------------------------------
-- التخطيط (layout)
--------------------------------------------------------------------------------

-- Dwindle layout.
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- Master layout.
hl.config({
    master = {
        new_status = "master",
    },
})

-- Scrolling layout.
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

--------------------------------------------------------------------------------
-- الإدخال (input)
--------------------------------------------------------------------------------

hl.config({
    input = {
        kb_layout  = "fr,ma",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:win_space_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity = 0.3,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- Three-finger horizontal swipe changes workspace.
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

--------------------------------------------------------------------------------
-- قواعد النوافذ (windows)
--------------------------------------------------------------------------------

-- Ignore maximize requests from applications.
-- This is usually useful on tiling compositors.
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
    name = "fix-xwayland-drags",
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

-- Move Hyprland-run helper window near the bottom of the monitor.
hl.window_rule({
    name = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move  = "20 monitor_h-120",
    float = true,
})

-- When two (or more) windows are on screen:
-- the MAIN window (the focused/active one in dwindle split) gets a 25%
-- transparency reduction (opacity 0.75). Other windows stay fully opaque.
-- NOTE: opacity is animated via the windowsIn/windowsOut curves below,
-- so the change fades smoothly instead of snapping.
hl.window_rule({
    name = "main-window-opacity-75",
    match = {
        activated   = true,
        floating    = false,
        fullscreen  = false,
    },
    opacity = 0.75,
})

--------------------------------------------------------------------------------
-- قواعد مساحات العمل (workspaces)
-- فك التعليق فقط إذا أردت فجوات ذكية / بدون فجوات في مساحات عمل معينة.
--------------------------------------------------------------------------------
hl.workspace_rule({
     workspace = "w[tv1]",
     gaps_out  = 10,
     gaps_in   = 0,
})

hl.workspace_rule({
     workspace = "f[1]",
     gaps_out  = 15, 
     gaps_in   = 15,
})

hl.window_rule({
     name = "no-gaps-wtv1",
     match = {
         float     = false,
         workspace = "w[tv1]",
     },
     border_size = 0,
     rounding    = 0,
})

hl.window_rule({
     name = "no-gaps-f1",
     match = {
         float     = false,
         workspace = "f[1]",
     },
     border_size = 20,
     rounding    = 20,
})
--------------------------------------------------------------------------------
-- اختصارات لوحة المفاتيح (keybinds)
--------------------------------------------------------------------------------

-- Terminal.
hl.bind(m .. "+Q", hl.dsp.exec_cmd(vars.terminal))

-- Close focused window.
hl.bind(m .. "+C", hl.dsp.window.close())

-- Old power/shutdown binding from the example config.
-- It was malformed and potentially unsafe, so it is kept commented.
-- hl.bind(m .. "+M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Safer logout binding.
-- This exits Hyprland. It does not shut down the computer.
hl.bind(m .. "+SHIFT+Q", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- File manager.
hl.bind(m .. "+E", hl.dsp.exec_cmd(vars.file_manager))

-- اختصار فتح مدير الحافظة (يوضع خارج دالة hl.on)
hl.bind(m .. "+V", hl.dsp.exec_cmd("~/.local/bin/clipboard-manager"))

-- Toggle floating.
hl.bind(m .. "+O", hl.dsp.window.float({ action = "toggle" }))

-- App menu / runner.
hl.bind(m .. "+R", hl.dsp.exec_cmd(vars.menu))

-- Pseudo layout.
hl.bind(m .. "+P", hl.dsp.window.pseudo())

-- Toggle split, dwindle only.
hl.bind(m .. "+J", hl.dsp.layout("togglesplit"))

-- Move focus with arrow keys.
hl.bind(m .. "+left",  hl.dsp.focus({ direction = "left" }))
hl.bind(m .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(m .. "+up",    hl.dsp.focus({ direction = "up" }))
hl.bind(m .. "+down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces using physical number-row keycodes.
-- This is AZERTY-friendly: it binds the physical keys, not the printed symbols.
-- Physical keycodes:
-- 10 = &
-- 11 = é
-- 12 = "
-- 13 = '
-- 14 = (
-- 15 = -
-- 16 = è
-- 17 = _
-- 18 = ç
-- 19 = à

for i = 1, 10 do
    local code = i + 9

    -- Switch to workspace
    hl.bind(m .. "+code:" .. code, hl.dsp.focus({ workspace = i }))

    -- Move focused window to workspace
    hl.bind(m .. "+SHIFT+code:" .. code, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace / scratchpad.
hl.bind(m .. "+S", hl.dsp.workspace.toggle_special(vars.special_workspace))
hl.bind(m .. "+SHIFT+S", hl.dsp.window.move({
    workspace = "special:" .. vars.special_workspace,
}))

-- Scroll through existing workspaces.
hl.bind(m .. "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(m .. "+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse.
hl.bind(m .. "+mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(m .. "+mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume keys.
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

-- Brightness keys.
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)

-- Media keys.
-- Requires playerctl.
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

hl.bind("code:200", hl.dsp.exec_cmd("grim - | wl-copy"))

hl.bind("Menu", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

--------------------------------------------------------------------------------
-- التشغيل عند الإقلاع (startup)
-- تشغيل التطبيقات مع فصلها تماماً عن عملية البدء
--------------------------------------------------------------------------------

-- التشغيل عند الإقلاع (startup)
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    -- مراقبة الحافظة (يجب أن تكون داخل الدالة)
    hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 50 store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist -max-items 50 store &")
end)

