(require 'package)

(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))

(package-initialize)

(setq elisp-enable-lexical-binding 1)

(setq inhibit-startup-screen t)

(defun revert-buffer-no-confirm ()
  "Revert buffer without requiring confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  )

(custom-set-variables
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     default))
 '(package-selected-packages
   '(clipboard-collector cmake-mode company cuda-mode evil
			 evil-commentary exec-path-from-shell gnuplot
			 go-mode gruber-darker-theme haskell-mode
			 lsp-mode lsp-ui lua-mode magit nix-mode
			 ocaml-ts-mode pdf-tools rust-mode tuareg
			 typst-ts-mode xclip))
 '(warning-suppress-types '((treesit))))
(custom-set-faces)

(evil-mode 1)
(global-auto-revert-mode 1)
(global-company-mode 1)
(ido-mode 1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(exec-path-from-shell-initialize)

(setq company-backends '((company-dabbrev)))
(setq company-dabbrev-minimum-length 1)
(setq company-dabbrev-ignore-case t)

(setq company-idle-delay nil)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

(defun my/company-complete-or-next ()
  "vim like completion"
  (interactive)
  (if (company--active-p)
      (company-select-next)
    (company-manual-begin)))

(with-eval-after-load 'company
  (define-key evil-insert-state-map (kbd "C-n") #'my/company-complete-or-next)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(invert-face 'default)

(setq scroll-step            1
      scroll-conservatively  10000)
(setq scroll-margin 16)

(with-eval-after-load 'evil
  (evil-define-operator my/evil-comment (beg end type)
    "Comment or uncomment text like Vim gc."
    (interactive "<R>")
    (comment-or-uncomment-region beg end))

  (define-key evil-normal-state-map (kbd "gc") #'my/evil-comment)
  (define-key evil-visual-state-map (kbd "gc") #'my/evil-comment))

(require 'lsp-mode)

(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'c++-ts-mode-hook #'lsp-deferred)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'python-mode-hook #'lsp-deferred)
(add-hook 'rust-mode-hook #'lsp-deferred)
(add-hook 'rust-ts-mode-hook #'lsp-deferred)
;; ocaml
(add-hook 'tuareg-mode-hook #'lsp-deferred)

(setq lsp-keymap-prefix "C-c l")

(setq lsp-idle-delay 0.2)
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-enable-symbol-highlighting t)

(with-eval-after-load 'company
  (setq company-backends '((company-capf company-dabbrev))))

(setq lsp-clients-clangd-args
      '("--header-insertion=never"
        "--completion-style=detailed"
        "--clang-tidy"))

(setq lsp-clients-clangd-executable "clangd")

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "K")
    #'lsp-ui-doc-glance))

(require 'lsp-ui)

(setq lsp-ui-doc-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-doc-position 'at-point)
