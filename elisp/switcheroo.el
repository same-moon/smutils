;;; switcheroo.el --- iswitchb/ido-like switching to buffers, bookmarks and filecache entries

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

;; This package switches using ido-completing-read to one of the
;; following things, in order of priority:
;;
;; 1) an open buffer
;; 2) a bookmark
;; 3) a filecache entry
;;
;; Inspired by iswitchb-fc.el (written by the same author), and
;; the marking of iswitchb.el as obselete in emacs 24.4.

;; To use, place the file in your load-path and add the below lines:

;; (require 'bookmark)
;; (bookmark-maybe-load-default-file)
;; (require 'switcheroo)

;; to your ~/.emacs.  In doing so it will take over the key binding of
;; C-x b.

;; Note:  this package probably only works on GNU Emacs.  Untested on
;; XEmacs, patches accepted.

;;; Code:

(require 'filecache)
(require 'bookmark)

(defun switcheroo ()
  (interactive)
  (let ((choices nil)
	(choices-from-buffers nil)
	(choices-from-bookmarks nil)
	(choices-from-filecache nil)
	(choosename-hash (make-hash-table :test 'equal))
	(canonical-fn-hash (make-hash-table :test 'equal)))
    ;; choices is a list of 3-element lists, as follows:
    ;; (CHOICENAME 'buf/'bookmark/'fc FILENAME).  Note FILENAME
    ;; is nil for bookmarks, as we already have the bookmark API
    ;; to find the file.  choices is actually an alist
    (setq choices-from-buffers
	  (delq nil
		(mapcar
		 (lambda (b)
		   (let* ((bfn (buffer-file-name b))
			  (triplet (list (buffer-name b) 'buf bfn)))
		     (when bfn
		       (puthash bfn triplet canonical-fn-hash))
		     ;; When I need a meaningless value somewhere, I
		     ;; use 'bubba.  I could not tell you why...
		     (puthash (buffer-name b) 'bubba choosename-hash)
		     triplet))
		 (buffer-list))))

    ;; add in all the bookmarks, but don't populate canonical-fn-hash,
    ;; as bookmarks do not get matched by filename, but rather by
    ;; given bookmark name
    (setq choices-from-bookmarks
	  (delq nil
		(mapcar
		 (lambda (x)
		   (let ((bfn (assoc 'filename (cdr x)))
			 (name2use (car x)))
		     (when bfn ;; FIXME:  are there any bookmarks
			       ;; without associated files?
		       (setq bfn (cdr bfn))
		       ;; fixme:  enable this later
		       ;; (when (gethash name2use choosename-hash)
		       (when t
			 (setq name2use (concat name2use " (from bookmark)")))
		       (puthash name2use 'bubba choosename-hash)
		       `(,name2use bookmark nil))))
		 bookmark-alist)))

    ;; add in all the filecache names.  first set to intermediate
    ;; representation, where every entry is of the form
    ;; (CANONICAL-FILENAME DISPLAY-CANONICALLY)
    (setq choices-from-filecache
	  (mapcar
	   (lambda (x)
	     (let ((expanded-names
		    (mapcar
		     (lambda (y)
		       (concat y (car x)))
		     (cdr x)))
		   (canonicalize-displayname nil))
	       (if (> (length expanded-names) 1)
		   (setq canonicalize-displayname t)
		 (mapc
		  (lambda (z)
		    (when (gethash z canonical-fn-hash)
		      (setq canonicalize-displayname t)))
		  expanded-names))
	       (mapcar
		(lambda (a)
		  `(,a ,canonicalize-displayname))
		expanded-names)))
	   file-cache-alist))
    (setq choices-from-filecache
	  (mapcar
	   (lambda (x)
	     (let ((full-file-name (car x))
		   (canonicalize-displayname (cadr x)))
	       (if canonicalize-displayname
		   `(,full-file-name fc ,full-file-name)
		 `(,(file-name-nondirectory full-file-name) fc ,full-file-name))))
	   (apply 'append choices-from-filecache)))

    (setq choices (append (cdr choices-from-buffers) ;; elide current buffer
			  choices-from-bookmarks
			  choices-from-filecache))
	   
    ;; (message (format "choices-from-buffers: %s" choices-from-buffers))
    ;; (message (format "choices-from-bookmarks: %s" choices-from-bookmarks))
    ;; (message (format "choices-from-filecache: %s" choices-from-filecache))
    ;; (message (format "choices: %s" choices))
    ;; (message (format "displayed choices: %s" (mapcar 'cadr choices)))
    ;; (message (format "displayed choices no dupes: %s" (remove-duplicates (mapcar 'cadr choices))))

    (let* ((ans (ido-completing-read "Switch to: " (mapcar 'car choices)))
	   (triplet (assoc ans choices)))
      (cond
       ((eq (cadr triplet) 'buf) (switch-to-buffer ans)) 
       ((eq (cadr triplet) 'bookmark)
	(bookmark-jump (substring (car triplet)
				  0
				  (- 0 (length " (from bookmark)")))))
       ((eq (cadr triplet) 'fc) (find-file (car (cdr (cdr triplet)))))
       (t (error "Internal error in switcheroo"))))))

(global-set-key (kbd "C-x b") 'switcheroo)

(provide 'switcheroo)
;;; switcheroo.el ends here
