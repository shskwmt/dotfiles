;;; hikizan-keybinds.el --- keybinds -*- lexical-binding: t; -*-

;;; unset keys

;; mouse
(global-unset-key (kbd "C-<down-mouse-1>")) ;; mouse-buffer-menu
(global-unset-key (kbd "C-M-<down-mouse-1>")) ;; mouse-drag-region-rectangle
(global-unset-key (kbd "C-M-<mouse-1>")) ;; mouse-set-point
(global-unset-key (kbd "M-<down-mouse-1>")) ;; mouse-drag-secondary
(global-unset-key (kbd "M-<drag-mouse-1>")) ;; mouse-set-secondary
(global-unset-key (kbd "M-<mouse-1>")) ;; mouse-start-secondary
(global-unset-key (kbd "M-<mouse-2>")) ;; mouse-yank-secondary
(global-unset-key (kbd "M-<mouse-3>")) ;; mouse-secondary-save-then-kill
(global-unset-key (kbd "S-<down-mouse-1>")) ;; mouse-appearance-menu
(global-unset-key (kbd "S-<mouse-3>")) ;; kmacro-end-call-mouse
(global-unset-key (kbd "<down-mouse-1>")) ;; mouse-drag-region
(global-unset-key (kbd "<drag-mouse-1>")) ;; mouse-set-region
(global-unset-key (kbd "<mouse-1>")) ;; mouse-set-point
(global-unset-key (kbd "<mouse-2>")) ;; mouse-yank-primary
(global-unset-key (kbd "<mouse-3>")) ;; mouse-save-then-kill
(global-unset-key (kbd "<mouse-movement>")) ;; ignore-preserving-kill-region

;; function
(global-unset-key (kbd "C-<f10>")) ;; buffer-menu-open
(global-unset-key (kbd "S-<f10>")) ;; context-menu-open
(global-unset-key (kbd "<f10>")) ;; menu-bar-open

;; C-
(global-unset-key (kbd "C-z")) ;; suspend-frame
(global-unset-key (kbd "C-<down>")) ;; forward-paragraph
(global-unset-key (kbd "C-<insert>")) ;; kill-ring-save
(global-unset-key (kbd "C-<insertchar>")) ;; kill-ring-save
(global-unset-key (kbd "C-<up>")) ;; backward-paragraph

;; C-M-
(global-unset-key (kbd "C-M-<backspace>")) ;; backward-kill-sexp
(global-unset-key (kbd "C-M-<delete>")) ;; backward-kill-sexp
(global-unset-key (kbd "C-M-<down>")) ;; down-list
(global-unset-key (kbd "C-M-<end>")) ;; end-of-defun
(global-unset-key (kbd "C-M-<home>")) ;; beginning-of-defun
(global-unset-key (kbd "C-M-<up>")) ;; backward-up-list

;; C-x
(global-unset-key (kbd "C-x C-d")) ;; list-directory
(global-unset-key (kbd "C-x C-z")) ;; suspend-frame

;; M-
(global-unset-key (kbd "M-`")) ;; tmm-menubar

;;; packages

;; https://github.com/emacs-evil/evil
(elpaca evil
  (setq evil-normal-state-cursor 'box)
  (evil-mode 1)
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-insert-state-exit-hook  (lambda () (send-string-to-terminal "\033[2 q"))))

(elpaca which-key
  (setq which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot 10)
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(provide 'hikizan-keybinds)
