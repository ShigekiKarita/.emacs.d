(eval-after-load 'ruby-mode
    '(progn
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'smart-compile)
;(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
;(define-key ruby-mode-map (kbd "C-c C-c") (kbd "C-c c C-m"))

(require 'rcodetools)
;(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

;; (add-hook 'ruby-mode-map-hook
;;           '(lambda ()
;;              (define-key ruby-mode-map (kbd "C-c C-d") 'xmp)
;;              (define-key ruby-mode-map (kbd "C-c c") 'smart-compile)))


(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
  (define-key ruby-mode-map (kbd "<C-return>") 'xmp)
  (define-key ruby-mode-map (kbd "<C-tab>") 'rct-complete-symbol))

;(global-set-key (kbd "<C-return>") 'xmp)

(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
(add-hook 'robe-mode-hook 'robe-ac-setup)
))
