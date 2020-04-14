;; =============================================================================
;; setup-dashboard.el
;;
;;      Configuration file: Dashboard.
;;
;; =============================================================================

(use-package dashboard
  :after evil
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents . 5)
                          (bookmarks . 5)
                          (projects . 8)
;;                          (agenda . 5)
                          (registers . 5)))

  ;; We want to start dashboard in insert mode.
  (add-hook 'dashboard-mode-hook (lambda() (evil-insert 0)))

  (dashboard-setup-startup-hook))

(provide 'setup-dashboard)
