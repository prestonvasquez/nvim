-- Highlight what the current branch changed relative to another branch, like a
-- PR diff. The base is the merge-base, so commits that landed on the other
-- branch after this one forked aren't shown as changes.
local function set_base(branch)
  local dir = vim.fn.expand("%:p:h")
  local out = vim.fn.systemlist({ "git", "-C", dir, "merge-base", "HEAD", branch })
  if vim.v.shell_error ~= 0 then
    vim.notify("git merge-base HEAD " .. branch .. ": " .. table.concat(out, "\n"), vim.log.levels.ERROR)
    return
  end
  require("gitsigns").change_base(out[1], true)
  vim.notify("Gitsigns base: " .. branch .. " (" .. out[1]:sub(1, 8) .. ")")
end

return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>gm", function() set_base("master") end, desc = "Diff Branch vs master" },
    {
      "<leader>gM",
      function()
        vim.ui.input({ prompt = "Diff against branch: ", default = "release/" }, function(branch)
          if branch and branch ~= "" then
            set_base(branch)
          end
        end)
      end,
      desc = "Diff Branch vs ...",
    },
    { "<leader>gR", function() require("gitsigns").reset_base(true) end, desc = "Reset Diff Base" },
  },
}
