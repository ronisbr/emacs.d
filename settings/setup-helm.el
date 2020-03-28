;; =============================================================================
;; setup-helm.el
;;
;;      Configuration file: Helm.
;;
;; =============================================================================

(use-package helm)

(use-package helm-projectile
  :after projectile
  :commands (helm-projectile-find-file)
  :config
  (helm-projectile-on))

(provide 'setup-helm)
