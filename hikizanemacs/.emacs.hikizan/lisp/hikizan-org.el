;;; hikizan-org.el --- org  -*- lexical-binding: t; -*-

(setq org-directory (or (getenv "EMACS_ORG_DIR") "~/org/"))
(setq org-default-notes-file (expand-file-name "notes.org" org-directory))
(setq org-agenda-files (list org-directory))
(setq org-log-done 'time)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?\n  %i\n  %a")))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
