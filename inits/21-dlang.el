;; =====
;; Dlang
;; =====

;; (eval-after-load 'd-mode
;;  '(progn
(add-to-list 'exec-path (expand-file-name "/usr/bin/dmd"))
; (require 'd-mode)
(setup-flycheck-d-unittest)
(add-hook 'd-mode-hook
          (lambda ()
            (setup-flycheck-d-unittest)
            (c-set-style "stroustrup")
            ;; (c-basic-offset 4)
            (local-set-key  (kbd "C-c C-p") 'flycheck-previous-error)
            (local-set-key  (kbd "C-c C-n") 'flycheck-next-error)))
;; ))
