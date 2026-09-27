return {
  "obsidian-nvim/obsidian.nvim", -- moved from epwalsh/obsidian.nvim, which stalled at v3.9.0
  version = "*", -- Recommended to use the latest release
  lazy = true,
  -- Ensure it loads for markdown files or when triggered by LazyVim's telescope
  ft = "markdown",
  cmd = {
    "ObsidianCheck",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianSearch",
    "ObsidianTags",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian Note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Obsidian File" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian Backlinks" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Search Obsidian Tags" },
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end,
      expr = true,
      desc = "Follow Obsidian Link",
    },
  },
  opts = {
    picker = {
      name = "snacks.picker",
    },
    workspaces = {
      {
        name = "ZK-Vault",
        -- Change this to the exact path of your actual Obsidian Vault
        path = "~/Obsidian/",
      },
    },

    -- Zettelkasten specific subdirectories
    notes_subdir = "01 - Fleeting",

    -- Configures ZK timestamp format prefix for IDs
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Optional: Configures how frontmatter is structured
    frontmatter = {
      func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },
  },
}
