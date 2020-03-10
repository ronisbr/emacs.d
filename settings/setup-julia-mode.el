;; =============================================================================
;; julia.el
;;
;;      Configuration file: Julia mode.
;;
;; =============================================================================

(use-package julia-mode
  :mode ("\\.jl\\'" . julia-mode)
  :init
  (add-hook 'julia-mode-hook
    '(lambda()
       ;; Add company-backend math-symbols-unicode only in Julia mode.
       (add-to-list (make-local-variable 'company-backends) 'company-math-symbols-unicode))))

(provide 'setup-julia-mode)
