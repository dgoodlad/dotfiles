;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "FuraCode Nerd Font" :size 12))

(def-package! platformio-mode
  :config
  (add-hook 'c++-mode-hook (lambda ()
                             (irony-mode)
                             (irony-eldoc)
                             (platformio-conditionally-enable))))
