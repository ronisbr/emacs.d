;; =============================================================================
;; setup-keybindings.el
;;
;;      Setup keybindings using package General.
;;
;; =============================================================================

;; No prefix
;; =============================================================================

(general-define-key
  "<f4>" 'toggle-vterm
  "<f5>" 'ronisbr/flyspell-switch-dictionary
  "M-x"  'helm-M-x)

(nmap
  "s" 'avy-goto-char-2)

;; Visual map.
(vmap
  :keymaps 'evil-mc-key-map
  "A" 'evil-mc-make-cursor-in-visual-selection-end
  "I" 'evil-mc-make-cursor-in-visual-selection-beg)

;; Normal and visual maps.
(nvmap
  "<down>" 'evil-next-visual-line
  "<up>"   'evil-previous-visual-line
  "J"      'ronisbr/evil-join
  ;; Expand region
  "C-="    'er/expand-region)

;; Prefix: SPC
;; =============================================================================

;; Normal map.
(nmap
  :prefix "SPC"
  "."   'next-buffer
  ","   'previous-buffer
  "sws" 'delete-trailing-whitespace
  ;; Ace window
  "w"   'ace-window
  ;; Avy
  "gc"  'avy-goto-char
  "gl"  'avy-goto-line
  "gw"  'avy-goto-word-1
  ;; Helm
  "f"   'helm-find-files
  "r"   'helm-recentf
  "hb"  'helm-buffers-list
  "hk"  'helm-show-kill-ring
  "hm"  'helm-mini
  ;; Projectile
  "pc"  'projectile-commander
  "pt"  'projectile-command-map
  ;; Undo tree
  "uv"  'undo-tree-visualize
  ;; Windmove
  "<down>"  'windmove-down
  "<left>"  'windmove-left
  "<right>" 'windmove-right
  "<up>"    'windmove-up)

;; Visual map.
(vmap
  :prefix "SPC"
  ;; ialign
  "ia"  'ialign
  ;; YASnippets
  "ye"  'yas-expand
  "yi"  'yas-insert-snippet)

;; Normal and visual maps.
(nvmap
  :prefix "SPC"
  ;; Commnets
  "cd" 'comment-dwim
  "cl" 'comment-line
  "ck" 'comment-kill)

(provide 'setup-keybindings)
