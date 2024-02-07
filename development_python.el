;; https://www.seas.upenn.edu/~chaoliu/2017/09/01/python-programming-in-emacs/

                                        ;============================ code folding ===========================
;; attempt 1
;; not working as expected
;; (use-package vimish-fold
;;   :straight t
;;   :init
;;   )
;;(key-chord-define-global "ft" 'vimish-fold)

;; attempt 2
;https://www.reddit.com/r/emacs/comments/dfxe1u/codefolding_based_off_indent_level/ 
;; (defun fold-level-2 ()
;;     (interactive)
;;     (set-selective-display (* 2 tab-width)))

;; attempt 3
;https://github.com/celwell/.emacs.d/blob/3346eb9f2104c6fb1fb64008b18a533d7cb7c5f8/init.el#L312 via
;https://www.reddit.com/r/emacs/comments/dfxe1u/comment/f36jmgf/?utm_source=share&utm_medium=web2x&context=3

(defun set-selective-display-dlw (&optional level)
"Fold text indented same of more than the cursor.
If level is set, set the indent level to LEVEL.
If 'selective-display' is already set to LEVEL, clicking
F5 again will unset 'selective-display' by setting it to 0."
  (interactive "P")
  (if (eq selective-display (1+ (current-column)))
      (set-selective-display 0)
    (set-selective-display (or level (1+ (current-column))))))

(key-chord-define-global "qp" 'set-selective-display-dlw)

(defun sg-toggle-fold ()
  
  "Toggle code folding according to indentation of current line."
  
  (interactive)
  
  (set-selective-display
   
   (if selective-display
       
       nil
     
     (save-excursion
       
       (back-to-indentation)
       
       (1+ (current-column))))))


;;attempt 4

;;https://rodogi.github.io/post/python-fold/
;; Fold code-blocks in python
(defun fold-python-blocks ()
  "Fold all code blocks in python"
  (interactive)
  (forward-word) ; start with the second word
  (setq p (point))
  (while (forward-word)
    (backward-word)
    (setq col (current-column))
    (forward-word)
    (if (= col 0)
	(progn
	  (setq p1 (car (bounds-of-thing-at-point 'word)))
	  (vimish-fold p p1)
	  (setq p p1)
	  (goto-char p)
	  (forward-word))))
  (vimish-fold p (buffer-size))
  (goto-char 1))

;;attempt 5  finally hs-mode

(defun my-python-mode-hook ()
 ;;  (vimish-fold-mode)
  (hs-minor-mode)
  
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)
(key-chord-define-global "hb" 'hs-hide-block)
(key-chord-define-global "ha" 'hs-hide-all)
(key-chord-define-global "hl" 'hs-hide-level)

(key-chord-define-global "sb" 'hs-show-block)
(key-chord-define-global "sa" 'hs-show-all)
(key-chord-define-global "sl" 'hs-show-level)

;; attempt 6: has bugs but lets try again
(use-package origami
  :straight t
  :init
  )
(global-origami-mode t)
(key-chord-define-global "ft" 'origami-recursively-toggle-node)
(key-chord-define-global "fn" 'origami-show-only-node)

(defun unfold-everything ()
    (interactive)
    (origami-open-all-nodes (current-buffer))
    (set-selective-display nil))



;================================ end ================================

;============================ importmagic ============================
;; turn off; its using CPU crazily. 
;; (use-package importmagic
;;   :straight   (:host github :repo "anachronic/importmagic.el")
;;   :init
;;   :config
;;   (add-hook 'python-mode-hook 'importmagic-mode)
;;   )
;; (add-hook 'python-mode-hook 'importmagic-mode)

;‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗ end ‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗


;=============================== ggtags ==============================

;;https://askubuntu.com/questions/839852/emacs-c-ide-gnu-global-helm-gtags
;; ggtags-create-tags -- python hook
;; https://github.com/leoliu/ggtags#install-global-and-plugins
;;https://blade6570.github.io/soumyatripathy/blog_gnuglobal/gnu_global.html
;;https://www.zhstar.win/2018/12/03/emacs-cpp-ide/
;; https://mostlymaths.net/2019/05/gtags-gnu-global-in-emacs-for-scala.html/
;; https://sriramkswamy.github.io/dotemacs/
;; Can't get it to work; global not working correctly
;; TODO: not sure if this will work
;;https://blade6570.github.io/soumyatripathy/blog_gnuglobal/gnu_global.html
(use-package gtags
  :straight t
  :init
  )

(use-package ggtags
  :straight t
  :init 
  )

;; exuberant-gtags is no longer maintained
;; (add-hook 'python-mode-hook 'gtags-mode)

;; (dolist (map (list ggtags-mode-map))
;;   (define-key map (kbd "C-c g s") 'ggtags-find-other-symbol)
;;   (define-key map (kbd "C-c g h") 'ggtags-view-tag-history)
;;   (define-key map (kbd "C-c g r") 'ggtags-find-reference)
;;   (define-key map (kbd "C-c g f") 'ggtags-find-file)
;;   (define-key map (kbd "C-c g c") 'ggtags-create-tags)
;;   (define-key map (kbd "C-c g u") 'ggtags-update-tags)
;;  ;; (define-key map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;   (define-key map (kbd "M-.") 'ggtags-find-tag-dwim)
;;   (define-key map (kbd "M-,") 'pop-tag-mark)
;;   (define-key map (kbd "C-c <") 'ggtags-prev-mark)
;;   (define-key map (kbd "C-c >") 'ggtags-next-mark))

;================================ end ================================


					;============================== flycheck =============================
;; flycheck not working <-- resorting to elpy

;; nothing is working : http://zyxue.github.io/2016/03/28/flakes-in-emacs-and-python.html
;; using standalone flycheck instead from elpy's bundled flycheck
;; many utils in elpy are too resource intensive for raspi
;; requires: pip install flake8 pylint pyright mypy autoflake

;; (use-package flycheck
;;   :straight t
;;   :init
;;   ;; note that these bindings are optional
;;   (global-set-key (kbd "C-c n") 'flycheck-next-error)
;;   ;; this might override a default binding for running a python process,
;;   ;; see comments below this answer
;;   (global-set-key (kbd "C-c p") 'flycheck-prev-error)
;;   )
;; add-hook 'after-init-hook 'global-flycheck-mode)


;‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗ end ‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗

;; https://stackoverflow.com/questions/42486695/python-type-hinting-in-emacs/62543783#62543783
;; flycheck-pycheckers
;; Allows multiple syntax checkers to run in parallel on Python code
;; Ideal use-case: pyflakes for syntax combined with mypy for typing
 ;; CPU usage too high 
;; (use-package flycheck-pycheckers
;;   :straight t
;;   :after flycheck
;;   :init
;;   (with-eval-after-load 'flycheck
;;     (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
;;     )
;;   (setq flycheck-pycheckers-checkers
;;     '(
;;       ;; mypy3
;;       pyflakes
;;       )
;;     )
;;   )




;================================ jedi ===============================
;;for jedi outside of elpy
;;https://cestlaz.github.io/posts/using-emacs-12-python/
;; (use-package jedi
;; :ensure t
;; :init
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'jedi:ac-setup))

;; The last hook sets up the autocomplete.

;; For jedi to work, you'll need to install the jedi server which is done in emacs by running M-x jedi:install-server. For
;; that to work, though, you'll need to have Python Virtualenv istalled. I did that with:

;; EDIT: I just got a report that you might need to also install epc (sudo pip install epc).

;; sudo pip install virtualenv

;================================ end ================================


;; (use-package elpy
;;     :straight t
;;     :bind
;;     (:map elpy-mode-map
;;           ("C-M-n" . elpy-nav-forward-block)
;;           ("C-M-p" . elpy-nav-backward-block))
;;     ;; CPU usage too high
;;     :hook (
;;            (elpy-mode . flycheck-mode)
;;     ;;        (elpy-mode . (lambda ()
;;     ;;                       (set (make-local-variable 'company-backends)
;; 	   ;;                            '((elpy-company-backend :with company-yasnippet)))))
;; 	   )
;;     :init
;;     (elpy-enable)
;;     :config
;;     ;;(add-hook 'elpy-mode-hook 'poetry-tracking-mode) ;; optional if you're using Poetry
;;     (setq elpy-syntax-check-command "pyflakes") ;; or replace with the path to your pyflakes binary
;;     ;; ;; use flycheck instead of flymake
;;     ;; (when (load "flycheck" t t)
;;     ;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     ;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
;;     ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     ; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
;;     ;; (setq elpy-shell-echo-output nil)
;;     ;; (setq elpy-rpc-python-command "python3.11")
;;     ;; (setq elpy-rpc-timeout 2)
;;     )


;; (use-package python
;;   :mode ("\\.py\\'" . python-mode)
;;   :interpreter ("python" . python-mode)
;;   :config
;;   (add-hook 'python-mode-hook
;; 	    (defun hooks()
;; 	      (smartparens-mode 1)
;;               (rainbow-delimiters-mode 1)
;; 	      (company-mode 1)
;;               (yas-minor-mode 1)
;; 	      (highlight-indent-guides-mode 1)
;;               (anaconda-mode 1)))

;;   (require 'flycheck-pyflakes)
;;   (add-hook 'python-mode-hook 'flycheck-mode)
;;   (add-to-list 'flycheck-disabled-checkers 'python-flake8)
;;   (add-to-list 'flycheck-disabled-checkers 'python-pylint)

;;   (setq warning-suppress-types '((python)
;;                                  (emacs)))
  
;;   (use-package anaconda-mode
;;     :ensure t
;;     :bind ("C-c C-d" . anaconda-mode-show-doc)
;;     :config
;;     (setq python-shell-interpreter "ipython"))

;;   (use-package company-anaconda
;;     :ensure t
;;     :init
;;     (eval-after-load "company"
;;       '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

;;   (use-package highlight-indent-guides
;;     :ensure t
;;     :config
;;     (setq highlight-indent-guides-method 'character)))

;(use-package flycheck-pyflakes
;  :straight t
;  :init
;  :mode "\\.py"
;  )
;(require 'flycheck-pyflakes)
(use-package flycheck
  :straight t
  :init
  :bind  
  (("M-n" . flycheck-next-error)  
   ("M-p" . flycheck-previous-error))  
  )  
(add-hook 'after-init-hook 'global-flycheck-mode)

;================================ end ================================


;========================= autopep formatting ========================

(use-package py-autopep8
 :straight t
 :init
 )
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;================================ end ================================


;======================== run python programs ========================
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i")
;================================ end ================================

;============================= dumb-jump =============================
(use-package dumb-jump
 :straight t
 :init
 )
;; use M-.
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Xref can be customized to use completing-read to select a target. That way a completion framework of your
;; choice (Icomplete, Helm, Ivy, ...) will be used instead of the default pop-up buffer. To do this, evaluate
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
;; put .dumbjump in your project root

;; If you want to stop a directory from registering as the project root (and have Dumb Jump keep looking) add an
;; empty .dumbjumpignore file in that directory.
