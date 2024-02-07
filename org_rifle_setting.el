;; from https://github.com/alphapapa/org-rifle
(use-package helm-org-rifle
  :straight t
  :init
  )

;; Usage
(key-chord-define-global "kb" 'helm-org-rifle-org-directory)
