;;; hikizan-editor.el --- editor  -*- lexical-binding: t; -*-

(setq make-backup-files t)
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(provide 'hikizan-editor)
