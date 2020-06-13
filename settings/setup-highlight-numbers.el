;; =============================================================================
;; setup-highlight-numbers.el
;;
;;      Configuration file: Highlight numbers.
;;
;; =============================================================================

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode)
  :config
  ;; Fix number highlighting in Julia mode.
  (puthash 'julia-mode
           (rx (and
                symbol-start
                (or
                 ;; Match hexadecimal number.
                 (and "0x"
                      (+ (and hex-digit (? "_"))))
                 ;; Match octal number.
                 (and "0o"
                      (+ (and (any "012345678") (? "_"))))
                 ;; Match binary numbers.
                 (and "0b"
                      (+ (and (any "01") (? "_"))))
                 ;; Match other numbers.
                 (and (+ (and digit (? "_")))
                      (? (and "." (* (and digit (? "_")))))
                      (? (and (any "eE")
                              (? (any "-+"))
                              (+ (and digit (? "_")))))))
                symbol-end))
           highlight-numbers-modelist))

(provide 'setup-highlight-numbers)
