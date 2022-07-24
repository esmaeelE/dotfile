
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; hide welcome screen
(setq inhibit-startup-screen t)

;;line number relative
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(misterioso))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(menu-bar-mode nil)
 '(package-selected-packages '(evil))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs vim mode
(require 'evil)
(evil-mode 1)
