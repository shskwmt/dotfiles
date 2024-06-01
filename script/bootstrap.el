:;exec emacs -Q --batch -l "$0" -- "$@"

(dolist
    (file (directory-files (concat default-directory "symlinks")))
  (let (
        (source-file (expand-file-name (concat (concat default-directory "symlinks/") file)))
        (target-file (concat "~/." file))
        )
    (when (and
           (not (equal file "."))
           (not (equal file ".."))
           (not (file-exists-p target-file))
           (not (file-symlink-p target-file))
           )
        (message source-file)
        (make-symbolic-link source-file target-file)
        (message "created dotfile: %s" target-file)
        )
    )
  )

;; for wsl
(setq is-wsl?
      (not (null (string-match-p "microsoft" (shell-command-to-string "uname -r")))))

(setq windows-user-dir
      (concat "/mnt/c/Users/"
              (shell-command-to-string "cmd.exe /c \"echo %USERNAME%\" 2>/dev/null | tr -d '\r\n'")))

(setq wsl-dir (expand-file-name (concat default-directory "wsl/")))

;;; copy terminal settings
(setq windows-terminal-settings-path
      (concat windows-user-dir "/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"))
(when is-wsl?
  (copy-file (concat wsl-dir "terminal-settings.json") windows-terminal-settings-path t)
  (message "created windows terminal setttings")
  )
