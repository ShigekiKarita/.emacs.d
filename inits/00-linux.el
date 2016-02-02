;; Japanese
(set-terminal-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(set-language-environment "UTF-8")
;; (set-language-environment "Japanese")
;; (setq quail-japanese-use-double-n t)

;; ;; (require 'mozc)
;; (load-file "/usr/share/emacs24/site-lisp/emacs-mozc/mozc.elc")
;; (global-set-key (kbd "C-j") 'mozc-mode)
;; (setq default-input-method "japanese-mozc")
;; (setq mozc-candidate-style 'overlay) ;; or echo-area

;; (progn ;toggle input method
;;   (define-key global-map [henkan]
;; 	(lambda ()
;; 	  (interactive)
;; 	  (if current-input-method (inactivate-input-method))
;; 	  (mozc-mode)))
;;   (define-key global-map [muhenkan]
;;     (lambda ()
;;       (interactive)
;;       (inactivate-input-method)))
;;   (define-key global-map [zenkaku-hankaku]
;; 	(lambda ()
;; 	  (interactive)
;; 	  (mozc-mode)))

;;   (defadvice mozc-handle-event (around intercept-keys (event))
;; 	(if (member event (list 'zenkaku-hankaku 'muhenkan))
;; 	    (progn
;; 	      (mozc-clean-up-session)
;; 	      (mozc-mode))
;; 	  (progn
;; 	    ad-do-it)))
;;   (ad-activate 'mozc-handle-event))
