;; =============================================================================
;; setup-flyspell.el
;;
;;      Configuration file: Flyspell.
;;
;; =============================================================================

(use-package flyspell
  :defer 1
  :config
  ;; Default dictionary.
  (setq ispell-dictionary "en_US")

  ;; Set aspell as default program
  (setq ispell-program-name "aspell")

  ;; Aspell list command
  (setq ispell-list-command "list")

  ;; Enable flyspell-mode
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(provide 'setup-flyspell)
