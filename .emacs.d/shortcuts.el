(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-t") 'treemacs)
    (define-key map (kbd "C-c C-t") 'treemacs-select-directory)
    (define-key map (kbd "C-c C-m") 'xterm-mouse-mode)   
    map)
  "my-keys-minor-mode keymap.")
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)
