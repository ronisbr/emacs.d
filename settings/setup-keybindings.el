;; =============================================================================
;; setup-keybindings.el
;;
;;      Setup keybindings using package General.
;;
;; =============================================================================

;; No prefix
;; =============================================================================

(general-define-key
  "<f4>" 'ronisbr/toggle-vterm
  "<f5>" 'ronisbr/flyspell-switch-dictionary)

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
  ;; Evil numbers
  "C-a"    'evil-numbers/inc-at-pt
  "C-x"    'evil-numbers/dec-at-pt
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
  ;; Ivy
  "b"  'counsel-switch-buffer
  "f"  'counsel-find-file
  "k"  'counsel-yank-pop
  "l"  'counsel-locate
  "m"  'counsel-mark-ring
  "r"  'counsel-recentf
  ;; Fill line
  "afc" 'ronisbr/copy-to-end
  "afe" 'ronisbr/fill-to-end
  "afl" 'ronisbr/fill-line
  ;; Org mode
  "oa"  'org-agenda
  "oc"  'org-capture
  "ojn" 'org-journal-new-entry
  "ojo" 'ronisbr/org-journal-open
  "oki" 'org-clock-in
  "okm" 'org-clock-menu
  "okg" 'org-clock-goto
  "oko" 'org-clock-out
  "or"  'org-refile
  "ous" '(lambda() (interactive)(org-update-statistics-cookies "ALL"))
  "ot"  '(lambda() (interactive)(evil-edit ronisbr/org-agenda-directory))
  "ow"  '(lambda() (interactive)(dired ronisbr/org-wiki-directory))
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
  ;; Alignments
  "acc" 'ronisbr/comment-center-align
  "acr" 'ronisbr/comment-right-align
  "atc" 'ronisbr/text-center-align
  "atr" 'ronisbr/text-right-align
  ;; Comments
  "cd" 'comment-dwim
  "cl" 'comment-line
  "ck" 'comment-kill)

;;                                Org mode map
;; =============================================================================

(nmap
  :keymaps 'org-mode-map
  "C-i" 'org-cycle)          ;; This is required to make <tab> works in console.

(nmap
  :prefix "SPC"
  :keymaps 'org-mode-map
  "c"   'org-ctrl-c-ctrl-c
  "m*"  'org-ctrl-c-star
  "m-"  'org-ctrl-c-minus
  "t"   'org-todo)

;; Org-journal
;; ===========

(nmap
  :keymaps 'org-journal-mode-map
  "gn" 'org-journal-open-next-entry
  "gp" 'org-journal-open-previous-entry)

(provide 'setup-keybindings)
