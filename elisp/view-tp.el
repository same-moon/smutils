;;; view-tp.el --- view text properties under point in a separate frame

;; Copyright (C) 2004,2005 Free Software Foundation, Inc.

;; Author: Benjamin Rutt <br...@bloomington.in.us>
;; Version: 1.0

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

;; Simple minor mode to look at text properties under point; useful
;; for debugging packages which use text properties/overlays.  To use,
;; put in your load path, (require 'view-tp), and issue M-x
;; view-tp-mode RET to toggle on or off.

(defvar view-tp-mode-timer nil)
(defvar view-tp-mode-buffer-name "*view-tp*")
;; (setq special-display-buffer-names nil)
(when (eq 'system-type 'gnu/linux)
  (add-to-list 'special-display-buffer-names
	       `(,view-tp-mode-buffer-name (width . 34) (font . "fixed"))))
(easy-mmode-define-minor-mode
 view-tp-mode
 "Minor mode to view attributes about char at point in a separate frame."
 :lighter " Viewtp" :global t
 (if view-tp-mode
     (progn
       (display-buffer (get-buffer-create view-tp-mode-buffer-name))
       (set-buffer (get-buffer-create view-tp-mode-buffer-name))
       (setq truncate-lines t)
       (setq view-tp-mode-timer
	     (run-with-idle-timer 0.05 t 'view-tp-update)))
   (cancel-timer view-tp-mode-timer)
   (delete-windows-on view-tp-mode-buffer-name)
   (kill-buffer view-tp-mode-buffer-name)))
(defun view-tp-update ()
  (interactive)
  (let ((txt nil)
	(pt nil)
	(b (get-buffer-create view-tp-mode-buffer-name))
	(currb (current-buffer)))
    (when (not (eq currb b))
      (set-buffer b)
      (setq buffer-read-only nil)
      (erase-buffer)
      (set-buffer currb)
      (setq pt (point))
      (set-buffer b)
      (insert (format "Point: %d\n" pt))
      (set-buffer currb)
      (describe-text-properties (point) b)
      (set-buffer b)
      (setq buffer-read-only t))))
(provide 'view-tp)
