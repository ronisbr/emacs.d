;; =============================================================================
;; setup-auctex.el
;;
;;      Configuration file: AUCTeX.
;;
;; =============================================================================

(use-package auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  ;; Use pdflatex.
  (setq TeX-PDF-mode t)

  ;; Enable synctex correlation.
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)

  ;; Setup viewers.
  (setq TeX-view-program-list
    '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

  ;; Setup default viewers.
  (setq TeX-view-program-selection
   '((output-dvi "open")
     (output-pdf "Skim")
     (output-html "open")))

  ;; Activate interface between RefTeX and AUCTeX.
  (setq reftex-plug-into-AUCTeX t)

  ;; Hooks
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

  ;; Do not show traling whitespaces in RefTeX.
  (add-hook 'reftex-select-label-mode-hook
    (lambda() (setq show-trailing-whitespace nil))))

(provide 'setup-auctex)
