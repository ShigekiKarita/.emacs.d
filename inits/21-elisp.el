;; (eval-after-load 'emacs-lisp-mode
;;   '(progn
(require 'lispxmp)

(define-key emacs-lisp-mode-map (kbd "C-c c") 'smart-compile)
(define-key emacs-lisp-mode-map (kbd "<C-return>") 'lispxmp)
;;     ))
