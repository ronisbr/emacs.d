;; =============================================================================
;; setup-emojify.el
;;
;;      Configuration file: Emojify.
;;
;; =============================================================================

(use-package emojify
  :defer 1
  :config

  ;; On macOS, use `unicode` since we have a good emoji font.
  (if (eq system-type 'darwin)
    (setq emojify-display-style 'unicode))
  (global-emojify-mode))

(provide 'setup-emojify)
