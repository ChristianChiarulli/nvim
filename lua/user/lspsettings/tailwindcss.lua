return {
    settings = {
      tailwindCSS = {
        classAttributes = { "class", "className", "class:list", "classList", "ngClass", ".*Styles", ".*Classes" },
        -- experimental = {
        --   classRegex = {
        --     "tw`([^`]*)",
        --     "className\\s*:\\s*['\"`]([^'\"`]*)['\"`]",
        --     "Classes \\=([^;]*);",
        --     "'([^']*)'",
        --     "Classes \\=([^;]*);",
        --     '"([^"]*)"',
        --     "Classes \\=([^;]*);",
        --     "\\`([^\\`]*)\\`",
        --   },
        -- },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        validate = true,
      },
    },
  }
