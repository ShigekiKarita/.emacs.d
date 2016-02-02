(add-to-list 'load-path "/usr/share/emacs/site-lisp/gnu-small-talk-el")

;; (load-library "/usr/share/emacs/site-lisp/gnu-smalltalk-el/smalltalk-mode.el")
(setq auto-mode-alist
      (append  '(("\\.st\\'" . smalltalk-mode))
               auto-mode-alist))

(autoload 'smalltalk-mode "/usr/share/emacs/site-lisp/gnu-smalltalk-el/smalltalk-mode.elc" "" t)

;; (load-library "/usr/share/emacs/site-lisp/gnu-smalltalk-el/gst-mode.el")
