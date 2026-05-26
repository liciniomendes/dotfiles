require("roslyn").setup({
  -- File watching: "auto" | "roslyn" | "off"
  -- Uses "roslyn" on Linux to avoind inotify issues
  filewatching = vim.fn.has("linux") == 1 and "roslyn" or "auto",

  config = {
    -- Roslyn is informed about blink capabilities
    capabilities = require("blink.cmp").get_lsp_capabilities(),

    settings = {
      ["csharp|completion"] = {
        dotnet_provide_regex_completions = true,
        dotnet_show_completion_items_from_unimported_namespaces = true,
      },
      ["csharp|inlay_hints"] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        dotnet_enable_inlay_hints_for_parameters = true,
      },
      ["csharp|code_lens"] = {
        dotnet_enable_references_code_lens = true,
      },
      ["csharp|background_analysis"] = {
        dotnet_analyzer_diagnostics_scope = "fullSolution",
        dotnet_compiler_diagnostics_scope = "fullSolution",
      },
    },
  },
})
