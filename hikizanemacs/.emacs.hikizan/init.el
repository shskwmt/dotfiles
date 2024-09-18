;;; init.el --- -*- lexical-binding: t; -*-

(defvar hikizan-dir (file-name-directory load-file-name))
(defvar hikizan-lisp-dir (expand-file-name "lisp" hikizan-dir))

(add-to-list 'load-path hikizan-lisp-dir)

(require 'hikizan-package-manager)
(require 'hikizan-keybinds)
(require 'hikizan-project)
(require 'hikizan-editor)
(require 'hikizan-org)
(require 'hikizan-snippet)
(require 'hikizan-programming)
(require 'hikizan-ui)

(setq system-time-local "C") ;; to avoid Japanese in the time stamp
