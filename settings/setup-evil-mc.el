;; =============================================================================
;; setup-evil-mc.el
;;
;;      Configuration file: Evil multiple cursors.
;;
;; =============================================================================

(use-package evil-mc
  :after evil
  :init
  (global-evil-mc-mode t)

  :config
  ;; When ESC is pressed in normal mode, then destroy the multiple cursors.
  (evil-define-key 'normal evil-mc-key-map (kbd "<escape>") 'evil-mc-undo-all-cursors))

(provide 'setup-evil-mc)
