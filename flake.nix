{
  description = "ZMK";
  inputs = rec {
    flake-utils.url = "github:numtide/flake-utils";
    devshell.url = "github:numtide/devshell/main";
  };


  outputs =
    { self
    , nixpkgs
    , flake-utils
    , devshell
    , ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem
      (system:
      let

        overlays = map (x: x.overlays.default) [
          devshell
        ];
        pkgs = import nixpkgs { inherit system overlays; };
        # pkgs = nixpkgs.legacyPackages.${system};
        zmk = pkgs.stdenv.mkDerivation {
          name = "zmk";
          src = pkgs.fetchurl {
            url = "https://zmk.dev/setup.sh";
            sha256 = "sha256-mmNxUM0pahiRX/FbtWLBLOafqVrgL5tzYeC0P+bNKfk";
          };

          unpackPhase = ''
            cp $src srcFile
          '';

          sourceRoot = ".";
          nativeBuildInputs = [ pkgs.makeWrapper ];

          installPhase = ''
            mkdir -p $out/bin
            outfile=zmk-setup
            cp srcFile $out/bin/$outfile
            chmod +x  $out/bin/$outfile
            wrapProgram $out/bin/$outfile \
              --prefix PATH : ${pkgs.lib.makeBinPath (with pkgs;[ bash git curl wget ])}
          '';
        };
      in
      rec {
        devShell = pkgs.devshell.mkShell {

          # devshell.startup.init1.text = ''
          #   # Allow the use of wheels.
          #   SOURCE_DATE_EPOCH=$(date +%s)
          # '';

          env = [
          ];
          commands = [
            {
              name = "build";
              command = "echo TODO:\"$@\"";
              help = "Build the firmware";
              category = "ZMK";
            }
            {
              name = "flash";
              command = "echo TODO: \"$@\"";
              help = "Flash the firmware to the connected device";
              category = "ZMK";
            }
          ];
          packages = with pkgs; [
            bash
            curl
            fd
            fzf
            gnused
            jq
            ripgrep
            zmk
          ];
        };
      });
}
