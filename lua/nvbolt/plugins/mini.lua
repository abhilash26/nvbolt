return {
  {
    "echasnovski/mini.surround",
    keys = { "ys", "ds", "cs" },
    opts = {
      mapping = { add = "yes", delete = "ds", replace = "cs" },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
  },
}
