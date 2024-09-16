;;; init.el --- -*- lexical-binding: t; -*-

(defvar hikizan-dir (file-name-directory load-file-name))
(defvar hikizan-lisp-dir (expand-file-name "lisp" hikizan-dir))

(add-to-list 'load-path hikizan-lisp-dir)

(require 'hikizan-package-manager)
(require 'hikizan-custom)
(require 'hikizan-keybinds)
(require 'hikizan-editor)
(require 'hikizan-ui)
