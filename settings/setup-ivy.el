;; =============================================================================
;; setup-ivy.el
;;
;;      Configuration file: Ivy.
;;
;; =============================================================================

(use-package flx
  :defer 1
  :init
  (setq ivy-flx-limit 10000))

(use-package ivy
  :after flx
  :config
  (ivy-mode t)

  ;; Configuration obtained from Doom emacs.
  (setq ivy-height 17
        ivy-wrap t
        ivy-fixed-height-minibuffer t
        ivy-magic-slash-non-match-action nil
        ivy-use-virtual-buffers nil
        ivy-virtual-abbreviate 'full
        ivy-on-del-error-function #'ignore
        ivy-use-selectable-prompt t)

  ;; Enable fuzzy find in all ivy.
  (setq ivy-re-builders-alist
        '((t . ivy--regex-fuzzy)))

  ;; Do not add the initial character in ivy, since we are using fuzzy finders.
  (setq ivy-initial-inputs-alist nil))

(use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode t))

(use-package all-the-icons-ivy-rich
  :defer 1
  :init
  (all-the-icons-ivy-rich-mode t))

(use-package counsel
  :after (ivy ivy-rich)
  :config

  ;; Use spotlight on macOS.
  (when (eq system-type 'darwin)
    (setq counsel-locate-cmd #'counsel-locate-cmd-mdfind))

  (counsel-mode))

(provide 'setup-ivy)
