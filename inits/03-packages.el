;; Emacs24標準のパッケージマネージャ
;; 必要なパッケージをインストール
(require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))
(dolist (p '(tabbar
             powerline
             rainbow-delimiters
             auto-complete
             atom-dark-theme
             ;; yasnippet
             anything
             flycheck
             flycheck-haskell
             flycheck-hdevtools
             flycheck-pos-tip
             dash
             s
             f
             llvm-mode
             anzu
             smart-compile
             smartparens
             lispxmp
             ;; clojure
             clojure-mode
             cider
             ac-cider
             ;ac-nrepl
             clojure-cheatsheet
             clojure-snippets
             paredit
             ;; haskell
             haskell-mode
             ghc
             ;; Common Lisp (slimeは本家から直で)
             slime
             popwin
             ac-slime
             ;; D
             d-mode
             flycheck-d-unittest
             ;; ruby
             ruby-electric
             ruby-block
             motion-mode
             rubocop
             inf-ruby
             robe
             ;; js
             js2-mode
             web-mode
             ;; OCaml
             tuareg
             utop
             merlin
             ;; perl
             cperl-mode
             perl-completion
             ;; Rust
             rust-mode
             ;; Go
             go-mode
             go-autocomplete
             go-eldoc
             ;; others
             processing-mode
             exec-path-from-shell
             smex
             monokai-theme
             ;; Python
             jedi
             ;; Nim
             nim-mode
             company
             company-quickhelp
             auto-indent-mode
             ;; misc
             multiple-cursors
             ))
  (when (not (package-installed-p p)) (package-install p)))
