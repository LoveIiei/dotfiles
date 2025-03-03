local M = {}

local with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local transparent = 0x00000000

-- local gruvbox = {
--   dark0_hard = 0xff1d2021,
--   dark0 = 0xff282828,
--   dark0_soft = 0xff32302f,
--   dark1 = 0xff3c3836,
--   dark2 = 0xff504945,
--   dark3 = 0xff665c54,
--   dark4 = 0xff7c6f64,
--   gray = 0xff928374,
--   light0_hard = 0xfff9f5d7,
--   light0 = 0xfffbf1c7,
--   light0_soft = 0xfff2e5bc,
--   light1 = 0xffebdbb2,
--   light2 = 0xffd5c4a1,
--   light3 = 0xffbdae93,
--   light4 = 0xffa89984,
--   bright_red = 0xfffb4934,
--   bright_green = 0xffb8bb26,
--   bright_yellow = 0xfffabd2f,
--   bright_blue = 0xff83a598,
--   bright_purple = 0xffd3869b,
--   bright_aqua = 0xff8ec07c,
--   bright_orange = 0xfffe8019,
--   neutral_red = 0xffcc241d,
--   neutral_green = 0xff98971a,
--   neutral_yellow = 0xffd79921,
--   neutral_blue = 0xff458588,
--   neutral_purple = 0xffb16286,
--   neutral_aqua = 0xff689d6a,
--   neutral_orange = 0xffd65d0e,
--   faded_red = 0xff9d0006,
--   faded_green = 0xff79740e,
--   faded_yellow = 0xffb57614,
--   faded_blue = 0xff076678,
--   faded_purple = 0xff8f3f71,
--   faded_aqua = 0xff427b58,
--   faded_orange = 0xffaf3a03,
-- }
--
-- M.sections = {
--   bar = {
--     bg = with_alpha(gruvbox.dark0_soft, 0.8),
--     border = transparent,
--   },
--   item = {
--     bg = gruvbox.dark1,
--     border = gruvbox.dark2,
--     text = gruvbox.light1,
--   },
--   apple = gruvbox.bright_red,
--   spaces = {
--     icon = {
--       color = gruvbox.light4,
--       highlight = gruvbox.light0,
--     },
--     label = {
--       color = gruvbox.light4,
--       highlight = gruvbox.bright_yellow,
--     },
--     indicator = gruvbox.bright_blue,
--   },
--   media = {
--     label = gruvbox.light4,
--   },
--   widgets = {
--     battery = {
--       low = gruvbox.bright_red,
--       mid = gruvbox.bright_yellow,
--       high = gruvbox.bright_green,
--     },
--     wifi = { icon = gruvbox.bright_aqua },
--     volume = {
--       icon = gruvbox.bright_blue,
--       popup = {
--         item = gruvbox.light4,
--         highlight = gruvbox.light0,
--       },
--       slider = {
--         highlight = gruvbox.bright_blue,
--         bg = gruvbox.dark3,
--         border = gruvbox.dark2,
--       },
--     },
--     messages = { icon = gruvbox.bright_red },
--   },
--   calendar = {
--     label = gruvbox.light4,
--   },
-- }

local rp_moon = {
  base = 0xff232136,
  surface = 0xff2a273f,
  overlay = 0xff393552,
  muted = 0xff6e6a86,
  subtle = 0xff908caa,
  text = 0xffe0def4,
  love = 0xffeb6f92,
  rose = 0xffea9a97,
  gold = 0xfff6c177,
  iris = 0xffc4a7e7,
  pine = 0xff3e8fb0,
  foam = 0xff9ccfd8,
  highlight_low = 0xff21202e,
  highlight_med = 0xff44415a,
}

M.sections = {
  bar = {
    bg = with_alpha(rp_moon.surface, 0.8),
    border = transparent,
  },
  item = {
    bg = rp_moon.overlay,
    border = rp_moon.highlight_low,
    text = rp_moon.text,
  },
  apple = rp_moon.rose,
  spaces = {
    icon = {
      color = rp_moon.subtle,
      highlight = rp_moon.text,
    },
    label = {
      color = rp_moon.subtle,
      highlight = rp_moon.gold,
    },
    indicator = rp_moon.iris,
  },
  media = {
    label = rp_moon.subtle,
  },
  widgets = {
    battery = {
      low = rp_moon.love,
      mid = rp_moon.gold,
      high = rp_moon.pine,
    },
    wifi = { icon = rp_moon.rose },
    volume = {
      icon = rp_moon.foam,
      popup = {
        item = rp_moon.subtle,
        highlight = rp_moon.text,
      },
      slider = {
        highlight = rp_moon.foam,
        bg = rp_moon.highlight_med,
        border = rp_moon.highlight_low,
      },
    },
    messages = { icon = rp_moon.love },
  },
  calendar = {
    label = rp_moon.subtle,
  },
}

return M
