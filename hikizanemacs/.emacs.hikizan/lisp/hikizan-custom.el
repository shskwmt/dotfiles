;;; hikizan-custom.el --- -*- lexical-binding: t; -*-

(setq custom-file load-file-name)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs 'y-or-n-p)
 '(create-lockfiles nil)
 '(delete-selection-mode t)
 '(delete-trailing-lines t)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(require-final-newline t)
 '(show-trailing-whitespace t)
 '(standard-indent 2)
 '(tab-always-indent 'complete)
 '(tab-width 4)
 '(windmove-default-keybindings '([ignore] meta)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'hikizan-custom)
