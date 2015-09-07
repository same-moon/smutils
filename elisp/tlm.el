;;; tlm.el --- top level menu for files and actions

;; Copyright (C) 2015  Free Software Foundation, Inc.

;; Author: Benjamin Rutt

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This package adds top level menu items to your Emacs, one for Files
;; and one for Actions.  Reads from ~/.emacs-tlm which is a JSON
;; encoded data structure representing files and actions.  A sample
;; such file might be:
;;
;; { "ops": [
;;     [ "Dired here", "dired-here" ],
;;     [ "Copy buffer to clipboard", "copy-buffer-to-clipboard" ]
;;   ],
;;   "files": [
;;       "~/.emacs",
;;       "~/.bash_profile"
;;   ] }

;; To use, place the file in your load-path and add the below lines:

;; (require 'tlm)

;; to your ~/.emacs.

;;; Code:

(require 'easymenu)

(let* ((defns (json-read-file "~/.emacs-tlm"))
       (ops (mapcar
	     (lambda (x)
	       `[,(elt x 0) ,(read (elt x 1))])
	     (cdr (assoc 'ops defns))))
       (files (mapcar
	       (lambda (x)
		 (vector
		  x
		  (read (concat
			 "(find-file \""
			 x
			 "\")"))))
	       (cdr (assoc 'files defns)))))
  (message "files are %s" files)
  (easy-menu-define tlm-ops-menu global-map
    "Menu for frequently accessed commands."
    (cons "Ops" ops))
  (easy-menu-define tlm-files-menu global-map
    "Menu for frequently accessed files."
    (cons "Files" files)))

(provide 'tlm)
;;; tlm.el ends here
