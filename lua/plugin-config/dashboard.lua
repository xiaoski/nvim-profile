local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.setup({
    config = {
        header = {[[]],
                  [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
                  [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
                  [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
                  [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
                  [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
                  [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
                  [[]]},
        center = {
          {
            icon = "  ",
            desc = "Projects                            ",
            action = "Telescope projects"
          }, 
          {
            icon = "  ",
            desc = "Recently files                      ",
            action = "Telescope oldfiles"
          }, 
          {
            icon = "  ",
            desc = "Find file                           ",
            action = "Telescope find_files"
          },
        },
        footer = {"", "", "Hello World"},
    }
})
