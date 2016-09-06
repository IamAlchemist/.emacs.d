(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C--") 'undo)
(global-set-key (kbd "s-/") 'comment-dwim)
;; (global-set-key (kbd "qrr") 'query-replace-regexp)

(setq backup-directory-alist '(("."."~/.emacs_backup")))

(custom-set-variables
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 )

(ido-mode t)

;; package
;; packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(require 'package)
(package-initialize)

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (defalias 'perl-mode 'cperl-mode)
;; (add-hook 'cperl-mode-hook
;;           (lambda()
;;             (require 'perl-completion)
;;             (perl-completion-mode t)))



;; auto-complete
(ac-config-default)
