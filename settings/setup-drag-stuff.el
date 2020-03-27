;; =============================================================================
;; setup-drag-stuff.el
;;
;;      Configuration file: Drag stuff.
;;
;; =============================================================================

(use-package drag-stuff
  :after evil
  :config
  ;; Do not use drag-stuff in org mode.
  (add-to-list 'drag-stuff-except-modes 'org-mode)

  ;; Enable drag-stuff everywhere.
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys))

(provide 'setup-drag-stuff)
