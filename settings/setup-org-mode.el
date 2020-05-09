;; =============================================================================
;; setup-org-mode.el
;;
;;      Configuration file: Org mode.
;;
;; =============================================================================

;; =============================================================================
;;                            Org files definition
;; =============================================================================

;; Default directory of Org files.
(defvar ronisbr/org-directory
  "~/Nextcloud/org/")

;; Journal directory.
(defvar ronisbr/+org-journal-directory
  "Diário")

;; TODO file for org-capture.
(defvar ronisbr/+org-capture-personal-todo-file
  "TODO-Pessoal.org")

(defvar ronisbr/+org-capture-work-todo-file
  "TODO-Trabalho.org")

;; Wiki directory.
(defvar ronisbr/+org-wiki-directory
  "Wiki")

;; =============================================================================
;;                                 Functions
;; =============================================================================

(defun ronisbr/org-journal-open ()
  "Use dired to select a journal file to be opened."
  (interactive)
  (dired ronisbr/org-journal-directory)
  (setq journal-file (dired-get-filename))
  (evil-edit journal-file)
  (ispell-change-dictionary "pt_BR"))

(defun ronisbr/org-wiki-open ()
  "Use dired to open a wiki file."
  (interactive)
  (dired ronisbr/org-wiki-directory))

;; =============================================================================
;;                               Configuration
;; =============================================================================

(setq ronisbr/org-capture-personal-todo-file
      (expand-file-name ronisbr/+org-capture-personal-todo-file ronisbr/org-directory))
(setq ronisbr/org-capture-work-todo-file
      (expand-file-name ronisbr/+org-capture-work-todo-file ronisbr/org-directory))
(setq ronisbr/org-journal-directory
      (expand-file-name ronisbr/+org-journal-directory ronisbr/org-directory))
(setq ronisbr/org-wiki-directory
      (expand-file-name ronisbr/+org-wiki-directory ronisbr/org-directory))

