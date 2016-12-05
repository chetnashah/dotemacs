

;; jay's init.el file
;; 21 jan 2016

(load
 "/home/jayshah/.opam/system/share/emacs/site-lisp/tuareg-site-file")


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))

(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
