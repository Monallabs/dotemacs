;; https://emacsredux.com/blog/2021/04/19/configuring-minibuffer-completion-in-projectile/
;; https://docs.projectile.mx/projectile/usage.html
(use-package projectile
  :straight t
  :init
  )

(use-package counsel-projectile
  :straight t
  :init
  (counsel-projectile-mode
   )
  )
;; https://docs.projectile.mx/projectile/configuration.html
(projectile-global-mode)
;;(setq projectile-known-projects-file "~/.projectile.projects")
(setq projectile-globally-ignored-file-suffixes '("pyc" "~"))
(setq projectile-enable-caching t)
(setq projectile-sort-order 'recently-active)
(setq projectile-completion-system 'ido)
(key-chord-define-global "pf" 'projectile-find-file-in-known-projects)
;; use projectile-find-file manually
;(key-chord-define-global "pf" 'projectile-find-file)

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
