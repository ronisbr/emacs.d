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
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)

  ;; Switch dictionaries.
  (defun ronisbr/flyspell-switch-dictionary ()
    (interactive)
    (let* ((old_dic ispell-current-dictionary)
           (new_dic (if (string= old_dic "en_US") "pt_BR" "en_US")))
      (ispell-change-dictionary new_dic)
      (message "Dictionary switched to %s." new_dic))))

(provide 'setup-flyspell)
