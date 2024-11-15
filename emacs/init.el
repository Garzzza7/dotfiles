;; Basic Emacs Configuration with Relative Line Numbers and Built-in Color Scheme

;; Enable relative line numbers
(global-display-line-numbers-mode 1)         ;; Enable line numbers globally
(setq display-line-numbers-type 'relative)  ;; Set to relative line numbers

;; Set a built-in color theme (Emacs comes with several built-in themes)
(load-theme 'wombat t)  ;; Load the 'wombat' color theme (dark)

;; Enable line wrapping
(global-visual-line-mode 1)

;; Set default font (optional)
(set-frame-font "Monaco-12" nil t)

;; Enable column number display in mode line
(column-number-mode 1)

;; Enable matching parentheses highlighting
(show-paren-mode 1)

;; Display the time in the mode line
(display-time-mode 1)

;; Set a custom splash screen message (optional)
(setq inhibit-splash-screen t)  ;; Disable default splash screen
(setq initial-scratch-message ";; Welcome to Emacs! Happy coding.\n\n")

;; Enable clipboard support (optional)
(setq select-enable-clipboard t)

;; Set the default indentation style (optional)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)  ;; Use spaces instead of tabs

;; Disable startup message
(setq inhibit-startup-message t)

;; Custom key bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)  ;; Use ibuffer instead of default buffer list
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal)  ;; Save and quit shortcut

