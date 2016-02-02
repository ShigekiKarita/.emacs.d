(autoload 'python "python" nil t)
;; (autoload 'jedi "jedi" "Jedi for python" t)

(add-hook 'python-mode-hook
          '(lambda ()
             ;; python common
             (setq python-python-command "python")
             (setq indent-tabs-mode nil)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)
             ;; ;; jedi
             ;; (setq jedi:setup-keys t)
             ;; (jedi:setup)
             ;; (define-key jedi-mode-map (kbd "M-TAB") 'jedi:complete)
             ;; (setq jedi:complete-on-dot t)
             ;; virtualenv
             (setq jedi:environment-root "v3.4.3")
             (setq jedi:environment-virtualenv
                   (append python-environment-virtualenv
                           '("--python" "python")))
             (jedi:install-server)

             (setq my-python-bin
                   (concat (getenv "HOME") "/.virtualenvs/"
                           jedi:environment-root "/bin/"))
             (setq flycheck-python-pylint-executable
                   (concat my-python-bin "pylint"))
             (setq flycheck-python-flake8-executable
                   (concat my-python-bin "flake8"))
             (flycheck-mode)
             )
          )

;; (eval-after-load "jedi"
;;   '(progn
;;      (setq jedi:server-command
;;            (list python-python-command jedi:server-script))))
