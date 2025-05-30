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
        wrap = true;
        scrolloff = 5;
      };

      keymaps = [
        {
          key = "<C-c>";
          mode = ["n"];
          action = ":nohl<CR>";
          silent = true;
          desc = "Clear search hl";
        }
        {
          key = "J";
          mode = ["v"];
          action = ":m '>+1<CR>gv=gv";
          desc = "moves lines down in visual selection";
        }
        {
          key = "K";
          mode = ["v"];
          action = ":m '<-2<CR>gv=gv";
          desc = "moves lines up in visual selection";
        }
        {
          key = "<leader>-";
          mode = ["n"];
          action = "<C-w>s";
          desc = "Split window horizontally";
        }
        {
          key = "<leader>|";
          mode = ["n"];
          action = "<C-w>v";
          desc = "Split window vertically";
        }
        {
          key = "<leader>q";
          mode = ["n"];
          action = "<C-w>q";
          desc = "Close current split";
        }
        {
          key = "<leader>=";
          mode = ["n"];
          action = "<C-w>=";
          desc = "Make splits equal size";
        }
        {
          key = "<C-Minus>";
          mode = ["n"];
          action = "<C-w>-";
          desc = "Reduce window size";
        }
        {
          key = "<C-Plus>";
          mode = ["n"];
          action = "<C-w>+";
          desc = "Increase window size";
        }
        {
          key = "<C-h>";
          mode = ["n"];
          action = "<C-w>h";
          desc = "Move to window left";
        }
        {
          key = "<C-k>";
          mode = ["n"];
          action = "<C-w>k";
          desc = "Move to top window";
        }
        {
          key = "<C-j>";
          mode = ["n"];
          action = "<C-w>j";
          desc = "Move to bottom window";
        }
        {
          key = "<C-l>";
          mode = ["n"];
          action = "<C-w>l";
          desc = "Move to right window";
        }
      ];

      mini = {
        surround.enable = true;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
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
        svelte.enable = true;
        tailwind.enable = true;
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

      notify = {
        nvim-notify.enable = true;
        # nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };

      utility = {
        preview.markdownPreview.enable = true;
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          # leap.enable = true;
          precognition.enable = false;
        };
        images = {
          img-clip.enable = true;
        };
        yazi-nvim = {
          enable = true;
          mappings = {
            openYazi = "<leader><leader>";
          };
        };
      };

      ui = {
        borders.enable = true;
        # noice.enable = true;
        colorizer = {
          enable = true;
          setupOpts = {
            filetypes = {
              "html" = {};
              "css" = {};
              "javascript" = {};
              "typescript" = {};
              "jsx" = {};
              "tsx" = {};
              "vue" = {};
              "svelte" = {};
            };
          };
        };
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
