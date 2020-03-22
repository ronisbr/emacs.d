;; =============================================================================
;; setup-ace-window.el
;;
;;      Configuration file: Ace window.
;;
;; =============================================================================

(use-package ace-window
  :commands ace-window
  :config
  ;; Initial characters used in window labels.
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  ;; Always dispatch the commands.
  (setq aw-dispatch-always t)

  ;; Display the selection characters ahead of time.
  (ace-window-display-mode t))

(provide 'setup-ace-window)

