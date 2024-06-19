:;exec emacs -Q --batch -l "$0" -- "$@"

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

;;; copy .wslconfig
(setq wslconfig-path
      (concat windows-user-dir "/.wslconfig"))
(when is-wsl?
  (copy-file (concat wsl-dir "wslconfig") wslconfig-path t)
  (message "created .wslconfig")
  )
