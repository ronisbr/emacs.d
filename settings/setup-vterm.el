;; =============================================================================
;; setup-vterm.el
;;
;;      Configuration file: vterm.
;;
;; =============================================================================

(use-package vterm
  :after evil
  :config
  ;; Kill the buffer and deleted the window when exiting.
  (add-hook 'vterm-exit-functions
            (lambda (buffer &optional event)
              (when buffer
                (let ((window (get-buffer-window buffer)))
                  (when window
                    (delete-window window)))
                (kill-buffer buffer))))

  ;; We want to start in insert mode when vterm is opened.
  (add-hook 'vterm-mode-hook
            (lambda() (evil-insert 0)))

  ;; Make `<F4>` toggle vterm window.
  (define-key vterm-mode-map (kbd "<f4>") 'ronisbr/toggle-vterm))

(provide 'setup-vterm)
