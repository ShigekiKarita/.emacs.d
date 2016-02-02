;; (eval-after-load 'c++-mode
;;   '(progn
(setq c-default-style "bsd"
      c-basic-offset 4)


(require 'smart-compile)
(setq smart-compile-alist
      (append
       '(("\\.[Cc]+[Pp]*\\'" .
          ;; "g++ %f -o %n -O2 -Wall -Wextra -std=c++1y -I/usr/local/boost/include -L/usr/local/boost/lib && ./%n"))
          "clang++ %f -o %n -O2 -Wall -Wextra -std=c++14 -stdlib=libc++ -lsupc++ && ./%n"))
       smart-compile-alist))


(require 'flycheck)
(flycheck-define-checker c/c++
  "A C/C++ checker using clang."
  :command ("clang++" "-Wall" "-Wextra" "-std=c++14 -stdlib=libc++" source)
  :error-patterns  ((error line-start
                           (file-name) ":" line ":" column ":" " Error: " (message)
                           line-end)
                    (warning line-start
                           (file-name) ":" line ":" column ":" " Warn: " (message)
                           line-end))
  :modes (c-mode c++-mode))



(setq-default c-default-style "bsd"
              c-basic-offset 4)
(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (flycheck-mode t)))
(add-hook 'c++-mode-hook '(lambda () (setq skeleton-pair 1)))
(add-hook 'c++-mode-hook '(lambda () (flycheck-select-checker 'c/c++)))
(add-hook 'c++-mode-hook '(lambda () (setq flycheck-clang-language-standard "c++11")))


(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/elisp/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

(setq auto-mode-alist
      (append '(("\\.ls$" . ld-script-mode))
              auto-mode-alist))

;;))
