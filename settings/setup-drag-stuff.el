;; =============================================================================
;; setup-drag-stuff.el
;;
;;      Configuration file: Drag stuff.
;;
;; =============================================================================

(use-package drag-stuff
  :after evil
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys))

(provide 'setup-drag-stuff)
