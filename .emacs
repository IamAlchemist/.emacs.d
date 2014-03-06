(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-default-font "Consolas-12")
(defalias 'qrr 'query-replace-regexp)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "M-p") 'window-move-down)
(global-set-key (kbd "M-n") 'window-move-up)

(setq backup-directory-alist '(("."."~/.emacs_backup")))
(add-to-list 'load-path "~/.emacs.d/")	
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-hober)

(add-to-list 'load-path "~/.emacs.d/plugins/mode")
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
(set-face-foreground 'minibuffer-prompt "yellow")
(set-face-foreground 'mode-line "green")
(set-face-foreground 'button "cyan")
;; (set-face-foreground 'info-xref "cyan")

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

(add-hook 'c++-mode-hook
	  '(lambda()
	     (setq c-basic-offset 4)
	     (c-set-style "stroustrup")))
(add-hook 'c-mode-hook
	  '(lambda()
	     (setq c-basic-offset 4)
	     (c-set-style "stroustrup")))
	     
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

;; (setq c-default-style "linux"
;;       c-basic-offset 4)
;; (setq-default c-basic-offset 4)

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

