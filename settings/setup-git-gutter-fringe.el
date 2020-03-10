;; =============================================================================
;; setup-git-gutter-fringe.el
;;
;;      Configuration file: Git gutter fringe.
;;
;; =============================================================================

(use-package fringe-helper)

(use-package git-gutter-fringe
  :after fringe-helper
  :init
  ;; Enable only in prog mode.
  (add-hook 'prog-mode-hook 'git-gutter-mode)

  :config
  ;; Configuration based on Doom emacs.

  ;; Standardize default fringe width.
  (if (fboundp 'fringe-mode) (fringe-mode '4))

  ;; Place the git gutter outside the margins.
  (setq-default fringes-outside-margins t)

  ;; Modified content will be orange.
  (set-face-foreground 'git-gutter-fr:modified "orange")

  ;; Thin fringe bitmaps
  (define-fringe-bitmap 'git-gutter-fr:added [224]
                        nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224]
                        nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240]
                        nil nil 'bottom))

(provide 'setup-git-gutter-fringe)
