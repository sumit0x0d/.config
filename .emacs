;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t)
(setq use-dialog-box nil)

(set-face-attribute 'default nil :height 144)

(setq-default mode-line-format (delq 'mode-line-modes mode-line-format))

;; (load-theme 'modus-vivendi t)
;; (setq modus-themes-italic-constructs t)


;; (setq modus-themes-bold-constructs t)

;; (set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 90))
;; (add-to-list 'default-frame-alist '(font . "Iosevka-20"))

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(setq confirm-kill-emacs #'y-or-n-p)

(setq ring-bell-function 'ignore)

(setq isearch-allow-scroll t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)

(setq frame-title-format "<%f>")

;; (setq-default truncate-lines t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(global-hl-line-mode)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key (kbd "<backspace>") 'delete-backward-char)

;; (define-key dired-mode-map [mouse-2] 'dired-mouse-find-file)

(setq dired-dwim-target t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

;; (setq c-offsets-alist '((arglist-cont-nonempty . +)
;;                         (arglist-intro . +)
;;                         (arglist-close . 0)))
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

(setq isearch-lazy-count t)

(setq-default whitespace-line-column 144)
(setq-default display-fill-column-indicator-column 144)
(global-display-fill-column-indicator-mode 1)

(add-hook 'python-mode-hook (lambda ()
			                  (setq indent-tabs-mode t)
			                  (setq python-indent-offset 8)
			                  (setq tab-width 8)))

(setq hscroll-margin 0)
(setq hscroll-step 1)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

(ido-mode)
(ido-everywhere)
(setq ido-enable-flex-matching t)
(setq ido-case-fold t)
(setq ido-use-virtual-buffers t)
(setq ido-auto-merge-delay-time 3)

(fido-vertical-mode)

(setq-local icomplete-prospects-height 10)

(setq split-width-threshold nil)
(setq split-height-threshold 0)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t)
;; (setq eldoc-echo-area-use-multiline-p nil)

(setq hexl-bits 8)

(setq dired-listing-switches "--group-directories-first -alhv")
(setq backup-directory-alist `(("." . ,(expand-file-name (concat user-emacs-directory "backup")))))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq delete-by-moving-to-trash t)

(column-number-mode)
(delete-selection-mode)

(save-place-mode)
(global-subword-mode)

(setq-default display-line-numbers-width 3)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

(show-paren-mode)

(global-set-key (kbd "M-p") 'flymake-goto-prev-error)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)

(setq eglot-ignored-server-capabilities '(:hoverProvider))

(recentf-mode)
(setq recentf-max-menu-items 34)
(setq recentf-max-saved-items 34)

(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c <right>") 'hs-show-block)
(global-set-key (kbd "C-c <left>") 'hs-hide-block)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (add-hook 'after-init-hook #'global-company-mode))

(use-package undo-tree
  :ensure t
  :init
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist
	    `(("." . ,(expand-file-name (concat user-emacs-directory "undo-tree-history")))))
  (global-undo-tree-mode))

(use-package eglot
  :ensure t
  :pin gnu
  :config
  (add-to-list 'eglot-server-programs '((c-mode) . ("clangd" "--header-insertion=never")))
  (add-to-list 'eglot-server-programs '((c++-mode) . ("clangd" "--header-insertion=never")))
  (add-to-list 'eglot-server-programs '((rust-mode) . ("rust-analyzer")))
  :init
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'rust-mode-hook 'eglot-ensure)
  (add-hook 'lua-mode-hook 'eglot-ensure)
  (add-hook 'cmake-mode-hook 'eglot-ensure))

(use-package rainbow-mode
  :ensure t)

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

(use-package goto-chg
  :ensure t
  :bind
  ("C-," . goto-last-change)
  ("C-." . goto-last-change-reverse))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C-<" . mc/mark-previous-like-this)
  ("C->" . mc/mark-next-like-this)
  ("C-c C-<" . mc/mark-all-like-this)
  ("C-M-<" . mc/skip-to-previous-like-this)
  ("C-M->" . mc/skip-to-next-like-this))

(use-package keycast
  :ensure t)

(use-package move-text
  :ensure t
  :bind
  ("M-<up>" . move-text-up)
  ("M-<down>" . move-text-down)
  :config
  (defun indent-region-advice (&rest ignored)
    (let ((deactivate deactivate-mark))
      (if (region-active-p)
	      (indent-region (region-beginning) (region-end))
	    (indent-region (line-beginning-position) (line-end-position)))
      (setq deactivate-mark deactivate)))
  (advice-add 'move-text-up :after 'indent-region-advice)
  (advice-add 'move-text-down :after 'indent-region-advice))

(use-package cmake-mode
  :ensure t
  :config
  (setq cmake-tab-width 8))

(use-package meson-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0)
  :init
  (which-key-mode))

(use-package glsl-mode
  :ensure t)

(use-package qml-mode
  :ensure t)

(use-package lua-mode
  :ensure t)

(use-package magit
  :ensure t
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package protobuf-mode
  :ensure t)

;; (use-package beacon
;;   :ensure t
;;   :init
;;   (beacon-mode))

(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-elea-dark t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ef-themes qml-mode spacemacs-theme timu-macos-theme gruvbox-theme beacon protobuf-mode magit lua-mode glsl-mode which-key json-mode go-mode rust-mode markdown-mode meson-mode cmake-mode move-text keycast multiple-cursors rainbow-delimiters goto-chg expand-region rainbow-mode undo-tree company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