(use-package doct
  :commands (doct))

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :commands (org-capture org-journal-new-entry)
  :ensure org-plus-contrib
  :config

  (setq org-directory ronisbr/org-directory)

  ;; Load modules.
  (org-load-modules-maybe t)

  ;; Add timestamp when a task is closed.
  (setq org-log-done 'time)

  ;; Pressing `return` in links when in insert mode opens them.
  (setq org-return-follows-link t)

  ;; Faces for the keywords.
  (with-no-warnings
    (custom-declare-face 'ronisbr/+org-todo-active  '((t (:inherit (bold font-lock-constant-face org-todo)))) "")
    (custom-declare-face 'ronisbr/+org-todo-project '((t (:inherit (bold font-lock-doc-face org-todo)))) "")
    (custom-declare-face 'ronisbr/+org-todo-onhold  '((t (:inherit (bold warning org-todo)))) "")
    (custom-declare-face 'ronisbr/+org-todo-cancel  '((t (:inherit (bold error org-todo)))) ""))

  ;; Configuration of TODO keywords.
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "PROJ(P)"
           "INPR(p)"
           "WAIT(w)"
           "HOLD(h)"
           "|"
           "DONE(d!)"
           "DELG(f@)"
           "CANC(c@)")
          (sequence
           "[ ](T)"
           "[-](S)"
           "[?](W)"
           "|"
           "[X](D)"))
        org-todo-keyword-faces
        '(("PROJ" . ronisbr/+org-todo-project)
          ("INPR" . ronisbr/+org-todo-active)
          ("WAIT" . ronisbr/+org-todo-onhold)
          ("HOLD" . ronisbr/+org-todo-onhold)
          ("CANC" . ronisbr/+org-todo-cancel)
          ("[-]"  . ronisbr/+org-todo-active)
          ("[?]"  . ronisbr/+org-todo-onhold)))

  ;; Configuration of TODO priority colors.
  (setq org-priority-faces '((?A . error)
                             (?B . warning)
                             (?C . success)))

  ;; Save org clock between Emacs sections.
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-clock-persist t)

  ;; ===========================================================================
  ;;                              Org-capture
  ;; ===========================================================================

  ;; Always start org-capture in insert mode.
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  ;; Templates for org-capture.
  (setq org-capture-templates
        (doct `(
                (,(format "%s\tPessoal" (all-the-icons-faicon "home" :face 'all-the-icons-green :v-adjust 0.01))
                 :keys "p"
                 :file ronisbr/org-capture-personal-todo-file
                 :hook (lambda () (ispell-change-dictionary "pt_BR"))
                 :prepend t
                 :children ((,(format "%s\tNota" (all-the-icons-faicon "sticky-note" :face 'all-the-icons-green :v-adjust 0.01))
                            :keys "n"
                            :headline "Notas"
                            :type entry
                            :template ("* %?"
                                       "%i %a"))
                            (,(format "%s\tAtividade" (all-the-icons-octicon "inbox" :face 'all-the-icons-yellow :v-adjust 0.01))
                             :keys "a"
                             :headline "Atividades"
                             :type entry
                             :template ("* TODO %? %^G%{extra}"
                                        "%i")
                             :children ((,(format "%s\tSem prazo" (all-the-icons-octicon "checklist" :face 'all-the-icons-green :v-adjust 0.01))
                                         :keys "g"
                                         :extra "")
                                        (,(format "%s\tCom prazo" (all-the-icons-material "timer" :face 'all-the-icons-orange :v-adjust -0.1))
                                         :keys "p"
                                         :extra "\nDEADLINE: %^{Prazo:}t")
                                        (,(format "%s\tCom agendamento" (all-the-icons-octicon "calendar" :face 'all-the-icons-orange :v-adjust 0.01))
                                         :keys "a"
                                         :extra "\nSCHEDULED: %^{Início:}t"
                                         )))))
                (,(format "%s\tTrabalho" (all-the-icons-faicon "building" :face 'all-the-icons-orange :v-adjust 0.01))
                 :keys "t"
                 :file ronisbr/org-capture-work-todo-file
                 :hook (lambda () (ispell-change-dictionary "pt_BR"))
                 :prepend t
                 :children ((,(format "%s\tNota" (all-the-icons-faicon "sticky-note" :face 'all-the-icons-green :v-adjust 0.01))
                            :keys "n"
                            :headline "Notas"
                            :type entry
                            :template ("* %?"
                                       "%i %a"))
                            (,(format "%s\tAtividade" (all-the-icons-octicon "inbox" :face 'all-the-icons-yellow :v-adjust 0.01))
                             :keys "a"
                             :headline "Atividades"
                             :type entry
                             :template ("* TODO %? %^G%{extra}"
                                        "%i")
                             :children ((,(format "%s\tSem prazo" (all-the-icons-octicon "checklist" :face 'all-the-icons-green :v-adjust 0.01))
                                         :keys "g"
                                         :extra "")
                                        (,(format "%s\tCom prazo" (all-the-icons-material "timer" :face 'all-the-icons-orange :v-adjust -0.1))
                                         :keys "p"
                                         :extra "\nDEADLINE: %^{Prazo:}t")
                                        (,(format "%s\tCom agendamento" (all-the-icons-octicon "calendar" :face 'all-the-icons-orange :v-adjust 0.01))
                                         :keys "a"
                                         :extra "\nSCHEDULED: %^{Início:}t"
                                         ))))))))

  ;; ===========================================================================
  ;;                               Org agenda
  ;; ===========================================================================

  ;; Left align tags after the column 80.
  (setq org-tags-column +81)

  ;; Add all files in `ronisbr/org-directory` recursively.
  (setq org-agenda-files (directory-files-recursively ronisbr/org-directory
                                                      "\.org$")))

;; =============================================================================
;;                          Org keybindings for Evil
;; =============================================================================

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; =============================================================================
;;                                Org-journal
;; =============================================================================

(use-package org-journal
  :after org
  :config
  ;; Journal directory.
  (setq org-journal-dir ronisbr/org-journal-directory)

  ;; Record journals monthly.
  (setq org-journal-file-type 'monthly)

  ;; Journal file format.
  (setq org-journal-file-format "%Y/Diário-%m.org")

  ;; Week starts on Sunday.
  (setq org-journal-start-on-weekday 0)

  ;; Set date format.
  (setq org-journal-date-format "%A, %e de %B de %Y (%d/%m/%Y)")

  ;; Header of the journal file.
  (setq org-journal-file-header
        "#+TITLE: Diário relativo ao mês %B de %Y.\n\
#+AUTHOR: Ronan Arraes Jardim Chagas\n\
#+STARTUP: folded\n")

  ;; Hook after an entry is created.
  (add-hook 'org-journal-after-entry-create-hook
            (lambda ()
              ;; Always start in insert mode.
              (evil-insert-state)
              ;; The spelling language should be pt_BR.
              (ispell-change-dictionary "pt_BR"))))

;; =============================================================================
;;                               Org-superstar
;; =============================================================================

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  ;; Make leading start invisible.
  (setq org-superstar-leading-bullet ?\s
        org-superstar-leading-fallback ?\s
        org-hide-leading-stars nil)

  ;; Do not prettify items or TODOs.
  (setq org-superstar-prettify-item-bullets nil
        org-superstar-special-todo-items nil))

(provide 'setup-org-mode)
