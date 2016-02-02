(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)
     (add-hook 'go-mode-hook 'go-eldoc-setup)

     ;; key bindings
     (define-key go-mode-map (kbd "M-.") 'godef-jump)
     (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)

     (require 'smart-compile)
     (setq smart-compile-alist
           (append smart-compile-alist '(("\\.go\\'" . "go run %f"))))
))
