(require 'package)
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
 '(package-selected-packages '(company gnuplot magit rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-company-mode 1)
(setq company-backends '((company-dabbrev)))
(setq company-dabbrev-minimum-length 1)
(setq company-dabbrev-ignore-case 1)
(setq company-idle-delay nil)

(define-key company-mode-map (kbd "TAB") 'company-complete)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(invert-face 'default)

