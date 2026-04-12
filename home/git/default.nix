{ ... }:
{
  programs.git = {
    enable = true;

    signing = {
      key = "5FD0400D0E78EAF9843148808EBFC4B924C62D20";
      signByDefault = true;
    };

    lfs.enable = true;

    settings = {
      user = {
        email = "emneo@kreog.com";
        name = "Emily Flion";
      };

      alias = {
        logs = "log --show-signature";
        fuckit = "reset --hard";
        plog = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
        slog = "log --oneline --decorate --graph --all";
        fpush = "push --force-with-lease";
        m = "merge --signoff --no-ff";
      };

      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      init.defaultBranch = "master";

      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };

      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };

      fetch = {
        prune = true;
        pruneTags = true;
        all = false;
      };

      help.autocorrect = "prompt";

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };

      commit.verbose = "yes";

      merge.conflictStyle = "zdiff3";

      sendemail = {
        smtpserver = "mail.s10e.net";
        smtpuser = "emneo@kreog.com";
        smtpencryption = "ssl";
        smtpserverport = 465;
      };

      credential.helper = "cache --timeout 3600";
    };
  };
}
