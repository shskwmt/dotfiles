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
