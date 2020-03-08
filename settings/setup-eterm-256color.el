;; =============================================================================
;; setup-eterm-256color.el
;;
;;      Configuration file: eterm-256color.
;;
;; =============================================================================

(use-package eterm-256color
  :init
  (add-hook 'term-mode-hook #'eterm-256color-mode))

(provide 'setup-eterm-256color)
