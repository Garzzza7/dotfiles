;;; -*- lexical-binding: t; -*-
;;; ============================================
;;; init.el
;;; Vim-inspired Emacs configuration
;;; ============================================

;;; PACKAGE MANAGEMENT

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)


;;; GENERAL SETTINGS

(setq-default
  indent-tabs-mode nil
  tab-width 4
  standard-indent 4
  c-basic-offset 4
  truncate-lines nil)

(setq
  make-backup-files nil
  auto-save-default nil
  create-lockfiles nil
  inhibit-startup-screen t
  ring-bell-function 'ignore
  visible-bell nil
  scroll-margin 16
  scroll-conservatively 101
  scroll-preserve-screen-position t
  require-final-newline t
  sentence-end-double-space nil
  search-highlight t
  query-replace-highlight t
  case-fold-search t
  read-buffer-completion-ignore-case t
  read-file-name-completion-ignore-case t
  completion-ignore-case t
  mouse-wheel-scroll-amount '(1)
  mouse-wheel-progressive-speed nil
  use-short-answers t
  confirm-kill-emacs nil)

(global-auto-revert-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(delete-selection-mode 1)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(size-indication-mode 1)

(setq show-paren-delay 0)

;; UTF-8

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;;; UI

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq frame-title-format "%b")
(setq frame-background-mode 'dark)


;;; MODE LINE

(setq-default mode-line-format
              '("%e"
                mode-line-buffer-identification
                " "
                mode-line-modified
                " "
                "%l/%L "
                "C:%c "
                mode-line-modes))


;;; FILE TYPES

;; Mercury
(add-to-list 'auto-mode-alist
             '("\\.m\\'" . mercury-mode))

;; ANTLR4
(add-to-list 'auto-mode-alist
             '("\\.g4\\'" . antlr-mode))


;;; COMPLETION

(use-package vertico
             :init
             (vertico-mode 1))

(use-package orderless
             :init
             (setq completion-styles '(orderless basic)
                   completion-category-defaults nil
                   completion-category-overrides
                   '((file (styles basic partial-completion)))))

(use-package marginalia
             :init
             (marginalia-mode 1))

(use-package embark
             :bind
             (("C-." . embark-act)
              ("C-;" . embark-dwim)))


;;; CONSULT

(use-package consult
             :bind
             (("C-s" . isearch-forward)
              ("C-x b" . consult-buffer)
              ("M-y" . consult-yank-pop)
              ("M-s r" . consult-ripgrep)))


;;; PROJECTILE

(use-package projectile
             :init
             (projectile-mode 1)
             :config
             (setq projectile-completion-system 'default
                   projectile-enable-caching t)
             :bind-keymap
             ("C-c p" . projectile-command-map))


;;; RIPGREP

(use-package rg
             :commands (rg rg-project))


;;; GIT

(use-package magit
             :commands (magit-status magit-log))


;;; EVIL

(use-package evil
             :init
             (setq evil-want-keybinding nil
                   evil-want-C-u-scroll t)
             :config
             (evil-mode 1)

             ;; Vim scrolling
             (define-key evil-normal-state-map
                         (kbd "C-u") #'evil-scroll-up)

             (define-key evil-normal-state-map
                         (kbd "C-d") #'evil-scroll-down)

             (define-key evil-visual-state-map
                         (kbd "C-u") #'evil-scroll-up)

             (define-key evil-visual-state-map
                         (kbd "C-d") #'evil-scroll-down))


;;; GENERAL / LEADER KEY

(use-package general
             :after evil
             :config

             (general-create-definer my/leader-keys
                                     :states '(normal visual)
                                     :keymaps 'override
                                     :prefix "SPC"
                                     :global-prefix "C-SPC")

             (my/leader-keys

               ;; FZF equivalents

               "sf" '(projectile-find-file
                       :which-key "Search files")

               "sa" '(consult-ripgrep
                       :which-key "Search text")

               "SPC" '(consult-buffer
                        :which-key "Buffers")

               "/" '(consult-line
                      :which-key "Search current buffer")

               "ss" '(consult-line-multi
                       :which-key "Search all buffers")

               ;; Marks

               "mn" '(consult-mark
                       :which-key "Marks")

               ;; Directories

               "al" '(my/find-algos
                       :which-key "Open Algos")

               ;; Code navigation

               "jj" '(xref-find-definitions
                       :which-key "Go to definition")

               "ab" '(xref-pop-marker-stack
                       :which-key "Jump back")

               "ja" '(xref-find-references
                       :which-key "Find references")))


;;; ALGORITHMS DIRECTORY

(defun my/find-algos ()
  "Open Algos directory in Dired."
  (interactive)
  (let ((directory
          (expand-file-name "~/zadania/Algos")))
    (if (file-directory-p directory)
      (dired directory)
      (user-error
        "Algos directory does not exist: %s"
        directory))))


;;; BUFFER MANAGEMENT

