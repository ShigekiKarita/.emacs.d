;; ==========
;; 入力支援関係
;; ==========

(setq vc-follow-symlinks nil)
(define-key global-map [M-k] (fixup-whitespace)) ; 文脈に併せて周りの空白削除
(define-key global-map [M-K] (delete-trailing-whitespace)) ; 行末の空白削除

(global-set-key "\C-m" 'newline-and-indent)                ; 改行時にインテンド
(show-paren-mode t)                                        ; 対応する括弧の強調表示
(setq-default c-basic-offset 4                             ; 基本インデント量4
              tab-width 4                                  ; タブ幅4
              indent-tabs-mode nil)                        ; タブでなくスペース

(global-linum-mode t)

;; (set-frame-font "ricty-12") ; for test
(add-to-list 'default-frame-alist '(font . "ricty-12"))

; (cua-mode t)
(setq cua-enable-cua-keys nil) ; デフォルトキーバインドを無効化
(define-key global-map [C-x " "] 'cua-set-rectangle-mark)


(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color (face-attribute 'default :background)) ;;"#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

(add-hook 'markdown-mode-hook
          '(lambda ()
             (set (make-local-variable 'whitespace-action) nil)))
