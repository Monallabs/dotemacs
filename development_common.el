
;============================== banners ==============================
;;https://www.reddit.com/r/emacs/comments/ijmgtx/tip_how_to_use_a_stable_and_fast_environment_to/

;; (use-package line-comment-banner
;;   :straight t
;;   :init
;;   )

;; this should be more general 
(defun py_endbanner()
(interactive)
(insert "‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗ end ‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗")

)

(use-package banner-comment
  :straight t
  :init
  :commands (banner-comment)
  :bind ("C-c h" . banner-comment))
(global-set-key (kbd "C-;") 'banner-comment)

;‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗ end ‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗


(use-package git-emacs
  :straight t
  :init 
  )

					;================ being able to jump to file on python run error ================
;; uses M-x compile command
;;https://stackoverflow.com/questions/27450173/emacs-compile-python-vs-running-in-shell

(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook (lambda () (highlight-regexp "\\[OK\\]" "hi-green-b")))
(add-hook 'shell-mode-hook (lambda () (goto-address-mode )))
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
