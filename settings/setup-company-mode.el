;; =============================================================================
;; setup-company-mode.el
;;
;;      Configuration file: Company mode.
;;
;; =============================================================================

(use-package company
 :config
 ;; Enable company-mode globally.
 (global-company-mode)
 ;; Maximum number of candidates in tool tip.
 (setq company-tooltip-limit 10)
 ;; The candidates will not be down cased.
 (setq company-dabbrev-downcase 0)
 ;; No idle time.
 (setq company-idle-delay 0)
 ;; No delay to show the echo of completion.
 (setq company-echo-delay 0)
 ;; Start completion with 2 characters.
 (setq company-minimum-prefix-length 2)
 ;; Do not disallow non-matching input.
 (setq company-require-match nil)
 ;; Annotation will be aligned in the right border.
 (setq company-tooltip-align-annotations t)
 ;; Weight occurrences by frequency.
 (setq company-transformers '(company-sort-by-occurrence))

 ;; Additional packages
 ;; ============================================================================

 (use-package company-math))

(provide 'setup-company-mode)
