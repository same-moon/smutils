;;File:	    .emacs
;;Author:   Benjamin Rutt
;;Email:    brutt@bloomington.in.us

;;variables for the files ~/emacs/{common,local}.el{,c}
(defvar my-emacs-common-file (expand-file-name "~/emacs/common.el")
  "emacs common file")
(defvar my-emacs-local-file (expand-file-name "~/emacs/local.el")
  "emacs local file")
(defvar my-emacs-root-dir "~/emacs" "root dir for emacs")
(defvar my-emacs-future-dir "~/emacs/elisp"
  "dir containing files to be loaded on demand in the future")
(defvar my-emacs-packages-dir "~/emacs/packages"
  "root dir for elisp package installs (i.e. calc, w3, etc.)")

;;make sure ~/emacs and subordinates are present at the beginning
(mapcar
 (lambda (x)
   (if (not (file-exists-p (expand-file-name x)))
       (make-directory x)))
 (list my-emacs-root-dir my-emacs-future-dir my-emacs-packages-dir))

;;add to load-path
(add-to-list 'load-path my-emacs-future-dir)
  
;;load from common and local files
(mapcar
 (lambda (x)
   (let ((elc-file (concat x "c")))

     ;;get rid of .elc if they exist
     (if (and
	  (file-exists-p elc-file)
	  (string-match "^.*elc$" elc-file))
	 (delete-file elc-file)) ;;don't want compiled files

     ;;load common and local files
     (if (file-exists-p x)
	 (load-file x))))
 (list my-emacs-common-file my-emacs-local-file))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahk-syntax-directory "c:/Program Files (x86)/AutoHotkey/Extras/Editors/Syntax")
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
