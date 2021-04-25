;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Eid Alkhaldi"
      user-mail-address "eid.alkhaldi@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; LaTex Configurations;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; org settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Latex ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq user-full-name "Eid Alkhaldi")
  (require 'ox)
  (require 'ox-latex)

  (setq org-latex-pdf-process '("%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "latex -interaction nonstopmode -output-directory %o %f" ))
  (setq org-latex-create-formula-image-program 'dvipng)


  (with-eval-after-load 'org
    (org-babel-do-load-languages 'org-babel-load-languages '((latex . t)
                                                             (plantuml . t)
                                                             ))
    (add-to-list 'org-latex-classes
                 '("apa6"
                   "\\documentclass{apa6}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    (add-to-list 'org-latex-classes
                 '("IEEEtran"
                   "\\documentclass[transmag]{IEEEtran}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("thesis"
                   "\\documentclass[12pt]{uthesis-v12}"
                   ("\\section{%s}" . "\\section*{%s}")))

    (setq org-latex-pdf-process
          '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;End of  Latex ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; Note Taking  ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; End of Note Taking  ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;; LOAD FILES ;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (load-file "~/repos/helm-fzf/helm-fzf.el")

  (add-to-list 'load-path "~/repos/org-reveal/")
  (add-to-list 'load-path "~/repos/org-gantt/")

  (setq org-reveal-root "file:///home/alkhaldieid/repos/reveal.js")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;END OF LOAD FILES ;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;; Python configs;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -i")
  ;; (exec-path-from-shell-initialize)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;END OF Python configs;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; NOTE TAKING CONFIGS ;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq
   dropbox_dir (concat (getenv "HOME") "/Dropbox")
   org_notes (concat dropbox_dir "/org/roam/")
   zot_bib (concat dropbox_dir "/mend/library.bib")
   org-directory org_notes
   deft-directory org_notes
   org-roam-directory org_notes
   agenda_dir (concat dropbox_dir "/org/agenda"))
  (with-eval-after-load 'org
    (setq
     bibtex-completion-notes-path org_notes
     bibtex-completion-bibliography zot_bib
     bibtex-completion-pdf-field "file"
     bibtex-completion-notes-template-multiple-files
     (concat
      "#+TITLE: ${title}\n"
      "#+ROAM_KEY: cite:${=key=}\n"
      "* TODO Notes\n"
      ":PROPERTIES:\n"
      ":Custom_ID: ${=key=}\n"
      ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
      ":AUTHOR: ${author-abbrev}\n"
      ":JOURNAL: ${journaltitle}\n"
      ":DATE: ${date}\n"
      ":YEAR: ${year}\n"
      ":DOI: ${doi}\n"
      ":URL: ${url}\n"
      ":END:\n\n"
      "* Why am I reading this article?\n"
      "* Problem Definition\n"
      "* Proposed Method\n"
      "* Dataset used\n")))

;;;;;;;;;;;; ORG NOTER ;;;;;;;;;;;;;;;;;;;;;;;;;

  (with-eval-after-load 'org
    (setq
     org-ref-completion-library 'org-ref-ivy-cite
     org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename
     org-ref-default-bibliography (list zot_bib)
     org-ref-bibliography-files (list zot_bib)
     org-ref-bibliography-notes (concat org_notes  "bibnotes.org")
     org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
     org-ref-notes-directory org_notes
     org-ref-notes-function 'orb-edit-notes
     org-noter-default-notes-file-name '(concat dropbox_dir "/notes.org")
     org-noter-default-search-path  '(concat dropbox_dir "/mend")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; LaTex Configurations;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-full-name "Eid Alkhaldi")
(require 'ox)
(require 'ox-latex)
(setq org-latex-create-formula-image-program 'dvipng)


(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((latex . t)
                                                           (plantuml . t)
                                                           ))

  (setq org-latex-pdf-process
        '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f")))

(add-to-list 'org-latex-classes
             '("apa6"
               "\\documentclass{apa6}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("IEEEtran"
               "\\documentclass[transmag]{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass[12pt]{uthesis-v12}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ))

(add-to-list 'org-latex-classes
             '("utoledo12"
               "\\documentclass[12pt]{uthesis-v12}"
               [NO-DEFAULT-PACKAGES]
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(unless (assoc "beamer" org-latex-classes)
  (add-to-list 'org-latex-classes
               '("beamer"
                 "\\documentclass[presentation]{beamer}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
  ;; org settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Latex ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;g

  ;; (org-babel-load-file "~/repos/shared/latex_congigs.org")
  ;; (setq org-latex-pdf-process '("%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "latex -interaction nonstopmode -output-directory %o %f" ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;End of  Latex ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;; mu4e ;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Set up some common mu4e variables
  (setq mu4e-maildir "~/.local/share/mail/eagmail"
        mu4e-trash-folder "/[Gmail].Trash"
        user-mail-address "eid.alkhaldi@gmail.com"
        mu4e-refile-folder "/refile"
        mu4e-sent-folder "/[Gmail].Sent Mail"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

  (global-company-mode)
  (menu-bar-mode -1)
  (global-visual-line-mode t)
  ;;(add-to-list 'deft-extensions "tex")
   ;;; enables the live-preview of compiled pdfs
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (org-babel-do-load-languages 'org-babel-load-languages '((python . t)))
  (org-babel-do-load-languages 'org-babel-load-languages '((ipython . t)))
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t)))

      ;;; set up zathura with auctex

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;; ODT stuff ;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (eval-after-load "org" '(require 'ox-odt nil t))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;; END of ODT stuff ;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; My functions ;;;;;;;;;;;;;;;;;;
  (defun my-org-screenshot ()
    "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
    (interactive)
    (setq filename
          (concat
           (make-temp-name
            (concat (buffer-file-name)
                    "_"
                    (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
    (call-process "import" nil nil nil filename)
    (insert (concat "[[" filename "]]"))
    (org-display-inline-images))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;; open with configs;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "evince" (file))
                                ("\\.mp4\\'" "mpv" (file))
                                ("\\.mkv\\'" "mpv" (file))
                                ("\\.webm\\'" "mpv" (file))
                                ))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;; Organizational stuff ;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (setq browse-url-browser-function 'eww-browse-url)

  (setq browse-url-browser-function  'browse-url-default-browser)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;; 1. agenda setup ;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING" "TBC(b)"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("TBC" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("email" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))
  (setq org-use-fast-todo-selection t)

  ;; capturing templates
  (setq org-capture-templates
        '(("n" "New Idea" entry (file "~/Dropbox/org/agenda/newpaperideas.org")
           "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
          ("f" "Fancy" entry (file "~/Dropbox/org/roam/20201017010543-fancy.org")
           "* %? :fancy: \n%t" :clock-in nil :clock-resume nil)
          ("p" "research" entry (file "~/Dropbox/org/agenda/research.org")
           "* %? :research:todo: \n%t" :clock-in nil :clock-resume nil)
          ("a" "alias" plain (file "~/.config/aliasrc")
           "alias %i %? \n" )
          ("c" "coding goal" entry (file "~/Dropbox/org/agenda/coding.org")
           "* %? :goal: \n%t" :clock-in nil :clock-resume nil)
          ("t" "TODO item" entry (file+headline "~/Dropbox/org/agenda/TODOs.org" "Tasks")
           "* TODO%? \n")
          ;; ("t" "TODO item" entry (file "~/Dropbox/org/agenda/TODOs.org")
          ;;  "** TODO%? :goal: \n%t" :clock-in nil :clock-resume nil)
          ("r" "to be refiled" entry (file "~/Dropbox/org/agenda/refile.org")
           "* %? :misc: \n%t" :clock-in nil :clock-resume nil)
          ("w" "to be refiled" entry (file "~/Dropbox/org/agenda/refile.org")
           "* %? :website: \n%t" :clock-in nil :clock-resume nil)))
  (global-set-key (kbd "<f5>") 'org-capture)
  (global-set-key (kbd "<f12>") 'org-agenda)


  ;; The following setting is different from the document so that you
  ;; can override the document org-agenda-files by setting your
  ;; org-agenda-files in the variable org-user-agenda-files
  ;;
  (if (boundp 'org-user-agenda-files)
      (setq org-agenda-files org-user-agenda-files)
    (setq org-agenda-files (quote ("~/Dropbox/org/roam/daily"
                                   "~/Dropbox/org/agenda/"
                                   ))))

  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (mapcar #'(lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
            (org-projectile-todo-files)))
