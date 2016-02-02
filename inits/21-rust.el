(eval-after-load
    'rust-mode
  '(progn
     (require 'smart-compile)
(setq smart-compile-alist
      (append smart-compile-alist '(("\\.rs\\'" . "rustc %f && ./n"))))
))

(setq racer-cmd "racer")
(setq racer-rust-src-path "/usr/local/src/rust/src/")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 1)
