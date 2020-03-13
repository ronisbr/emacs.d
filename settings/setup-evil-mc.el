;; =============================================================================
;; setup-evil-mc.el
;;
;;      Configuration file: Evil multiple cursors.
;;
;; =============================================================================

(use-package evil-mc
  :after evil
  :init
  ;; Add known commands.
  (global-evil-mc-mode t)

  :config
  ;; When ESC is pressed in normal mode, then destroy the multiple cursors.
  (evil-define-key 'normal evil-mc-key-map (kbd "<escape>") 'evil-mc-undo-all-cursors)

  ;; Add supported commands to multiple cursors.
  (nconc evil-mc-known-commands
         '((julia-latexsub-or-indent . ((:default . evil-mc-execute-default-call-with-count))))))



(provide 'setup-evil-mc)
