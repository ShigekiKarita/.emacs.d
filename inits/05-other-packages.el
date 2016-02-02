;; smex : M-xの補完
(global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; anything
; (require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "C-x M-x") 'anything-M-x)
(setq recentf-max-menu-items 10)        ;; 表示するファイルの数
(setq recentf-max-saved-items 300)       ;; 保存するファイルの数
(setq kill-ring-max 100)                ;; kill-ring で保存される最大値


;; (require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; (custom-set-faces
;;  '(rainbow-delimiters-depth-1-face ((t (:foreground "#AAAAAA"))))
;;  '(rainbow-delimiters-depth-2-face ((t (:foreground "#666666"))))
;;  '(rainbow-delimiters-depth-3-face ((t (:foreground "#B96D49"))))
;;  '(rainbow-delimiters-depth-4-face ((t (:foreground "#9E3174"))))
;;  '(rainbow-delimiters-depth-5-face ((t (:foreground "#4553FF"))))
;;  '(rainbow-delimiters-depth-6-face ((t (:foreground "#4F9C9D"))))
;;  '(rainbow-delimiters-depth-7-face ((t (:foreground "#9B27B2"))))
;;  '(rainbow-delimiters-depth-8-face ((t (:foreground "#2C5513"))))
;;  '(rainbow-delimiters-depth-9-face ((t (:foreground "#77481C"))))
;;  '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
;;  '(show-paren-match ((((class color) (background light)) (:background "#5DDADB")))))


;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)


;; (require 'smartparens-config)
(smartparens-global-mode)
(ad-disable-advice 'delete-backward-char 'before 'sp-delete-pair-advice)
(ad-activate 'delete-backward-char)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'github t)
;; (disable-theme 'github)
;; (load-theme 'atom-dark t)
;; (disable-theme 'atom-dark)
;; (load-theme 'monokai t)
;; (disable-theme 'monokai)
;; flatten mode-line
(set-face-attribute 'mode-line          nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)


(add-hook 'after-init-hook #'global-flycheck-mode)


(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/yasnippet-snippets"))
;; (yas-global-mode t)


;;; mc
(defun mc/edit-lines-or-string-rectangle (s e)
  "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwim)"
  (interactive "r")
  (if (eq (save-excursion (goto-char s) (current-column))
          (save-excursion (goto-char e) (current-column)))
      (call-interactively 'mc/edit-lines)
    (call-interactively 'string-rectangle)))
(global-set-key (kbd "C-x r t") 'mc/edit-lines-or-string-rectangle)

(defun mc/mark-all-dwim-or-mark-sexp (arg)
  "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
  (interactive "p")
  (cl-case arg
    (16 (mc/mark-all-dwim t))
    (4 (mc/mark-all-dwim nil))
    (1 (mark-sexp 1))))
(global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-mark-sexp)


;;; company
;; (require 'company)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(company-quickhelp-mode +1)


(require 'auto-indent-mode)



;;; 表示する情報
;; (setq symon-monitors
;;       ;; 現在時刻も追加！
;;       (cons 'symon-current-time-monitor
;;             (cond ((memq system-type '(gnu/linux cygwin))
;;                    '(symon-linux-memory-monitor
;;                      symon-linux-cpu-monitor
;;                      symon-linux-network-rx-monitor
;;                      symon-linux-network-tx-monitor))
;;                   ((memq system-type '(windows-nt))
;;                    '(symon-windows-memory-monitor
;;                      symon-windows-cpu-monitor
;;                      symon-windows-network-rx-monitor
;;                      symon-windows-network-tx-monitor)))))

;; ;;; グラフの高さ(pixel)
;; (setq symon-sparkline-height 20)
;; ;;; グラフの長さ(pixel)
;; (setq symon-sparkline-width 80)
;; ;;; グラフの位置
;; (setq symon-sparkline-ascent 100)
;; ;;; グラフの太さ
;; (setq symon-sparkline-thickness 2)
;; ;; (symon-display)
;; (symon-mode 1)
