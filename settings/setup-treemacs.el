;; =============================================================================
;; setup-treemacs.el
;;
;;      Configuration file: Treemacs.
;;
;; =============================================================================

(use-package treemacs
  :bind ("<f3>" . treemacs)
  :config
  (treemacs-git-mode 'deferred))

(use-package treemacs-evil
  :after (evil treemacs)
  :commands (treemacs))

(use-package treemacs-icons-dired
  :after (dired)
  :config
  (treemacs-icons-dired-mode))

(use-package treemacs-projectile
  :after (evil projectile)
  :commands (treemacs))

(provide 'setup-treemacs)
