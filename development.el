;;; general
;;TBD
;; (use-package counsel
;;   :bind
;;   (("M-x" . counsel-M-x)
;;    ("M-y" . counsel-yank-pop)
;;    ("C-c r" . counsel-recentf)
;;    ("C-x C-f" . counsel-find-file)
;;    ("<f1> f" . counsel-describe-function)
;;    ("<f1> v" . counsel-describe-variable)
;;    ("<f1> l" . counsel-load-library)
;;    ("C-h f" . counsel-describe-function)
;;    ("C-h v" . counsel-describe-variable)
;;    ("C-h l" . counsel-load-library)))
;; https://github.com/galsterGH/Emacs-configs/blob/master/setup-editing.el
;;;
;; https://github.com/rememberYou/.emacs.d/blob/master/config.org#python ;;blacken;isort, pyenve, etc

;; (defhydra hydra-projectile (:color blue)
;;   "
;;   ^
;;   ^Projectile^        ^Buffers^           ^Find^              ^Search^
;;   ^──────────^────────^───────^───────────^────^──────────────^──────^────────────
;;   _q_ quit            _b_ list            _d_ directory       _r_ replace
;;   _i_ reset cache     _k_ kill all        _D_ root      p      _R_ regexp replace
;;   ^^                  _S_ save all        _f_ file            _s_ search
;;   ^^                  ^^                  _p_ project         ^^
;;   ^^                  ^^                  ^^                  ^^
;;   "
;;   ("q" nil)
;;   ("b" counsel-projectile-switch-to-buffer)
;;   ("d" counsel-projectile-find-dir)
;;   ("D" projectile-dired)
;;   ("f" counsel-projectile-find-file)
;;   ("i" projectile-invalidate-cache :color red)
;;   ("k" projectile-kill-buffers)
;;   ("p" counsel-projectile-switch-project)
;;   ("r" projectile-replace)
;;   ("R" projectile-replace-regexp)
;;   ("s" counsel-rg)
;;   ("S" projectile-save-project-buffers))
;; https://www.seas.upenn.edu/~chaoliu/2017/09/01/python-programming-in-emacs/

;; https://elpy.readthedocs.io/en/latest/ide.html#profiling  ;; refactoring, profiling, etc
;;;;;;;;;;;;;;;;
;; python ide ;;
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;; stuck on xref ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;https://launchpad.net/global-tags.el
;; (setenv "GTAGSLIBPATH" "G:/msys64/mingw64/include/")
;; (load-file "g:/msys64/home/o/.emacs.d/global-tags.el/global-tags.el")
;; (add-hook 'c-mode-hook #'global-tags-exclusive-backend-mode)
;; (add-hook 'c-mode-hook
;;       (lambda ()
;;         (add-hook 'after-save-hook
;;               #'global-tags-update-database-with-buffer
;;               nil
;;               t)))


