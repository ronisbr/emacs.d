;; =============================================================================
;; appearance.el
;;
;;      Configure Emacs appearance.
;;
;; =============================================================================

;; Install and configure `atom-one-dark` theme.
;; (use-package atom-one-dark-theme
;;   :config
;;   (load-theme 'atom-one-dark))

;; Install and configure `doom-themes`.
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors.
  (doom-themes-visual-bell-config)

  ;; Enable custom theme for neotree.
  (doom-themes-neotree-config))

;; Show trailing spaces by default.
(setq-default show-trailing-whitespace t)

;; Modes in which white spaces will not be shown.
(add-hook 'term-mode-hook
  (lambda() (setq show-trailing-whitespace nil)))

;; Highlight the current line.
(global-hl-line-mode t)

;; Set font.
(set-face-attribute 'default nil :font "MesloLGSDZ Nerd Font-13")

;; Enable fill column indicator (only for Emacs 27).
(when (>= emacs-major-version 27)
  (add-hook 'prog-mode-hook
    (lambda() (display-fill-column-indicator-mode t)))

  ;; On macOS, tell Emacs to use Apple emoji font.
  (if (eq system-type 'darwin)
    (set-fontset-font "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)))

(provide 'appearance)
