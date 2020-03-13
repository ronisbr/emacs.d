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

(provide 'setup-evil-mode)
