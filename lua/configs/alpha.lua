local icons = {
  kind = {
    Array = "",
    Boolean = "蘒",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "ﳠ",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
  },
  git = {
    LineAdded = "",
    LineModified = "",
    LineRemoved = "",
    FileDeleted = "",
    FileIgnored = "◌",
    FileRenamed = "➜",
    FileStaged = "S",
    FileUnmerged = "",
    FileUnstaged = "",
    FileUntracked = "U",
    Diff = "",
    Repo = "",
    Octoface = "",
    Branch = "",
  },
  ui = {
    ArrowCircleDown = "",
    ArrowCircleLeft = "",
    ArrowCircleRight = "",
    ArrowCircleUp = "",
    BoldArrowDown = "",
    BoldArrowLeft = "",
    BoldArrowRight = "",
    BoldArrowUp = "",
    BoldClose = "",
    BoldDividerLeft = "",
    BoldDividerRight = "",
    BoldLineLeft = "▎",
    BookMark = "",
    BoxChecked = "",
    Bug = "",
    Stacks = " ",
    Scopes = "",
    Watches = "",
    DebugConsole = " ",
    Calendar = "",
    Check = "",
    ChevronRight = ">",
    ChevronShortDown = "",
    ChevronShortLeft = "",
    ChevronShortRight = "",
    ChevronShortUp = "",
    Circle = "",
    Close = "",
    CloudDownload = "",
    Code = "",
    Comment = "",
    Dashboard = "",
    DividerLeft = "",
    DividerRight = "",
    DoubleChevronRight = "»",
    Ellipsis = "…",
    EmptyFolder = "",
    EmptyFolderOpen = "",
    File = "",
    FileSymlink = "",
    Files = "",
    FindFile = "",
    FindText = "",
    Fire = "",
    Folder = "",
    FolderOpen = "",
    FolderSymlink = "",
    Forward = "",
    Gear = "",
    History = "",
    Lightbulb = "",
    LineLeft = "▏",
    LineMiddle = "│",
    List = "",
    Lock = "",
    NewFile = "",
    Note = "",
    Package = "",
    Pencil = "",
    Plus = "",
    Project = "冷",
    Search = "",
    SignIn = "",
    SignOut = "",
    Tab = "",
    Table = "",
    Target = "",
    Telescope = "",
    Text = "",
    Tree = "",
    Triangle = "契",
    TriangleShortArrowDown = "",
    TriangleShortArrowLeft = "",
    TriangleShortArrowRight = "",
    TriangleShortArrowUp = "",
  },
  diagnostics = {
    BoldError = "",
    Error = "",
    BoldWarning = "",
    Warning = "",
    BoldInformation = "",
    Information = "",
    BoldQuestion = "",
    Question = "",
    BoldHint = "",
    Hint = "",
    Debug = "",
    Trace = "✎",
  },
  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
    Smiley = "ﲃ",
    Package = "",
    CircuitBoard = "",
  },
}
local banner = {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

local bannerCoramDeo = {
  " ██████╗ ██████╗ ██████╗  █████╗ ███╗   ███╗    ██████╗ ███████╗ ██████╗ ",
  "██╔════╝██╔═══██╗██╔══██╗██╔══██╗████╗ ████║    ██╔══██╗██╔════╝██╔═══██╗",
  "██║     ██║   ██║██████╔╝███████║██╔████╔██║    ██║  ██║█████╗  ██║   ██║",
  "██║     ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║    ██║  ██║██╔══╝  ██║   ██║",
  "╚██████╗╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║    ██████╔╝███████╗╚██████╔╝",
  " ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝    ╚═════╝ ╚══════╝ ╚═════╝ ",
}
--
local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if status_ok then
  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  require('alpha').setup {

    layout = {
      { type = "padding", val = 10 },
      {
        type = "text",
        val = banner,
        opts = { position = "center", hl = "function" },
      },

      { type = "padding", val = 4 },

      {
        type = "group",
        val = {
          button("f", icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>"),
          button("n", icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>"),
          button("p", icons.ui.Project .. " Projects ", ":SessionManager load_session<CR>"),
          button("r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
          button("t", icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
          -- button(
          --   "c",
          --   lvim.icons.ui.Gear .. "  Configuration",
          --   "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"
          -- ),
        },
        opts = { spacing = 1, hl = "Include" },
      },

      { type = "padding", val = 5 },
      {
        type = "text",
        val = bannerCoramDeo,
        opts = { position = "center", hl = "function" },
      },
      { type = "padding", val = 30 },

      -- { type = "padding", val = 14 },

      -- {
      --   type = "text",
      --   val = "Version: " .. lvim_version,
      --   opts = { position = "center", hl = "function" },
      -- },
    },
  }
end
