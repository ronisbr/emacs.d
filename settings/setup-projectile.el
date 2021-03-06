;; =============================================================================
;; setup-projectile.el
;;
;;      Configuration file: Projectile.
;;
;; =============================================================================

(use-package projectile
  :config
  (projectile-mode t)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy))

(provide 'setup-projectile)
