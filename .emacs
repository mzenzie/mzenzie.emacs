
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(load-library "url-handlers")

(package-initialize)

(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/") ("gnu" . "http://elpa.gnu.org/packages/")("melpa" . "http://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (magit cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

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

(show-paren-mode 1)
(setq column-number-mode t)


(global-set-key (kbd "C-c i") 'cider-eval-last-sexp)
(global-set-key (kbd "C-c y") 'cider-eval-buffer)
(global-set-key (kbd "C-c j") 'cider-jack-in)

(global-set-key (kbd "C-;") 'goto-line)

(global-set-key (kbd "C-c DEL") 'delete-region)

(global-set-key (kbd "C-c d") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-c s") 'paredit-forward-barf-sexp)

;;Fixing access over SSH

(global-set-key "\M-[1;5C"    'forward-word)      ; Ctrl+right   => forward word
(global-set-key "\M-[1;5D"    'backward-word)     ; Ctrl+left    => backward word

;;best theme
(load-theme 'wombat)

(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(require 'dired-x)
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|\\.class$"))


(setq dired-listing-switches "-lsR")
(setq-default ediff-forward-word-function 'forward-char)

(setq scroll-conservatively 100000)
(setq auto-window-vscroll nil)
(setq scroll-preserve-screen-position "t")
(setq focus-follows-mouse "t")

(setq tab-width 4)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(defun kill-other-buffers ()
   "Kill all other buffers."
   (interactive)
   (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-c 1") 'kill-other-buffers)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq column-number-mode "t")
