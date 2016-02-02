;;
;; js2-mode
;;
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;
;; web-mode
;;

(setq auto-mode-alist
      (append '(
                ("\\.\\(html\\|xhtml\\|shtml\\|tpl\\)\\'" . web-mode)
                ("\\.php\\'" . php-mode)
                )
              auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'ac-mode 'web-mode)
(add-hook 'web-mode-hook
          '(lambda ()
             (defun web-mode-buffer-refresh ()
               (interactive)
               (web-mode-scan-buffer)
               )
             ))
(setq web-mode-engines-alist
      '(
        ("django" . "\\.html\\'")
        ))

