;;; flycheck-ats2.el --- Flycheck: ATS2 support      -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Mark Laws <mdl@60hz.org>

;; Author: Mark Laws <mdl@60hz.org>
;; URL: http://github.com/drvink/flycheck-ats2
;; Keywords: convenience, tools, languages
;; Version: 1.0
;; Package-Requires: ((emacs "24.1") (flycheck "0.22"))

;; This file is not part of GNU Emacs.

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; This Flycheck extension provides an `ats2' syntax checker.
;;
;; # Setup
;;
;; Add the following to your init file:
;;
;; (with-eval-after-load 'flycheck
;;   (flycheck-ats2-setup))
;;
;; The ATSHOME environment variable may need to be set from within Emacs:
;;
;; (setenv "ATSHOME" "/path/to/ats2")
;;
;; If you use PATSHOME instead of ATSHOME, please set PATSHOME as follows:
;;
;; (setenv "PATSHOME" "/path/to/ats2")

;;; Code:

(require 'flycheck)

(defmacro compiler-msg (type-str)
  @`(
    ;; file name
    bol (file-name)
    ;; offset of error start
    ?: space (1+ num)
    ;; line, column; start of error span
    "(line=" line ?, space "offs=" column ?\)
    ;; offset of error end
    space "--" space (1+ num)
    ;; line, column; end of error span
    "(line=" (1+ num) ?, space "offs=" (1+ num) "):"
    space type-str
    ;; error message; up to three lines long
    (message
     (+? not-newline)
     (or (: ?: ?\n (repeat 2 (: (1+ not-newline) ?\n)))
         ?\n))))

(flycheck-define-checker ats2
  "ATS2 checker using patscc."
  :command ("patscc" "-tcats" source-inplace)
  :error-patterns
  ((error
    ;; file name
    bol (file-name)
    ;; offset of error start
    ?: space (1+ num)
    ;; line, column; start of error span
    "(line=" line ?, space "offs=" column ?\)
    ;; offset of error end
    space "--" space (1+ num)
    ;; line, column; end of error span
    "(line=" (1+ num) ?, space "offs=" (1+ num) "):"
    space "error"
    ;; error message; up to three lines long
    (message
     (+? not-newline)
     (or (: ?: ?\n (repeat 2 (: (1+ not-newline) ?\n)))
         ?\n)))
  (warning
    ;; file name
    bol (file-name)
    ;; offset of error start
    ?: space (1+ num)
    ;; line, column; start of error span
    "(line=" line ?, space "offs=" column ?\)
    ;; offset of error end
    space "--" space (1+ num)
    ;; line, column; end of error span
    "(line=" (1+ num) ?, space "offs=" (1+ num) "):"
    space "warning"
    ;; error message; up to three lines long
    (message
     (+? not-newline)
     (or (: ?: ?\n (repeat 2 (: (1+ not-newline) ?\n)))
         ?\n))))
  :modes ats-mode)

;;;###autoload
(defun flycheck-ats2-setup ()
  "Set up Flycheck ATS2.

Add `ats2' to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'ats2))

(provide 'ats2-flycheck)
;;; flycheck-ats2.el ends here
