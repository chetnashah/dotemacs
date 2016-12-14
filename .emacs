(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(add-hook 'haskell-mode-hook #'hindent-mode)

(load
 "/home/jayshah/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string
			     "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share
				"/emacs/site-lisp"))

;; make sure first to install ocp-indent and merlin using opam install
(add-to-list 'load-path "/home/jayshah/.opam/system/share/emacs/site-lisp")
(require 'ocp-indent)

;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

;; Load company-mode
(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; add company-ghc as a backend for haskell files
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))


;; prerequisite: install org mode
(setq org-startup-with-inline-images t)
(add-hook 'org-mode-hook 'iimage-mode)

(defun hi-jay ()
  (message "hello jay, .emacs parsed fully"))
