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

;; Install use-package.
(require 'setup-use-package)

;; Setup appearence as soon as possible.
(require 'appearance)

;; Load modeline as soon as possible.
(require 'setup-doom-modeline)

;; We must load the package general before any other package.
(use-package general)
(general-evil-setup t)

(require 'general-settings)

;; Package configurations.
(require 'setup-avy)
(require 'setup-auctex)
(require 'setup-company-mode)
(require 'setup-drag-stuff)
(require 'setup-emojify)
(require 'setup-eterm-256color)
(require 'setup-expand-region)
(require 'setup-evil-mc)
(require 'setup-evil-mode)
(require 'setup-flyspell)
(require 'setup-git-gutter-fringe)
(require 'setup-helm)
(require 'setup-ialign)
(require 'setup-julia-mode)
(require 'setup-magit)
(require 'setup-minimap)
(require 'setup-neotree)
(require 'setup-smex)
(require 'setup-undo-tree)
(require 'setup-yasnippet)

;; Setup the keybindings.
(require 'setup-keybindings)
