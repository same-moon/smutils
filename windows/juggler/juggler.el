(defvar juggler-last-endpoint-marker nil)
(defvar juggler-start-of-line-context nil)

(defun juggler-make-endpoint-marker ()
  (interactive)
  (setq juggler-last-endpoint-marker (point-marker)))

(defun juggler-goto-endpoint-marker ()
  (interactive)
  (goto-char juggler-last-endpoint-marker)
  (set-marker juggler-last-endpoint-marker nil))

(defun juggler-get-start-of-line-context ()
  (interactive)
  (setq juggler-start-of-line-context (buffer-substring
				       (line-beginning-position)
				       (point))))
(defun juggler-insert-start-of-line-context ()
  (interactive)
  (insert juggler-start-of-line-context))

(provide 'juggler)
