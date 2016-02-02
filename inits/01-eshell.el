;; ======
;; Eshell
;; ======

(defun eshell-mode-hook-func ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))))
(eshell-mode-hook-func)
