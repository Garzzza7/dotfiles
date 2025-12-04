(require 'package)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

(defun revert-buffer-no-confirm ()
  "Revert buffer without requiring confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     default))
 '(package-selected-packages
   '(company cuda-mode exec-path-from-shell gnuplot gruber-darker-theme
	     haskell-mode lsp-mode lua-mode magit nix-mode rust-mode
	     typst-ts-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode)

(exec-path-from-shell-initialize)

(global-company-mode 1)
(setq company-backends '((company-dabbrev)))
(setq company-dabbrev-minimum-length 1)
(setq company-dabbrev-ignore-case 1)
(setq company-idle-delay nil)

(define-key company-mode-map (kbd "C-<tab>") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(invert-face 'default)

(setq scroll-step            1
      scroll-conservatively  10000)
(scroll-bar-mode -1)
 ;; (use-package lsp-mode
 ;;   :hook ((c-mode          ; clangd
 ;;           c++-mode        ; clangd
 ;;           c-or-c++-mode   ; clangd
 ;; 	   rust-mode       ; rust-analyzer
 ;;           python-mode     ; pyright
 ;;           ) . lsp)
 ;;   :commands lsp
 ;;   :config
 ;;   (setq lsp-auto-guess-root t)
 ;;   (setq lsp-diagnostic-package :none)
 ;;   (setq lsp-enable-symbol-highlighting t)
 ;;   (setq lsp-enable-on-type-formatting nil)
 ;;   (setq lsp-signature-auto-activate nil)
 ;;   (setq lsp-enable-folding nil)
 ;;   (setq lsp-enable-snippet nil)
 ;;   (setq lsp-enable-completion-at-point t)
 ;;   (setq read-process-output-max (* 1024 1024)) ;; 1mb
 ;;   (setq lsp-idle-delay 0.5)
 ;;   (setq lsp-prefer-capf t)) ; prefer lsp's company-capf over company-lsp

 ;; (use-package company
 ;;   :hook (prog-mode . company-mode)
 ;;   :config
 ;;   (setq company-minimum-prefix-length 1)
 ;;   (setq company-idle-delay 0.3)
 ;;   (setq company-selection-wrap-around t)
 ;;   (setq company-tooltip-align-annotations t))
