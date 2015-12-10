(add-to-list 'load-path "~/.emacs.d/lisp")

(setq backup-directory-alist '(("."."~/.emacs_backup")))

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;; (global-set-key (kbd "qrr") 'query-replace-regexp)


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(custom-set-variables
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))


(custom-set-faces
 )


(require 'auto-install)
(add-to-list 'load-path "~/.emacs.d/auto-install")
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-compatibility-setup)

(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))

(ido-mode t)

;; packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/auto-complete/1.5")
(require 'auto-complete-config)
(ac-config-default)
