;; ----------------------------------------------------------------------------
;; Enable .emacs debugging
;; ----------------------------------------------------------------------------
(setq debug-on-error t) 

;; ----------------------------------------------------------------------------
;; Package Management
;; ----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
  '("melpa" . 
    "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; ----------------------------------------------------------------------------
;; Personal Preferences
;; ----------------------------------------------------------------------------
(set-default-font "Droid Sans Mono-14")
;; Turn off backup files
(setq make-backup-files nil)
;; Avoid typing the full 'yes' or 'no' response
(defalias 'yes-or-no-p 'y-or-n-p)
;; Spelling checks
(setq flyspell-issue-welcome-flag nil)
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq-default ispell-list-command "list")

;; ----------------------------------------------------------------------------
;; Manage UI (Themes, Fonts, etc.)
;; ----------------------------------------------------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ir-black t)

;; ----------------------------------------------------------------------------
;; General coding preferences
;; ----------------------------------------------------------------------------
;; Pair braces once they are created
(require 'autopair)
;; auto complete
(require 'auto-complete-config)
(ac-config-default)

;; ----------------------------------------------------------------------------
;; Git Revision Control Settings
;; ----------------------------------------------------------------------------
;; git-commit-mode
(add-hook 'git-commit-mode-hook 'git-commit-training-wheels-mode)

;; ----------------------------------------------------------------------------
;; C++ Settings
;; ----------------------------------------------------------------------------
;; Set C++ coding stye 
(setq c-default-style "Stroustrup")

(load-file "/Users/bradm/.emacs.d/elpa/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ----------------------------------------------------------------------------
;; Use flymake automatically
;; ----------------------------------------------------------------------------
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; ----------------------------------------------------------------------------
;; Markdown settings
;; ----------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")

;; ----------------------------------------------------------------------------
;; Deft settings
;; ----------------------------------------------------------------------------
(setq deft-directory "~/Dropbox/org-notes")
(setq deft-use-filename-as-title t)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)

;; ----------------------------------------------------------------------------
;; Org-mode settings
;; ----------------------------------------------------------------------------
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; ----------------------------------------------------------------------------
;; Org-mode CV settings
;; ----------------------------------------------------------------------------
(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-export-latex-classes
             '("resume"
               "\\documentclass[11pt,a4paper,sans]{moderncv}"
               ("\\section{%s}" . "\\section*{%s}")))

;; ----------------------------------------------------------------------------
;; Keyboard Shortcuts
;; ----------------------------------------------------------------------------
(global-set-key [f1] 'dired)

;; ----------------------------------------------------------------------------
;; Mobile Org-mode
;; ----------------------------------------------------------------------------
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; ----------------------------------------------------------------------------
;; Leisure 
;; ----------------------------------------------------------------------------
(require 'twittering-mode)
(setq twittering-use-master-password t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (capitalized-words-mode imenu-add-menubar-index turn-on-eldoc-mode turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indent turn-on-haskell-indentation turn-on-haskell-simple-indent turn-on-haskell-unicode-input-method (lambda nil (ghc-init) (flymake-mode)))))
 '(haskell-stylish-on-save t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


