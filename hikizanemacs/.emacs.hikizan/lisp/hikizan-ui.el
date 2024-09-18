;;; hikizan-ui.el --- ui  -*- lexical-binding: t; -*-

(load-theme 'whiteboard)

(menu-bar-mode -1)
(which-function-mode t)

(global-hl-line-mode t)
(set-face-background 'hl-line "color-231")

(setq confirm-kill-emacs 'y-or-n-p)
(setq ring-bell-function #'ignore)

;;; completion

;; https://github.com/minad/vertico
(elpaca vertico
  (vertico-mode))

(savehist-mode)

(provide 'hikizan-ui)
