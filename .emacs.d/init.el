(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(setq make-backup-files nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil vimrc-mode rust-playground rust-auto-use rustic rust-mode xah-fly-keys company-c-headers company treemacs ## dracula-theme))
 '(warning-suppress-log-types
   '(((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))))
 '(warning-suppress-types
   '(((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization))
     ((package reinitialization)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-file "~/.emacs.d/configuration.el")
(load-file "~/.emacs.d/shortcuts.el")
(evil-mode 1)
