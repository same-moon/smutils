(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control meta s)] 'isearch-forward)
(global-set-key [(control meta r)] 'isearch-backward)
(global-set-key [(meta \%)] 'query-replace-regexp)
(global-set-key [(control tab)] 'yic-next-buffer)
(global-set-key [(control shift tab)] 'yic-prev-buffer)
(global-set-key [(control shift iso-lefttab)] 'yic-prev-buffer)
(global-set-key [(control up)] 'make-frame)
(global-set-key [(control down)] 'my-delete-frame-if-not-sole)
(global-set-key [(control x) (?5) (?5)] 'my-split-window-fork)

(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-x 4 z") 'my-shell-other-window)
(global-set-key [(meta f4)] 'my-intelligent-close)
(global-set-key (kbd "C-x C-c") 'my-intelligent-close)
(global-set-key (kbd "<f7>") 'delete-other-windows)

(global-set-key (kbd "<C-return>") 'line-clone)
(require 'org)
(define-key org-mode-map (kbd "<C-return>") 'line-clone)
(global-set-key (kbd "<C-S-return>") 'line-clone-with-delta)
(global-set-key (kbd "C-S-P") 'line-move-up)
(global-set-key (kbd "C-S-N") 'line-move-down)
(global-set-key [(control c) (s)] 'my-visit-scratch)
(global-set-key [(control c) (r)] 'my-rename-file)
(global-set-key [(control c) (i)] 'indent-region)
(global-set-key [(control c) (a)] 'align)
(global-set-key [(control c) (o)] 'occur)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)
(global-set-key (kbd "<S-tab>") 'comint-dynamic-complete-filename)
(global-set-key (kbd "C-x v -") 'ediff-revision)
(global-set-key (kbd "C-x v t") 'tkdiff-revision)
(global-set-key [(f7)] 'delete-other-windows)
(global-set-key [(f9)] 'compile)
(global-set-key [(shift f9)] 'my-toggle-compile-popup)


;;; ABBREVIATION SECTION
;; abbreviation mode
(setq-default abbrev-mode t)
(define-abbrev global-abbrev-table "teh" "the" nil)
(define-abbrev global-abbrev-table "hte" "the" nil)
(define-abbrev global-abbrev-table "taht" "that" nil)
(setq save-abbrevs nil)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file abbrev-file-name))

;; COMPILE section

(require 'compile)

;;make -k isn't what I want
(setq-default compile-command "make")
(make-variable-buffer-local 'compile-command)

(defvar my-cleanup-compilation-window-flag t
  "Whether to close the compilation window after a successful compile.")

(defun my-toggle-compile-cleanup-compilation-window ()
  (interactive)
  "Toggle whether to close the compilation window after a successful compile."
  (setq my-cleanup-compilation-window-flag
	(not my-cleanup-compilation-window-flag))
  (message "set my-cleanup-compilation-window-flag to %s"
	   my-cleanup-compilation-window-flag))

(defun my-toggle-compile-read-command ()
  "toggle whether you read the compile-command from message area or not"
  (interactive)
  (setq compilation-read-command
	(not compilation-read-command))
  (message "set compilation-read-command to %s" compilation-read-command))

(defun my-toggle-compile-popup ()
  "toggle whether the *compilation* buffer gets its own frame"
  (interactive)
  (if (member "*compilation*" special-display-buffer-names)
      (progn
	(setq special-display-buffer-names
	      (delq nil
		    (mapcar
		     (lambda (x)
		       (if (equal "*compilation*" x) nil x))
		     special-display-buffer-names)))
	(message "*compilation* buffer WON'T pop up"))
    (setq special-display-buffer-names
	  (cons "*compilation*" special-display-buffer-names))
    (message "*compilation* buffer WILL pop up")))

(setq compilation-read-command t) ;;be prompted for compile command
(setq compilation-scroll-output t)
(setq compilation-window-height 8)

(setq compilation-finish-function
      (lambda (buf str)

	(if (string-match "exited abnormally" str)

	    ;;there were errors
	    (message "compilation errors, press C-x ` to visit")

	  ;;no errors, possibly make the compilation window go away
	  (if my-cleanup-compilation-window-flag
	      (run-at-time 0.5 nil 'delete-windows-on buf))
	  (message "NO COMPILATION ERRORS!"))))

;; SHELL section
(require 'shell)
(define-key shell-mode-map [(meta .)] 'comint-insert-previous-argument)

;; MISC section
(setq bookmark-save-flag 1)

(defun my-rename-file (new-fn)
  (interactive "sNew Filename: ")
  (let* ((old-fn (buffer-file-name))
	 (old-dir (file-name-directory old-fn)))
    (rename-file old-fn new-fn nil)
    (find-alternate-file
     (concat (file-name-as-directory old-dir) new-fn))))

;;show ascii table
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder."
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (<= i 255)      
      (insert (format "%4d %c\n" i i))
      (setq i (+ i 1))))
  (beginning-of-buffer))

;;insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))

;; When you scroll down with the cursor, emacs will move down the
;; buffer one line at a time, instead of in larger amounts.  the
;; following statement(s) should fix annoying scroll-jump problem.
;; Never reposition point to center of frame.
(setq scroll-conservatively 10000)

;;be able to call erase-buffer without getting bugged
(put 'erase-buffer 'disabled nil)

;;turn on narrowing without confirmation
(put 'narrow-to-region 'disabled nil)

;;require newline at end of file
(setq require-final-newline nil)

;;show more info in taskbar/icon than just "Emacs"
(setq-default frame-title-format
	      `(,(format "Emacs/%%m <%s@%s>  %%b" user-login-name system-name)))
(setq-default icon-title-format frame-title-format)

;;show paren, brace, and curly brace "partners" at all times
(show-paren-mode t)

;;show column number in status bar
(column-number-mode t)

(global-font-lock-mode 1)

(let ((my-backup-dir (expand-file-name "~/.backups")))
  (when (not (file-exists-p my-backup-dir))
    (make-directory my-backup-dir t))
  (setq backup-directory-alist `(("." . ,my-backup-dir)))
  (setq version-control 'never)
  ;;see if this fixes TRAMP permission problems
  (setq backup-by-copying t))

;;I've seen the gnu startup message enough times
(setq inhibit-startup-message t)

;;specify size of *Messages* buffer
(setq message-log-max 100000)

(setq enable-recursive-minibuffers t)

(require 'man)
(setq Man-notify-method 'pushy) ;focus the new man window

(require 'info)
(define-key Info-mode-map [(n)] 'next-line)
(define-key Info-mode-map [(p)] 'previous-line)
(define-key Info-mode-map [(N)] 'Info-next)
(define-key Info-mode-map [(P)] 'Info-prev)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'edebug) ;;to do C-u C-M-x instead of M-x edebug-defun

(require 'iswitchb)
(iswitchb-mode 1)
(setq iswitchb-default-method 'samewindow)

(setq isearch-lazy-highlight nil)
(blink-cursor-mode -1)
(auto-image-file-mode 1)
(setq cursor-in-non-selected-windows nil)
(tool-bar-mode -1)

(require 'saveplace)
(setq-default save-place t)

;;don't print ellipsis summary (...) so quickly
(setq eval-expression-print-level 9999
      eval-expression-print-length 9999)


;; don't make fill-region turn ":  " into ": "
(setq colon-double-space t)

;;borrowed totally from bbdb.
(defsubst my-string-trim (string)
  "Lose leading and trailing whitespace.  Also remove all properties
from string."
  (if (string-match "\\`[ \t\n]+" string)
      (setq string (substring string (match-end 0))))
  (if (string-match "[ \t\n]+\\'" string)
      (setq string (substring string 0 (match-beginning 0))))
  (set-text-properties 0 (length string) nil string)
  string)


(setq vc-cvs-stay-local nil)

(require 'dired-x)

;; *If non-nil, dired tries to guess a default target directory.
;; This means: if there is a dired buffer displayed in the next window,
;; use its current subdir, instead of the current subdir of this dired buffer.
(setq dired-dwim-target t)

(setq dired-recursive-deletes nil) ;;this has bitten me.  leave it nil!
(setq dired-recursive-copies 'always)

(defun mouse-window ()
  (let* ((mouse-position (mouse-position))
	 (frame (car mouse-position))
	 (coordinates (cdr mouse-position))
	 (x-pos (car coordinates))
	 (y-pos (cdr coordinates)))
    (window-at x-pos y-pos frame)))
(define-key dired-mode-map (kbd "<mouse-2>")
  (lambda ()
    (interactive)
    (select-window (mouse-window))
    (dired-find-file)))

(recentf-mode 1)

(require 'ffap)
(ffap-bindings)
(global-set-key (kbd "C-x C-v") 'find-alternate-file)

(defun my-shell-other-window ()
  "start or visit a shell in the other window"
  (interactive)
  (let* ((winlist nil))
    (walk-windows
     (lambda (w)
       (setq winlist (cons w winlist)))
     'no-mini 'visible-only)
    (if (= (length winlist) 1)
	(split-window))
    (other-window 1)
    (shell)))

(defun line-clone (&optional arg)
  (interactive "p")
  (or arg (setq arg 1))
  (let ((col (current-column))
	(txt (buffer-substring (line-beginning-position)
			       (line-end-position))))
    (while (> arg 0)
      (goto-char (line-end-position))
      (newline)
      (insert txt)
      (setq arg (1- arg)))
    (move-to-column col)))

(defun line-clone-with-delta (old new)
  (interactive "sold text:\nsnew text: ")
  (or arg (setq arg 1))
  (let ((col (current-column))
	(txt (replace-regexp-in-string 
	      old new
	      (buffer-substring (line-beginning-position)
				(line-end-position)))))
    (goto-char (line-end-position))
    (newline)
    (insert txt)
    (move-to-column col)))

(defun line-move-up ()
  (interactive)
  (let ((goal-column (current-column)))
    (transpose-lines 1)
    (next-line -2)))
(defun line-move-down ()
  (interactive)
  (let ((goal-column (current-column)))
    (next-line 1)
    (transpose-lines 1)
    (next-line -1)))

(defun copy-buffer-to-clipboard ()
  (interactive)
  (kill-new (buffer-substring (point-min) (point-max))))

(defun dired-here ()
  (interactive)
  (dired default-director))

(defun revisit-file ()
  (interactive)
  (let ((p (point)))
    (find-alternate-file (buffer-file-name))
    (goto-char p)))

;;This method, when bound to C-x C-c, allows you to close an emacs frame
;;the same way, whether it's the sole window you have open, or whether
;;it's a "child" frame of a "parent" frame.  If you're like me, and use
;;emacs in a windowing environment, you probably have lots of frames
;;open at any given time.  Well, it's a pain to remember to do Ctrl-x 5
;;0 to dispose of a child frame, and to remember to do C-x C-c to close
;;the main frame (and if you're not careful, doing so will take all the
;;child frames away with it).  This is my solution to that: an
;;intelligent close-frame operation that works in all cases (even in an
;;emacs -nw session).
(defun my-intelligent-close (&optional arg)
  "Quit a frame the same way no matter what kind of frame you are on.
If passed a prefix arg, do save-buffers-kill-emacs."
  (interactive "P")
  (if arg
      (save-buffers-kill-emacs)
    ;;try to delete the frame
    (condition-case nil
	(delete-frame (selected-frame))
      ;;if got error "Attempt to delete the sole visible or iconified
      ;;frame" then it's the only frame remaining.  In that case, exit
      ;;emacs.
      (error (save-buffers-kill-emacs)))))

;;delete a frame if it's not the only visible or iconified frame
(defun my-delete-frame-if-not-sole ()
  "delete a frame unless it's the only frame"
  (interactive)
  (if (not (equal (length (visible-frame-list)) 1))
      (delete-frame)))

;;insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%a %b %e, %Y %l:%M %p")))

;; in comint mode, bind M-. like in bash
(require 'comint)
(require 'shell)
(define-key shell-mode-map [(meta .)] 'comint-insert-previous-argument)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defun my-visit-scratch ()
  "visit the scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

(defun tkdiff-revision ()
  (interactive)
  (start-process "tkdiff" nil "tkdiff"
		 (file-name-nondirectory (buffer-file-name))))


;;begin buffer-switching methods, which I bind to Ctrl-TAB and Ctrl-Shift-TAB
;; ----------------------------------------------------------------------
;;     Original yic-buffer.el
;;     From: choo@cs.yale.edu (young-il choo)
;;     Date: 7 Aug 90 23:39:19 GMT
;;
;;     Modified 
;; ----------------------------------------------------------------------

(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to 
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause 
   ;;a duplicate top-level buffer inside two frames.
   (memq str 
	 (let ((bufferls '()))
	   (walk-windows 
	    (lambda (n) 
	      (setq bufferls (cons (buffer-name (window-buffer n)) bufferls)))
	    'no-minibuffers t)
	   bufferls))))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
	 bf bn go)
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))	;skip over
	  (setq go bf)
	(setq ptr (cdr ptr))))
    (if go (switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))
;;end of yic buffer-switching methods

;;msf-abbrev
;; ensure abbrev mode is always on
(setq-default abbrev-mode t)

;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)

;; load up modes I use
(require 'cc-mode)
(require 'perl-mode)
(require 'cperl-mode)
(require 'sh-script)
(require 'shell)
(require 'python)

;; load up abbrevs for these modes
;; (require 'msf-abbrev)
;; (setq msf-abbrev-verbose t) ;; optional
;; (setq msf-abbrev-root "~/emacs/mode-abbrevs")
;; (global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
;; (global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
;; (msf-abbrev-load)

;; PYTHON SECTION
(defun my-python-mode-hook ()
  (setq python-indent-guess-indent-offset t)
  (setq indent-tabs-mode nil)

  ;; annoyances with emacs 24.3
  (setq python-skeleton-autoinsert t)
  (define-abbrev python-mode-skeleton-abbrev-table "def" nil)
  (define-abbrev python-mode-skeleton-abbrev-table "if" nil)
  (define-abbrev python-mode-skeleton-abbrev-table "try" nil)
  (define-abbrev python-mode-skeleton-abbrev-table "while" nil)
  (define-abbrev python-mode-skeleton-abbrev-table "for" nil)
  (define-abbrev python-mode-skeleton-abbrev-table "class" nil))
(add-hook 'python-mode-hook 'my-python-mode-hook)

; backup-each-save.el
;; (require 'backup-each-save)
;; (add-hook 'after-save-hook 'backup-each-save)
;; (defun backup-each-save-filter (filename)
;;   (let ((ignored-filenames
;;     	 '("^/tmp" "semantic.cache$" "\\.emacs-places$"
;;     	   "\\.recentf$" ".newsrc\\(\\.eld\\)?"))
;;     	(matched-ignored-filename nil))
;;     (mapc
;;      (lambda (x)
;;        (when (string-match x filename)
;;     	 (setq matched-ignored-filename t)))
;;      ignored-filenames)
;;     (not matched-ignored-filename)))
;; (setq backup-each-save-filter-function 'backup-each-save-filter)

;; (add-to-list 'load-path "~/emacs/packages/scala-mode2-master")
;; (require 'scala-mode2)
;; 
;; ;; load the ensime lisp code...
;; (add-to-list 'load-path "~/emacs/packages/ensime_2.10.0-0.9.8.5/elisp")
;; (require 'ensime)
;; 
;; ;; This step causes the ensime-mode to be started whenever
;; ;; scala-mode is started for a buffer. You may have to customize this step
;; ;; if you're not using the standard scala mode.
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
