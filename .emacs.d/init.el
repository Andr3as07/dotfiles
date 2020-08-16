;; Disable GNU Emacs startup screen and clear the scratch buffer.
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Auto insert closing brackets
(electric-pair-mode)

;; Disable menu bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Disable scroll bars
(scroll-bar-mode -1)
(set-window-scroll-bars (minibuffer-window) nil nil)

;; Enable CUA Mode
(cua-mode t)

;; Don't ask `yes/no?', ask `y/n?'.
(fset 'yes-or-no-p 'y-or-n-p)

;; Use full-path-name for the window title
(setq frame-title-format
  '((:eval (if (buffer-file-name)
    (abbreviate-file-name (buffer-file-name))
      "%b"))))

;; Turn on syntax highlighting whenever possible.
(global-font-lock-mode t)

;; When something changes a file, automatically refresh the
;; buffer containing that file so they can't get out of sync.
(global-auto-revert-mode t)

;; Highlight the current line.
(global-hl-line-mode)

;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

;; More sensible indentation (2 instead of 8 spaces).
(setq-default tab-width 2)

;; Set the default line length to 80.
(setq-default fill-column 80)

;; Show the current column
(setq column-number-mode 1)

;; Comment or uncomment a region by hitting C+#.
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if
there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-#") 'comment-or-uncomment-region-or-line)

;; Make <home> and <end> move point to the beginning and end of the line, respectively.
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

;; Bind C-+ and C-- to increase and decrease text size, respectively.
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C-_") 'text-scale-decrease)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; When you double-click on a file in the Mac Finder open it as a
;; buffer in the existing Emacs frame, rather than creating a new
;; frame just for that file.
(setq ns-pop-up-frames nil)

;; Allow 20MB of memory (instead of 0.76MB) before calling garbage collection.
;; This means GC runs less often, which speeds up some operations.
(setq gc-cons-threshold 20000000)

;; Call DELETE-TRAILING-WHITESPACE every time a buffer is saved.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; When saving a file in a directory that doesn't exist,
;; offer to (recursively) create the file's parent directories.
(add-hook 'before-save-hook
  (lambda ()
    (when buffer-file-name
      (let ((dir (file-name-directory buffer-file-name)))
	(when (and (not (file-exists-p dir))
	   (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
	     (make-directory dir t))))))

;; If some text is selected, and you type some text,
;; delete the selected text and start inserting your typed text.
(delete-selection-mode t)

;; Don't assume that sentences should have two spaces after periods. This ain't a typewriter.
(setq sentence-end-double-space nil)

;; If you save a file that doesn't end with a newline, automatically append one.
(setq require-final-newline t)

;; Add file sizes in human-readable units (KB, MB, etc) to dired buffers.
(setq-default dired-listing-switches "-alh")

;; make backup to a designated dir, mirroring the full path
;; source: http://ergoemacs.org/emacs/emacs_set_backup_into_a_directory.html
(defun my-backup-file-name (fpath)
; "Return a new file path of a given file path.
; If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.cache/emacsbackup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, for example, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)
(setq make-backup-file-name-function 'my-backup-file-name)

;; Icomplete Setup
(progn
  ;; minibuffer enhanced completion
  (require 'icomplete)
  (icomplete-mode 1)
  ;; show choices vertically
  ;(setq icomplete-separator "\n")
  (setq icomplete-hide-common-prefix nil)
  (setq icomplete-in-buffer t)

  (define-key icomplete-minibuffer-map (kbd "<right>") 'icomplete-forward-completions)
  (define-key icomplete-minibuffer-map (kbd "<left>") 'icomplete-backward-completions)
)

;; Move cursor by camelCase
(global-subword-mode 1) ; 1 for on, 0 for off

;; Highlight brackets
(progn
  ;; turn on highlight
  (show-paren-mode 1)
  ;; Disable delay
  (setq show-paren-delay 0.0)
  ;; highlight brackets if visible, else entire expression
  (setq show-paren-style 'mixed))

;; Show line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)
