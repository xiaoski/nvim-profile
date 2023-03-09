local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.setup({
    theme = "doom",
    config = {
        header = {[[]],
                  [[]],
                  [[]],
                  [[]],
                  [[]],
                  [[]],
                  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
                  [[]],
                  [[]],
                  [[]],
                  [[]],
                },
        center = {
          {
            icon = "  ",
            desc = "Projects                            ",
            action = "Telescope projects",
            key = 'p',
          }, 
          {
            icon = "  ",
            desc = "Recently files                      ",
            action = "Telescope oldfiles",
            key = 'r',
          }, 
          {
            icon = "  ",
            desc = "Find file                           ",
            action = "Telescope find_files",
            key = 'f'
          },
        },
        footer = {
          '',
          ' 🚀 Sharp tools make good work.',
      },

    },
})
