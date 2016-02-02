;; (eval-after-load 'ats-mode
;;   '(progn

(setenv "PATSHOME" (concat (getenv "HOME") "/tool/ats/postiats"))


;; https://raw.githubusercontent.com/mrd/ats2-mode/master/ats2-mode.el
(require 'ats-mode)
(setq auto-mode-alist
      (append '(("\\.dats$" . ats-mode))
              auto-mode-alist))

(add-hook 'ats-mode-hook
          '(lambda ()
             (require 'smart-compile)
             (setq smart-compile-alist
                   (append smart-compile-alist
                           '(("\\.dats$" .
                              "patscc %f -o %n -DATS_MEMALLOC_LIBC && ./%n"))))
             (with-eval-after-load 'flycheck
               (flycheck-ats2-setup))
             (require 'flycheck)
             (flycheck-mode)))

;; https://raw.githubusercontent.com/drvink/flycheck-ats2/master/flycheck-ats2.el
(require 'ats2-flycheck)
;; ))
