;; =============================================================================
;; general.el
;;
;;      General Emacs configuration.
;;
;; =============================================================================

;; Set executable paths.
;;
;; This is required to find `aspell` in macOS.
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; The default directory should be the user's home.
(setq default-directory (concat "~/"))

;; Write autosave files to own directory.
(setq auto-save-file-name-transforms
  `((".*" ,(expand-file-name
             (concat user-emacs-directory "autosaves/\\1")) t)))

;; Create the directory if needed.
(make-directory
  (expand-file-name
    (concat user-emacs-directory "autosaves")) t)

;; Write backup files to own directory
(setq backup-directory-alist
  `(("." . ,(expand-file-name
              (concat user-emacs-directory "backups")))))

;; Create the directory if needed.
(make-directory
  (expand-file-name
    (concat user-emacs-directory "backups")) t)

;; Make backups of files, even when they're in version control.
(setq vc-make-backup-files t)

;; Start with an empty buffer.
(switch-to-buffer (get-buffer-create "empty"))

;; Allow pasting selection outside of Emacs.
(setq x-select-enable-clipboard t)

;; Auto refresh buffers.
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it.
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress.
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting.
(setq delete-by-moving-to-trash t)

;; Transparently open compressed files.
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off.
(global-font-lock-mode t)

;; Alias: 'yes' <-> 'y' and 'no' <-> 'n'.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Set UTF-8 as default encoding.
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Remove text in active region if inserting text.
(delete-selection-mode t)
(pending-delete-mode t)

;; Always display line and column numbers.
(setq line-number-mode t)
(setq column-number-mode t)

;; Set fill column to 80.
(setq-default fill-column 80)

;; Save a list of recent files visited.
(recentf-mode 1)
(setq recentf-max-saved-items 100)

;; Set C-x C-r to open the recent files.
(global-set-key (kbd "\C-x\C-r") 'recentf-open-files)

;; Undo/Redo window configuration with C-c <left>/<right>.
(winner-mode 1)

;; Never insert tabs.
(set-default 'indent-tabs-mode nil)

;; Show empty lines after buffer end.
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words.
(global-subword-mode 1)

;; Don't break lines.
(setq-default truncate-lines t)

;; Sentences do not need double spaces to end.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Increase the memory.
(setq gc-cons-threshold 20000000)

;; Hide toolbar.
(tool-bar-mode -1)

;; Display the line numbers everywhere.
(global-display-line-numbers-mode t)

;; Display a ruler with relative numbers.
(setq display-line-numbers 'relative
      display-line-numbers-current-absolute t)

;; Require a new line at the end.
(setq require-final-newline t)

;; Use a visual bell.
(setq visible-bell t)

;; Highlight matching brackets when cursor is on one.
(show-paren-mode t)

;; Improve scrolling.
(setq scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(provide 'general-settings)
