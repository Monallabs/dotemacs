;; (straight-use-package '(chatgpt :type git :host github :repo "emacs-openai/chatgpt")
;;                       :init
;;                      )

(use-package openai
    :straight (:host github :repo "emacs-openai/openai")
    :config
    (setq openai-key "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")
    (setq chatgpt-model "gpt-3.5-turbo")
    ;(setq chatgpt-model "gpt-4")
    :init
    )

(use-package chatgpt
    :straight (:host github :repo "emacs-openai/chatgpt")
    :init
    )





