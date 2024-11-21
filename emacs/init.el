(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")
        ))

;; Initialize package system
(package-initialize)

;; Refresh package contents (if not already done)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))


;; Enable relative line numbers
(global-display-line-numbers-mode 1)         ;; Enable line numbers globally
(setq display-line-numbers-type 'relative)  ;; Set to relative line numbers

;; Set a built-in color theme 
(load-theme 'gruvbox-light-medium t)  

;; Turn off toolbar scrollbar and menubar
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

;; Enable line wrapping
(global-visual-line-mode 1)

;; Enable column number display in mode line
(column-number-mode 1)

;; Enable matching parentheses highlighting
(show-paren-mode 1)

;; Display the time in the mode line
(display-time-mode 1)

;; Set a custom splash screen message (optional)
(setq inhibit-splash-screen t)  ;; Disable default splash screen
(setq initial-scratch-message ";; UwU.\n\n")

;; Enable clipboard support (optional)
(setq select-enable-clipboard t)

;; Set the default indentation style (optional)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)  ;; Use spaces instead of tabs
(setq font-lock-maximum-decoration t)

;; Disable startup message
(setq inhibit-startup-message t)

;; Custom key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)  ;; Use ibuffer instead of default buffer list
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal)  ;; Save and quit shortcut

