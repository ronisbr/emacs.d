;; =============================================================================
;; setup-evil-numbers.el
;;
;;      Configuration file: Evil numbers.
;;
;; =============================================================================

(use-package evil-numbers
  :after evil
  :commands (evil-numbers/dec-at-pt evil-numbers/inc-at-pt))

(provide 'setup-evil-numbers)
