;; need more info on this
;; (use-package auth-source
;;   :straight t
;;   :ensure t
;;   :config
;;   (auth-source-pass-enable)
;;   )
;;https://wilkesley.org/~ian/xah/emacs/emacs_set_default_browser.html
;; (setq browse-url-browser-function 'browse-url-firefox)
;; (setq browse-url-browser-function 'browse-url-chromium) ; google's browser
;; (setq browse-url-browser-function 'eww-browse-url) ; emacs browser

(setq browse-url-browser-function 'eww-browse-url)




;; errors wrong type argument : commandp
;;(use-package sx
;;  :straight t
;;  :init
;;  )

;;(key-chord-define-global "qs" 'my-get-stackoverflow-answers)

(use-package google-this
  :straight t
  :init
  )

(google-this-mode 1)

(key-chord-define-global "qg" 'google-this-search)


(defun eww-new ()
  (interactive)
  (let ((url (read-from-minibuffer "Enter URL or keywords: ")))
    (switch-to-buffer (generate-new-buffer "*eww*"))
    (eww-mode)
    (eww url)))
(key-chord-define-global "wn" 'eww-new)

(key-chord-define-global "wy" 'eww-copy-page-url)


;; save history
(setq eww-history-save-file "~/.emacs.d/eww_history")

;; gold mine: https://protesilaos.com/dotemacs/

;; navigating links in eww
;; use o to navigate to links under eww
(use-package ace-link
  :straight t
  :init
  )

(ace-link-setup-default)

;; toggle images
;; juse use M-I

(when (fboundp 'eww)
  (defun xah-rename-eww-buffer ()
    "Rename `eww-mode' buffer so sites open in new page.
URL `http://xahlee.info/emacs/emacs/emacs_eww_web_browser.html'
Version 2017-11-10"
    (let (($title (plist-get eww-data :title)))
      (when (eq major-mode 'eww-mode )
        (if $title
            (rename-buffer (concat "eww " $title ) t)
          (rename-buffer "eww" t)))))

  (add-hook 'eww-after-render-hook 'xah-rename-eww-buffer))


;; eww and org
;;(require 'org-eww)
(key-chord-define-global "wx" 'org-eww-copy-for-org-mode)


;===================== browse org files using eww ====================
(require 'grip-mode)

(use-package grip-mode
 :ensure t
; :hook ((markdown-mode org-mode) . grip-mode)
 )


;;Make a keybinding: `C-c C-c g'
;(define-key markdown-mode-command-map (kbd "g") #'grip-mode)

;; Or start grip when opening a markdown/org buffer
;;(add-hook 'markdown-mode-hook #'grip-mode)
;;(add-hook 'org-mode-hook #'grip-mode)
;; using chrome browser for now
(setq grip-preview-use-webkit nil)
;(setq grip-url-browser "eww")
(setq grip-url-browser "chromium-browser")
