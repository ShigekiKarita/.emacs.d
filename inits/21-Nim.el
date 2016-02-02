(add-to-list 'company-backends 'company-nim)
(custom-set-variables
 '(nim-nimsuggest-path "~/.nimble/bin/nimsuggest"))

(add-to-list 'auto-indent-multiple-indent-modes 'nim-mode)
(add-hook 'nim-mode-hook 'company-mode)
(add-hook 'nim-mode-hook 'auto-indent-mode)

(require 'smart-compile)
(setq smart-compile-alist
      (append smart-compile-alist '(("\\.nim\\'" . "nim c -r --verbosity:0 %f"))))

(require 'flycheck-nim)
