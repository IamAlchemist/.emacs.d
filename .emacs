(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq backup-directory-alist '(("."."~/.emacs_backup")))
;; (setq c-default-style "linux"
;;       c-basic-offset 4)
;; (setq-default c-basic-offset 4)


(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "M-p") 'window-move-down)
(global-set-key (kbd "M-n") 'window-move-up)

(global-set-key (kbd "C-c l") 'hs-hide-level)
(global-set-key (kbd "C-c c") 'hs-toggle-hiding)
(global-set-key (kbd "C-c b") 'hs-show-block)
(global-set-key (kbd "C-c h") 'hs-hide-all)
(global-set-key (kbd "C-c s") 'hs-show-all)

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "p")
  (let ((beg (line-beginning-position))
	(end (line-end-position arg)))
  (copy-region-as-kill beg end))
  )
(global-set-key (kbd "C-c C-c") 'copy-line)

(defun copy-word (&optional arg)
  "Copy words at point"
  (interactive "p")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
	(end (progn (forward-word arg) (point))))
  (copy-region-as-kill beg end))
  )
(global-set-key (kbd "C-c C-w") 'copy-word)

(defun copy-paragraph (&optional arg)
  "Copy paragraphs at point"
  (interactive "p")
  (let ((beg (progn (backward-paragraph 1) (point)))
	(end (progn (forward-paragraph arg) (point))))
    (copy-region-as-kill beg end))
  )
(global-set-key (kbd "C-c C-p") 'copy-paragraph)

(defun window-move-up (&optional arg)
"Current window move-up 2 lines."
(interactive "P")
(if arg
(scroll-up arg)
(scroll-up 2)))

(defun window-move-down (&optional arg)
"Current window move-down 2 lines."
(interactive "P")
(if arg
(scroll-down arg)
(scroll-down 2)))



;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
;; (define-key ac-mode-map [(control return)] 'auto-complete)

(add-to-list 'load-path "~/.emacs.d/plugins")

;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas/global-mode 1)


;; (add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-clang")
;; (require 'auto-complete-clang)
;; (setq ac-clang-auto-save t)
;; (setq ac-auto-start t)
;; (setq ac-quick-help-delay 0.5)

;; (defun my-ac-config ()
;;   (setq ac-clang-flags
;; 	(mapcar(lambda (item)(concat "-I" item))
;; 	       (split-string
;; 		"
;;  /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/c++/v1
;;  /usr/local/include
;;  /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/5.1/include
;;  /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include
;;  /usr/include
;;  /System/Library/Frameworks (framework directory)
;;  /Library/Frameworks (framework directory)
;; ")))
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)  
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()  
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; (my-ac-config)

;;;;;;;;;;;;;;;;;;;;
;; color theme
;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-hober)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
(set-face-foreground 'minibuffer-prompt "yellow")
(set-face-foreground 'mode-line "green")
(set-face-foreground 'button "cyan")
;; (set-face-foreground 'info-xref "cyan")

;;;;;;;;;;;;;;;;;;;;
;; mode
;;;;;;;;;;;;;;;;;;;;
(add-hook 'c++-mode-hook
	  '(lambda()
	     (setq c-basic-offset 4)
	     (c-set-style "stroustrup")))
(add-hook 'c-mode-hook
	  '(lambda()
	     (setq c-basic-offset 4)
	     (c-set-style "stroustrup")))

(add-to-list 'load-path "~/.emacs.d/plugins/mode")
(require 'php-mode)

(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))

(eval-after-load "actionscript-mode" '(load "actionscript-config"))
(add-hook 'actionscript-mode-hood 'hs-minor-mode)


	     
;;;;;;;;;;;;;;;;;;;;
;; sample
;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["white" "red" "green" "yellow" "blue" "magenta" "cyan" "white"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

