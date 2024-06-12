{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [

    # shell related
    zsh        
    zsh-autosuggestions
    zsh-nix-shell

    # utilities
    neovim
    wget
    htop
    gitMinimal
    rsync
    bc
    units
    pfetch

    # packages that must come with every Linux system
    curl
    lsof
    xz
    zip
    pstree
    lz4
    unzip
    tree
    fd
    acpi
    usbutils
    pciutils
    killall
    file
    dig
    pv

    # Crisis tools https://www.brendangregg.com/blog/2024-03-24/linux-crisis-tools.html
    sysstat
    tcpdump
    trace-cmd
    ethtool
    tiptop

    #cpuid
    msr-tools
    numactl

    # File processing
    jpegoptim
    optipng

    # Spell checking
    languagetool
    ispell
    aspell        
    aspellDicts.ar
    aspellDicts.en
    aspellDicts.fi

    # Other productivity
    yt-dlp
    biber
    strace
    netcat
    nmap
    pwgen
    du-dust
    gping
    traceroute
    borgbackup
    qrencode
    gnupatch
    ripgrep
    tmux
    lf        
    sshfs
    jq

    # compilers, interpreters, runtimes, etc
    #unstable.go_1_21
    gcc 
    rustc
    jre
    jdk
    lua 
    sass
    lua52Packages.luarocks
    python311Full
    python311Packages.pip

    # utilities
    ffmpeg
    git-privacy
    git-lfs
    gdb
    bvi
    minify
    pkg-config
    licensor
    gnupg
    bat
    sqlite
    dmtx-utils
    fzf
    scc

    # build tools
    gnumake
    cmake
    cargo
    nodejs
    #corepack_21

    # documentation, generators
    mdbook
    mdbook-mermaid
    mdbook-toc
    mdbook-pdf
    mdbook-katex
    pandoc

    #unstable.hugo
    plantuml
    
    #nodePackages.mermaid-cli
    mermaid-cli
    graphviz
    texlive.combined.scheme-full
    tectonic
    imagemagick

    # sbom, compliance
    cyclonedx-gomod
    cyclonedx-python
    cdxgen

    # language servers, checkers, formatters
    shellcheck

    #cmake-language-server
    rust-analyzer
    nodePackages.pyright
    nodePackages.eslint
    nodePackages.stylelint
    nodePackages.bash-language-server
    nodePackages.vscode-json-languageserver
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    taplo
    lua-language-server
    prettierd
    hadolint
    nixd
    nil
    tailwindcss-language-server
    vscode-langservers-extracted
    nodePackages.jsdoc
  
    # We use latest version of Go
    #unstable.gopls
    #unstable.gotools
    #unstable.golangci-lint
    #unstable.govulncheck

  ];

  # Ensure zsh is recognized as a system shell
  environment.shells = [pkgs.zsh];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";

    # clean up        
    #XAUTHORITY = "$XDG_RUNTIME_DIR/xauthority"; # breaking DMs
    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0";
    LESSHISTFILE = "-";
    SQLITE_HISTORY = "/tmp/sqlite_history";
    #WGETRC = "$XDG_CONFIG_HOME/wget/wgetrc";
    TMUX_TMPDIR = "$XDG_RUNTIME_DIR";
    GOPATH = "$HOME/repos/go";
    #CARGO_HOME="$XDG_DATA_HOME/cargo";
    #HISTFILE = "$XDG_DATA_HOME/history";

    LC_ALL = "en_US.UTF-8";
    DO_NOT_TRACK = "1";

    # Java issue fix 
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

}
