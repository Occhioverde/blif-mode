;;; blif-mode.el --- Major mode for editing blif files -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2022, Riccardo Sacchetto <rsacchetto@nexxontech.it>

;; Author: Riccardo Sacchetto <rsacchetto@nexxontech.it>
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; Keywords: languages
;; Homepage: https://nexxontech.it

;; This file is not part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify it under the
;; terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
;; more details.

;; You should have received a copy of the GNU General Public License along with this
;; program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Major mode for editing blif files

;;; Code:

(defvar blif-font-lock-keywords)
(setq blif-font-lock-keywords
      (let* (
            (x-keywords '())
            (x-types '())
            (x-constants '("0" "1" "-"))
            (x-events '())
            (x-functions '("\.model" "\.inputs" "\.outputs" "\.names" "\.end" "\.start_kiss" "\.i" "\.o" "\.s" "\.p" "\.r" "\.end_kiss"))

            (x-keywords-regexp (regexp-opt x-keywords))
            (x-types-regexp (regexp-opt x-types))
            (x-constants-regexp (regexp-opt x-constants))
            (x-events-regexp (regexp-opt x-events))
            (x-functions-regexp (regexp-opt x-functions))
            (x-comments-regexp "#.*"))

        `((,x-types-regexp . 'font-lock-type-face)
          (,x-constants-regexp . 'font-lock-constant-face)
          (,x-events-regexp . 'font-lock-builtin-face)
          (,x-functions-regexp . 'font-lock-function-name-face)
          (,x-comments-regexp . 'font-lock-comment-face)
          (,x-keywords-regexp . 'font-lock-keyword-face))))

;;;###autoload
(define-derived-mode blif-mode prog-mode "BLIF"
  (setq font-lock-defaults '((blif-font-lock-keywords))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.blif\\'" . blif-mode))

(provide 'blif-mode)

;;; blif-mode.el ends here
