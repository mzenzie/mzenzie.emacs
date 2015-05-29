(setq package-archives '(("marmalade" . "https://marmalade-repo.org/packages/") ("gnu" . "https://elpa.gnu.org/packages/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/libs")
(load "paredit")

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(global-set-key (kbd "C-c i") 'cider-eval-last-sexp)
(global-set-key (kbd "C-c y") 'cider-eval-buffer)
(global-set-key (kbd "C-c j") 'cider-jack-in)

(global-set-key (kbd "C-;") 'goto-line)


(load-theme 'wombat)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|\\.class$"))


(setq dired-listing-switches "-lR")

(setq scroll-conservatively 100000)
(setq auto-window-vscroll nil)
(setq scroll-preserve-screen-position "t")
(setq focus-follows-mouse "t")

(add-hook 'before-save-hook 'delete-trailing-whitespace)
