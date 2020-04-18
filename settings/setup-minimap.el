;; =============================================================================
;; setup-minimap.el
;;
;;      Configuration file: Minimap.
;;
;; =============================================================================

(use-package minimap
  :commands minimap-mode
  :config
  (setq minimap-window-location 'right)

  ;; Do not highlight the active region in minimap, only the current line.
  (setq minimap-active-region-background ((t nil))))

(provide 'setup-minimap)
