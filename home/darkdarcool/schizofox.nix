{ config, pkgs, theme, ... }:

{
  programs.schizofox = {
    enable = true;
    
    theme = {
      colors = with theme.colors; {
        background-darker = base00;
        background = base01;
        foreground = base04;
      };

      font = theme.fonts.monospace;

      extraUserChrome = with theme.colors.withHashtag; ''
        nav-bar{ background-color: transparent !important; }
      '';
    };
    

    search = {
      defaultSearchEngine = "Google";
      removeEngines = [ "Brave" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia" ];
      searxUrl = "https://searx.be";
      searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
      addEngines = [
        {
          Name = "YouTube";
          Description = "Searching for a video on youtube";
          Alias = "!y";
          Method = "GET";
          URLTemplate = "https://www.youtube.com/search?search_query={searchTerms}";
        }
      ];
    };

    security = {
      sanitizeOnShutdown = false;
      sandbox = false;
      userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
    };

    misc = {
      drmFix = true;
      disableWebgl = false;
      startPageURL = "about:home"; #file://${builtins.readFile ./startpage.html}";
      contextMenu.enable = true;
    };

    extensions = {
      # simplefox.enable = true;
      darkreader.enable = false;

      enableExtraExtensions = true;

      extraExtensions = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    bookmarks = [
      {
        Title = "github";
        URL = "https://github.com";
        Favicon = "https://github.com/favicon.ico";
        Placement = "toolbar";
        # Folder = "FolderName";
      }
    ];

  };
}
