;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIG.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; FONTS
(setq doom-font (font-spec :family "Hack Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 15)
      doom-big-font (font-spec :family "Hack Nerd Font" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :weight bold))

;; THEME
(setq doom-theme 'doom-one)

;; ORG
(setq org-directory "~/notes/")

;; GENERAL SETTINGS
(setq display-line-numbers-type nil)
(setq confirm-kill-emacs nil)
(setq user-full-name "Alfonso Amorós"
      user-mail-address "alfonso.alfurtx@gmail.com")
(setq-default line-spacing 0.25)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;; KEYBINDINGS
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

;; DIRED
(setq dired-listing-switches "-alh --group-directories-first")

;; CCLS CONFIG
(setq ccls-args (list (concat "-init={"
                                "  \"cache\":{"
                                "    \"directory\":"
                                "      \"" (getenv "HOME") "/.cache/ccls\""
                                "  }"
                                "}")))

;; GOOD-SCROLL (a.k.a smooth scrolling)
(pixel-scroll-mode t)
(setq scroll-margin 8)
(use-package! good-scroll :config (good-scroll-mode 1))
;(setq scroll-margin 1
;      scroll-step 1
;      scroll-conservatively 10000
;      scroll-preserve-screen-position 1)

;; CENTERED CURSOR

;(setq scroll-preserve-screen-position t
;    scroll-conservatively 0
;    maximum-scroll-margin 0.5
;    scroll-margin 99999)

;; CLIPS SUPPORT (PARA LA ASIGNATURA DE SIN - SISTEMAS INTELIGENTES)
(use-package! clips-mode)
