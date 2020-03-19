;; =============================================================================
;; setup-vterm.el
;;
;;      Configuration file: vterm.
;;
;; =============================================================================

(use-package vterm
  :after evil
  :commands (vterm)
  :config
  (setq vterm-kill-buffer-on-exit t)

  ;; We want to start in insert mode when vterm is opened.
  (add-hook 'vterm-mode-hook
            (lambda() (evil-insert 0))))

(provide 'setup-vterm)
