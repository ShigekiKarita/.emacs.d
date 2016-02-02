(setq process-coding-system-alist
       (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
 (autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun scheme-other-window ()
   "Run scheme on other window"
   (interactive)
   (switch-to-buffer-other-window
    (get-buffer-create "*scheme*"))
   (run-scheme scheme-program-name))
 (define-key global-map
   "\C-cS" 'scheme-other-window)
(ac-config-default)

(defvar ac-source-scheme
  '((candidates
     . (lambda ()
         (require 'scheme-complete)
         (all-completions ac-target (car (scheme-current-env))))))
  "Source for scheme keywords.")
(add-hook 'scheme-mode-hook
          '(lambda ()
             (make-local-variable 'ac-sources)
             (setq ac-sources (append ac-sources '(ac-source-scheme)))))




;; (setq quack-default-program "gosh")
;; (require 'quack)
;; (require 'scheme-complete)

;; (autoload 'scheme-smart-complete "scheme-complete" nil t)
;; ;; auto-completeを使っているので不要
;; (eval-after-load
;;  'scheme
;;  '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))

;; (add-hook 'scheme-mode-hook
;;   (lambda ()
;;     (make-local-variable 'eldoc-documentation-function)
;;     (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
;;     (eldoc-mode)))
;; (setq lisp-indent-function 'scheme-smart-indent-function)
