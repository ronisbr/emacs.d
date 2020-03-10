;; =============================================================================
;; setup-evil.el
;;
;;      Configuration file: Evil mode.
;;
;; =============================================================================

(use-package evil
  :init
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1))

(provide 'setup-evil-mode)
