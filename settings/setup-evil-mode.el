;; =============================================================================
;; setup-evil.el
;;
;;      Configuration file: Evil mode.
;;
;; =============================================================================

(use-package evil
  :init
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)

  ;; Ex commands.
  (evil-ex-define-cmd "sp[lit]"  'ronisbr/split-window-below-and-focus)
  (evil-ex-define-cmd "vs[plit]" 'ronisbr/split-window-right-and-focus))

;; =============================================================================
;;                User-defined operators related to Evil mode
;; =============================================================================

;; Join selected lines.
;;
;; Obtained from: https://github.com/emacs-evil/evil/issues/606
(evil-define-operator ronisbr/evil-join (beg end)
  "Join the selected lines."
  :motion evil-line
  (let* ((count (count-lines beg end))
         ;; We join pairs at a time.
         (count (if (> count 1) (1- count) count))
         ;; The mark at the middle of the joined pair of lines.
         (fixup-mark (make-marker)))
    (dotimes (var count)
      (if (and (bolp) (eolp))
        (join-line 1)
        (let* ((end (line-beginning-position 3))
               (fill-column (1+ (- end beg))))
          ;; Save the mark at the middle of the pair.
          (set-marker fixup-mark (line-end-position))
          ;; Join it via fill.
          (fill-region-as-paragraph beg end)
          ;; Jump back to the middle.
          (goto-char fixup-mark)
          ;; Context-dependent whitespace fixup.
          (fixup-whitespace))))
    ;; Remove the mark.
    (set-marker fixup-mark nil)))

;; =============================================================================
;;                User-defined functions related to Evil mode
;; =============================================================================

;; Split the window to the right and move the focus there.
(evil-define-command ronisbr/split-window-right-and-focus (arg)
  "Split the window vertically and focus the new window."
  (interactive "<a>")
  (split-window-right)
  (windmove-right)
  (when arg
    (evil-edit arg)))

;; Split the window to below and move the focus there.
(evil-define-command ronisbr/split-window-below-and-focus (arg)
  "Split the window horizontally and focus the new window."
  (interactive "<a>")
  (split-window-below)
  (windmove-down)
  (when arg
    (evil-edit arg)))

;; Toogle a small window with vterm opened.
(evil-define-command ronisbr/toggle-vterm ()
  "Toggle vterm window."
  (interactive)
  ;; Name of the vterm buffer.
  (defvar vterm--buffer-name "vterm")
  (cond ((get-buffer-window vterm--buffer-name)
         ;; If the window is opened, then just close it.
         (ignore-errors (delete-window (get-buffer-window vterm--buffer-name))))
        (t
          ;; If the window is closed, then open a new window below all others.
          (split-window (frame-root-window)
                        (floor (* 0.72 (window-height)))
                        'below)
          (windmove-down)
          ;; If the buffer does not exists, then create a new buffer and open
          ;; vterm on it. Otherwise, just show the buffer.
          (cond ((get-buffer vterm--buffer-name)
                 (switch-to-buffer vterm--buffer-name)
                 (evil-insert 0))
                (t
                  (generate-new-buffer vterm--buffer-name)
                  (with-current-buffer vterm--buffer-name
                    (vterm-mode))
                  (switch-to-buffer vterm--buffer-name))))))

(provide 'setup-evil-mode)
