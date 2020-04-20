;; =============================================================================
;; init.el
;;
;;      Main file.
;;
;; =============================================================================

;; Disable splash screen.
(setq inhibit-startup-message t)

;; Keep emacs custom-settings in separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Set path to dependencies.
(setq local-lisp-dir
  (expand-file-name "local-lisp" user-emacs-directory))

(setq settings-dir
  (expand-file-name "settings" user-emacs-directory))

;; Set load path.
(add-to-list 'load-path local-lisp-dir)
(add-to-list 'load-path settings-dir)

;; TEMPORARY
(setq package-check-signature nil)

;; Increase the garbace colector threshold to decrease the starup time. It will
;; be reset later by enabling `gcmh-mode`.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Install use-package.
(require 'setup-use-package)

;; Setup appearence as soon as possible.
(require 'appearance)

;; Setup evil as soon as possible.
(require 'setup-evil-mode)

;; Setup dashboard as soon as possible.
(require 'setup-dashboard)

;; Load modeline as soon as possible.
(require 'setup-doom-modeline)

;; We must load the package general before any other package.
(use-package general)
(general-evil-setup t)

(require 'general-settings)

;; Package configurations.
(require 'setup-ace-window)
(require 'setup-avy)
(require 'setup-auctex)
(require 'setup-company-mode)
(require 'setup-drag-stuff)
(require 'setup-emojify)
(require 'setup-expand-region)
(require 'setup-evil-mc)
(require 'setup-evil-numbers)
(require 'setup-flyspell)
(require 'setup-git-gutter-fringe)
(require 'setup-highlight-numbers)
(require 'setup-ialign)
(require 'setup-ivy)
(require 'setup-julia-mode)
(require 'setup-magit)
(require 'setup-markdown)
(require 'setup-minimap)
(require 'setup-org-mode)
(require 'setup-projectile)
(require 'setup-undo-tree)
(require 'setup-treemacs)
(require 'setup-vterm)
(require 'setup-yasnippet)

;; Setup the keybindings.
(require 'setup-keybindings)

;; Setup `gcmh` (garbage collector magic hack) only at the final of the
;; configuration process.
(use-package gcmh
  :init
  (gcmh-mode 1))

;; To debug Emacs startup time, uncomment the following line, start emacs and
;; execute `M-x esup`.
;; (use-package esup
;;   :ensure t
;;   :pin melpa
;;   :commands (esup))
