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

(require 'appearance)
(require 'general-settings)

;; Package configurations.
(require 'setup-ace-jump-mode)
(require 'setup-auctex)
(require 'setup-company-mode)
(require 'setup-doom-modeline)
(require 'setup-drag-stuff)
(require 'setup-emojify)
(require 'setup-eterm-256color)
(require 'setup-evil-mode)
(require 'setup-evil-mc)
(require 'setup-flyspell)
(require 'setup-helm)
(require 'setup-julia-mode)
(require 'setup-keybindings)
(require 'setup-magit)
(require 'setup-minimap)
(require 'setup-neotree)
(require 'setup-smex)
(require 'setup-yasnippet)
