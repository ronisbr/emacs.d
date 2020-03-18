;; =============================================================================
;; setup-undo-tree.el
;;
;;      Configuration file: Undo tree.
;;
;; =============================================================================

(use-package undo-tree
  :init
  (global-undo-tree-mode t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree")))
  (setq undo-tree-auto-save-history t))


(provide 'setup-undo-tree)
