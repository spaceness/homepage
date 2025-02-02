{
  description = "Spaceness homepage";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # a tree-wide formatter
    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.treefmt-nix.flakeModule ];

      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        { lib
        , pkgs
        , self'
        , config
        , inputs'
        , system
        , ...
        }:
        {
          # this is what controls how packages in the flake are built, but this is not passed to the
          # builders in lib which is important to note, since we have to do something different for
          # the builders to work correctly
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
              allowUnsupportedSystem = true;
            };
            overlays = [ ];
          };

          formatter = config.treefmt.build.wrapper;

          treefmt = {
            projectRootFile = "flake.nix";
            settings.global.excludes = [ "node_modules/**" ];

            programs = {
              taplo.enable = true;

              nixfmt = {
                enable = true;
                package = pkgs.nixfmt-rfc-style;
              };

              prettier = {
                enable = true;
                settings = {
                  useTabs = true;
                  singleQuote = true;
                  trailingComma = "none";
                  printWidth = 100;
                  plugins = [
                    "prettier-plugin-svelte"
                    "prettier-plugin-tailwindcss"
                  ];
                  overrides = [
                    {
                      files = "*.svelte";
                      options = {
                        parser = "svelte";
                      };
                    }
                  ];
                };
              };
            };
          };

          devShells = {
            default = pkgs.mkShell {
              name = "stardust";
              packages = [
                (pkgs.bun.overrideAttrs rec {
                  version = "1.1.43";
                  passthru.sources = {
                    "x86_64-linux" = pkgs.fetchurl {
                      url = "https://github.com/oven-sh/bun/releases/download/bun-v1.2.1/bun-linux-x64-baseline.zip";
                      hash = "sha256-5PKoeW7i9DV+AvOHR6PYCqSKPeyoCqQbIaO4hBhVvx4=";
                    };
                    "x86_64-darwin" = pkgs.fetchurl {
                      url = "https://github.com/oven-sh/bun/releases/download/bun-v1.1.43/bun-darwin-x64-baseline.zip";
                      hash = "sha256-q2vBAlBJ7FRowGje7F50MUdgDrOmeyG0xHYC1nRpETY=";
                    };
                  };
                  src = passthru.sources.${system};
                })
              ];

              inputsFrom = [ config.treefmt.build.devShell ];
            };
          };
        };
    };
}
