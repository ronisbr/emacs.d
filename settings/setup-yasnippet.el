;; =============================================================================
;; setup-yasnipptes.el
;;
;;      Configuration file: YASnippet.
;;
;; =============================================================================

(use-package yasnippet
  :init
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))

  ;; Workarround so that YASnippet can work in Evil-mode when expanding snippets
  ;; that requires a selection.
  ;;
  ;; See: https://github.com/emacs-evil/evil/issues/254
  ;;
  (add-hook 'yas-before-expand-snippet-hook
    #'(lambda()
        (when (evil-visual-state-p)
          (let ((p (point))
                (m (mark)))
            (evil-insert-state)
            (goto-char p)
            (set-mark m))))))

(provide 'setup-yasnippet)
