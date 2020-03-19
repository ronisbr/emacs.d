;; =============================================================================
;; setup-evil.el
;;
;;      Configuration file: Evil mode.
;;
;; =============================================================================

(use-package evil
  :init
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)

  ;; Ex commands.
  (evil-ex-define-cmd "sp[lit]"  'split-window-below-and-focus)
  (evil-ex-define-cmd "vs[plit]" 'split-window-right-and-focus))

;; Functions for the Ex commands.
(evil-define-command split-window-right-and-focus (arg)
  "Split the window vertically and focus the new window."
  (interactive "<a>")
  (split-window-right)
  (windmove-right)
  (when arg
    (evil-edit arg)))

(evil-define-command split-window-below-and-focus (arg)
  "Split the window horizontally and focus the new window."
  (interactive "<a>")
  (split-window-below)
  (windmove-down)
  (when arg
    (evil-edit arg)))

(evil-define-command toggle-vterm ()
  "Toggle vterm window."
  (interactive)
  ;; Name of the vterm buffer.
  (defvar vterm--buffer-name "vterm")
  (cond ((get-buffer-window vterm--buffer-name)
         ;; If the window is opened, then just close it.
         (ignore-errors (delete-window (get-buffer-window vterm--buffer-name))))
        (t
          ;; If the window is closed, then open a new window below all others.
          (split-window (frame-root-window)
                        (floor (* 0.72 (window-height)))
                        'below)
          (windmove-down)
          ;; If the buffer does not exists, then create a new buffer and open
          ;; vterm on it. Otherwise, just show the buffer.
          (cond ((get-buffer vterm--buffer-name)
                 (switch-to-buffer vterm--buffer-name)
                 (evil-insert 0))
                (t
                  (generate-new-buffer vterm--buffer-name)
                  (with-current-buffer vterm--buffer-name
                    (vterm-mode))
                  (switch-to-buffer vterm--buffer-name))))))

(provide 'setup-evil-mode)
