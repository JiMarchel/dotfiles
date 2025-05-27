{
  inputs,
  config,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];
  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;
      lineNumberMode = "relative";
      enableLuaLoader = true;
      preventJunkFiles = true;
      options = {
        tabstop = 4;
        shiftwidth = 4;
        wrap = false;
      };

      # theme = {
      #   enable = lib.mkForce true;
      #   name = lib.mkForce "rose-pine";
      #   style = lib.mkForce "moon";
      #   transparent = lib.mkForce true;
      # };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
        };
      };

      maps = {
        normal = {
          "<leader>e" = {
            action = "<CMD>Neotree toggle<CR>";
            silent = false;
          };
        };
      };

      diagnostics = {
        enable = true;
        config = {
          virtual_lines.enable = true;
          underline = true;
        };
      };

      telescope.enable = true;

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = false;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        nvim-docs-view.enable = false;
      };

      lsp.enable = true;
      languages = {
        # enableLSP = true; #diganti menjadi vim.lsp.enable
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
        zig.enable = true;
        python.enable = true;
        markdown.enable = true;
        ts = {
          enable = true;
          lsp.enable = true;
          format.type = "prettierd";
          extensions.ts-error-translator.enable = true;
        };
        html.enable = true;
        lua.enable = true;
        css.enable = true;
        typst.enable = true;
        rust = {
          enable = true;
          crates.enable = true;
        };
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        indent-blankline.enable = true;
        rainbow-delimiters.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      # tabline.nvimBufferline.enable = true;
      treesitter.context.enable = false;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };

      projects.project-nvim.enable = true;
      # dashboard.dashboard-nvim.enable = true;
      filetree.neo-tree.enable = true;

      notify = {
        nvim-notify.enable = true;
        # nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };

      utility = {
        preview.markdownPreview.enable = true;
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          # leap.enable = true;
          precognition.enable = false;
        };
        images = {
          image-nvim.enable = false;
        };
      };

      ui = {
        borders.enable = true;
        # noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = true;
        };
        fastaction.enable = true;
      };

      session = {
        nvim-session-manager.enable = false;
      };
      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
