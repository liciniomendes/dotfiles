require("render-markdown").setup({
  enabled = true,
  render_modes = { "n", "c" }, -- renderiza em normal e command mode
  heading = {
    enabled = true,
    sign = true,
    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
  },
  code = {
    enabled = true,
    style = "full", -- highlight do bloco completo
    border = "thin",
  },
  bullet = {
    enabled = true,
  },
  checkbox = {
    enabled = true,
    unchecked = { icon = "󰄱 " },
    checked = { icon = "󰱒 " },
  },
  link = {
    enabled = true,
  },
})
