;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "NotoMono Nerd Font" :size 14)
      doom-symbol-font (font-spec :family "BIZ UDゴシック"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord-aurora)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory (getenv "EMACS_ORG_DIR"))
(setq org-default-notes-file (concat org-directory "main.org"))
(setq org-agenda-files (list org-directory))
(setq system-time-locale "C") ;; to avoid Japanese in the time stamp
(setq org-log-done 'time)
(setq org-startup-truncated nil)

(defun org-open-today ()
  (interactive)
  (find-file (concat org-directory (format-time-string "%Y%m%d") ".org")))

(defun org-insert-todo ()
  (interactive)
  (forward-line)
  (newline)
  (forward-line -1)
  (insert (concat "* TODO  wrote on: " (format-time-string "%Y-%m-%d %H:%M:%S")))
  (beginning-of-line)
  (forward-char 7))
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c i t") 'org-insert-todo))

(defun org-insert-memo ()
  (interactive)
  (forward-line)
  (newline)
  (forward-line -1)
  (insert (concat "*  wrote on: " (format-time-string "%Y-%m-%d %H:%M:%S")))
  (beginning-of-line)
  (forward-char 2))
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c i m") 'org-insert-memo))

(defun org-insert-header ()
  (interactive)
  (goto-char 0)
  (forward-line)
  (newline)
  (forward-line -1)
  (insert (concat "#+date: " (format-time-string "%Y-%m-%d"))))
(with-eval-after-load "org"
  (define-key org-mode-map (kbd "C-c i h") 'org-insert-header))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; mozc
;; required package "emacs-mozc-bin"
;; sudo apt install emacs-mozc-bin
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)

;; wsl
(defun wsl-copy (start end)
  (interactive "r")
  (shell-command-on-region start end "iconv -t sjis | clip.exe")
  (deactivate-mark))
(global-set-key (kbd "C-c M-w") 'wsl-copy)

(defun wsl-paste ()
  (interactive)
  (let ((clipboard
         (shell-command-to-string "powershell.exe -command 'Get-Clipboard' 2> /dev/null")))
    (setq clipboard (replace-regexp-in-string "\r" "" clipboard)) ; Remove Windows ^M characters
    (setq clipboard (substring clipboard 0 -1)) ; Remove newline added by Powershell
    (insert clipboard)))
(global-set-key (kbd "C-c C-y") 'wsl-paste)

;; yasnippet
(setq snippet-directory (getenv "EMACS_SNIPPET_DIR"))
(setq yas-snippet-dirs `(snippet-directory))

;; window
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-t") 'other-window)

;; doom-modeline
(setq doom-modeline-github t)

;; open
(global-set-key (kbd "C-c o p") 'list-processes)