(defun my/kill-current-buffer ()
  "Kill current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "M-n") #'next-buffer)
(global-set-key (kbd "M-p") #'previous-buffer)
(global-set-key (kbd "M-d") #'my/kill-current-buffer)


;;; WINDOW NAVIGATION

(windmove-default-keybindings)

(global-set-key (kbd "C-h") #'windmove-left)
(global-set-key (kbd "C-j") #'windmove-down)
(global-set-key (kbd "C-k") #'windmove-up)
(global-set-key (kbd "C-l") #'windmove-right)


;;; SAVE AND QUIT

(defun my/save-all-buffers ()
  "Save all modified buffers."
  (interactive)
  (save-some-buffers t))

(defun my/kill-emacs ()
  "Exit Emacs."
  (interactive)
  (save-buffers-kill-emacs))

(global-set-key (kbd "M-C-w") #'my/save-all-buffers)
(global-set-key (kbd "M-C-q") #'my/kill-emacs)


;;; RELOAD CONFIGURATION

(defun my/reload-config ()
  "Reload Emacs configuration."
  (interactive)
  (load-file user-init-file))

(global-set-key (kbd "C-r") #'my/reload-config)


;;; SEARCH AND REPLACE

(defun my/search-word-at-point ()
  "Search project for word at point."
  (interactive)
  (let ((word (thing-at-point 'word t)))
    (consult-ripgrep nil word)))

(defun my/replace-word-at-point ()
  "Replace word at point with confirmation."
  (interactive)
  (let ((word (thing-at-point 'word t)))
    (when word
      (query-replace
        word
        (read-string
          (format "Replace %s with: " word))))))

(defun my/replace-word-at-point-all ()
  "Replace word at point without confirmation."
  (interactive)
  (let ((word (thing-at-point 'word t)))
    (when word
      (replace-string
        word
        (read-string
          (format "Replace %s with: " word))))))


;;; MOVE LINES

(defun my/move-line-down ()
  "Move current line down."
  (interactive)
  (transpose-lines 1)
  (forward-line -1))

(defun my/move-line-up ()
  "Move current line up."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))


;;; TIME

(defun my/show-current-time ()
  "Display current time."
  (interactive)
  (message "Current time is %s"
           (current-time-string)))


;;; COMPILATION

(defun my/compile-current-file ()
  "Save and compile current file using comp.sh."
  (interactive)
  (unless buffer-file-name
    (user-error "Buffer has no file"))
  (save-buffer)
  (compile
    (format "comp.sh %s"
            (shell-quote-argument buffer-file-name))))

(defun my/run-python ()
  "Save current file and run Python."
  (interactive)
  (unless buffer-file-name
    (user-error "Buffer has no file"))
  (save-buffer)
  (compile
    (format "python3 %s"
            (shell-quote-argument buffer-file-name))))


;;; KEYBINDINGS

;; Move lines
(global-set-key (kbd "C-S-j") #'my/move-line-down)
(global-set-key (kbd "C-S-k") #'my/move-line-up)

;; Search
(global-set-key (kbd "C-S-s") #'my/search-word-at-point)
(global-set-key (kbd "C-S-a") #'my/replace-word-at-point)
(global-set-key (kbd "C-S-d") #'my/replace-word-at-point-all)

;; Save and compile
(global-set-key (kbd "<f1>") #'my/show-current-time)
(global-set-key (kbd "<f8>") #'my/compile-current-file)
(global-set-key (kbd "<f9>") #'my/run-python)
(global-set-key (kbd "<f10>") #'my/compile-current-file)

;; Buffer list
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; Search
(global-set-key (kbd "C-c f") #'projectile-find-file)
(global-set-key (kbd "C-c s") #'consult-ripgrep)

;; Clear search / cancel
(global-set-key (kbd "ESC ESC") #'keyboard-quit)


;;; TERMINAL

(use-package vterm
             :ensure t
             :commands (vterm))


;;; THEMES

;; Uncomment if desired:
;;
;; (use-package gruber-darker-theme
;;   :ensure t
;;   :config
;;   (load-theme 'gruber-darker t))


;;; INDENTATION

(setq-default
  indent-tabs-mode nil
  tab-width 4
  c-basic-offset 4)


;;; DISABLE ARROW KEYS

; (defun my/disabled-arrow-key ()
;   "Disable arrow keys."
;   (interactive)
;   (message "Use navigation keys instead."))

; (global-set-key (kbd "<up>") #'my/disabled-arrow-key)
; (global-set-key (kbd "<down>") #'my/disabled-arrow-key)
; (global-set-key (kbd "<left>") #'my/disabled-arrow-key)
; (global-set-key (kbd "<right>") #'my/disabled-arrow-key)


;;; FINAL

(provide 'init)

;;(invert-face 'default)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult embark evil general magit marginalia orderless projectile rg
             rust-mode typst-ts-mode uwu-theme vertico vterm xclip)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Vim-like tags navigation

;; Use the built-in Emacs tags system.
(require 'etags)

;; Ctrl+] - jump to tag definition.
(define-key evil-normal-state-map
            (kbd "C-]")
            #'xref-find-definitions)

;; Ctrl+t - jump backwards.
(define-key evil-normal-state-map
            (kbd "C-t")
            #'xref-pop-marker-stack)

;; Also support Visual mode.
(define-key evil-visual-state-map
            (kbd "C-]")
            #'xref-find-definitions)

(define-key evil-visual-state-map
            (kbd "C-t")
            #'xref-pop-marker-stack)