;; TBD
;; (use-package ivy-xref
;;   :ensure t
;;   :init
;;   ;; xref initialization is different in Emacs 27 - there are two different
;;   ;; variables which can be set rather than just one
;;   (when (>= emacs-major-version 27)
;;     (setq xref-show-definitions-function #'ivy-xref-show-defs))
;;   ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
;;   ;; commands other than xref-find-definitions (e.g. project-find-regexp)
;;   ;; as well
;;   (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(use-package company
  :straight t
  :init
  )
(use-package company-jedi
  :straight t
  :init
  )
;================== turning it off due to heavy cpu ==================
;========= turning it back on because I really really need it ========


;================================ done ===============================
;(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

;; org-export-latex doesn't like it. 
;;(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

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
;;       mypy3
;;       pyflakes
;;       )
;;     )
;;   )


;(use-package py-autopep8
;  :straight t
;  :init
;  )
;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)


(use-package pyvenv
  :straight t
  :init
  )



;; (use-package elpy
;;     :straight t
;;     :bind
;;     (:map elpy-mode-map
;;           ("C-M-n" . elpy-nav-forward-block)
;;           ("C-M-p" . elpy-nav-backward-block))
;;      ;; CPU usage too high
;;     ;; :hook (
;;     ;;        (elpy-mode . flycheck-mode)
;;     ;;        (elpy-mode . (lambda ()
;;     ;;                       (set (make-local-variable 'company-backends)
;;     ;;                            '((elpy-company-backend :with company-yasnippet))))))
;;     :init
;;     (elpy-enable)
;;     :config
;;     ;;(add-hook 'elpy-mode-hook 'poetry-tracking-mode) ;; optional if you're using Poetry
;;     ;; (setq elpy-syntax-check-command "pyflakes") ;; or replace with the path to your pyflakes binary
;;     ;; ;; use flycheck instead of flymake
;;     ;; (when (load "flycheck" t t)
;;     ;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     ;;   (add-hook 'elpy-mode-hook 'flycheck-mode))
;;     ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     ;; ; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
;;     ;; (setq elpy-shell-echo-output nil)
;;     ;; (setq elpy-rpc-python-command "python3.11")
;;     ;; (setq elpy-rpc-timeout 2)
;;     )


;; (use-package company
;;   :straight t
;;   :diminish company-mode
;;   :init
;;   (global-company-mode)
;;   :config
;;   ;; set default `company-backends'
;;   (setq company-backends
;;         '((company-files          ; files & directory
;;            company-keywords       ; keywords
;;            company-capf)  ; completion-at-point-functions
;;           (company-abbrev company-dabbrev)
;;           ))
;; (use-package company-statistics
;;     :straight t
;;     :init
;;     (company-statistics-mode))
;; (use-package company-web
;;     :straight t)
;; (use-package company-try-hard
;;     :straight t
;;     :bind
;;     (("C-<tab>" . company-try-hard)
;;      :map company-active-map
;;      ("C-<tab>" . company-try-hard)))
;; (use-package company-quickhelp
;;     :straight t
;;     :config
;;     (company-quickhelp-mode))
;; )


 ;; CPU USAGE TOO HIGH
;; (use-package buftra
;;     :straight (:host github :repo "humitos/buftra.el"))
;; (use-package py-pyment
;;     :straight (:host github :repo "humitos/py-cmd-buffer.el")
;;     :config
;;     (setq py-pyment-options '("--output=numpydoc")))
;; ;; (use-package py-isort
;; ;;     :straight (:host github :repo "humitos/py-cmd-buffer.el")
;; ;;     :hook (python-mode . py-isort-enable-on-save)
;; ;;     :config
;; ;;     (setq py-isort-options '("--lines=88" "-m=3" "-tc" "-fgw=0" "-ca")))
;; (use-package py-autoflake
;;     :straight (:host github :repo "humitos/py-cmd-buffer.el")
;;     :hook (python-mode . py-autoflake-enable-on-save)
;;     :config
;;     (setq py-autoflake-options '("--expand-star-imports")))
;; (use-package py-docformatter
;;     :straight (:host github :repo "humitos/py-cmd-buffer.el")
;;     :hook (python-mode . py-docformatter-enable-on-save)
;;     :config
;;     (setq py-docformatter-options '("--wrap-summaries=88" "--pre-summary-newline")))
;; (use-package blacken
;;     :straight t
;;     :hook (python-mode . blacken-mode)
;;     :config
;;     (setq blacken-line-length '88))
;; (use-package python-docstring
;;     :straight t
;;     :hook (python-mode . python-docstring-mode))

 ;; CPU USAGE TOO HIGH
;; (defun company-jedi-setup ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'company-jedi-setup)

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (key-chord-define-global "jd" 'jedi:goto-definition)
;; (setq elpy-rpc-backend "jedi") ;;elpy-jedi integration not working


;;(setq python-python-command "/opt/bin/python3")
;;(setq elpy-rpc-python-command "/opt/bin/python3")
;; use ipython3
;;(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;;(setq python-shell-interpreter "/opt/bin/ipython3"
;;      python-shell-interpreter-args "-i")

(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i")

