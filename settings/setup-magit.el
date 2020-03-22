;; =============================================================================
;; setup-magit.el
;;
;;      Configuration file: Magit.
;;
;; =============================================================================

(use-package magit
  :commands (magint magit-status)
  :config
  (add-hook 'git-commit-mode-hook (lambda () (setq fill-column 67))))

(provide 'setup-magit)
