local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-------------------------------------------
-------------------------------------------

local button = function(map, icon, text, command)
    return dashboard.button(map, icon .. "  > " .. text, command)
end

dashboard.section.buttons.val = {
    button("e", "", "New File", ":enew<CR>"),
    button("f", "󰱽", "Find File", ":Telescope find_files<CR>"),
    button("r", "", "Recent", ":Telescope oldfiles<CR>"),
    button("p", "󰏗", "Plugins", ":Lazy<CR>"),
    button("s", "", "Settings", ":cd $nvimdir | Telescope find_files<CR>"),
    button("q", "󰈆", "Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
