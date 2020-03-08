;; =============================================================================
;; setup-use-package.el
;;
;;      Install the package `use-package` that will handler the other packages.
;;
;; =============================================================================

(require 'package)

;; Setup repositories.
(setq package-archives
  '(("org" . "https://orgmode.org/elpa/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")))

;; Initialize built-in package management.
(package-initialize)

;; Update packages list if we are on a new install.
(unless package-archive-contents
  (package-refresh-contents))

;; Install `use-package`.
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'setup-use-package)
