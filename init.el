(package-initialize)   ;; After include this, some other packages like autopair seems to work. Wanna understand the reason behind this.
;;(load-theme 'solarized-dark t)
;;(load-theme 'zenburn t)

(setq default-frame-alist
;;  '((height . 45)(width . 160)(menubar-lines . 0)(tool-bar-lines . 0)))
 '((left . 0) (top . 0)
        (width . 177) (height . 54)(tool-bar-lines . 0)))
 ;; Set the length and width of the initial emacs window

(setq visible-bell t)
;; Close notification sound

(setq default-major-mode 'text-mode)
;; Set default mode as text-mode


;; (setq kill-ring-max 200)
;; set kill-ring

;;(setq column-number-mode t)
;; set column number

(global-hl-line-mode 1)   ;; Highlight current row
;; (show-paren-mode 1)   ;; Matches parentheses and such in every mode
;; (set-fringe-mode '(0 . 0))    ;; Disable fringe because I use visual-line-mode
;; (set-face-background hl-line-face "#3e4446")   ;; Q:How to change the color here?

(global-linum-mode t)
 ;; Display line numbers

(setq default-directory "~/Dropbox/Workspace/")
 ;; Set default directory

(global-font-lock-mode t)
;; Syntax Highlighting

(setq enable-recursive-minibuffers t)
;; enable recursive minibuffer

(set-face-attribute 'default nil :height 120)
 ;; set font size

(global-set-key [mouse-3] 'mouse-buffer-menu)
 ;; right click buffer menu

;;(add-hook 'after-init-hook '(lambda () (w32-send-sys-command #xf030)))
 ;; Maximize the frame

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
 ;; Set Melpa

(add-to-list 'load-path "~/.emacs.d/")

(global-auto-complete-mode t)
 ;; Set global auto-complete


;; set command key to be meta instead of option
;; (if (system-is-mac)
;; (setq ns-command-modifier 'meta))

;; Set up Smex mode
(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)  	; Bind some keys for smex mode
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(require 'ido)
(ido-mode t)
;; set ido mode

 (require 'autopair)
  (autopair-global-mode) ;; to enable in all buffers
;; set autopair


;; set evil mode
(require 'evil)
(evil-mode 1)

;; set YASnippet
;;(yas-load-directory yas-snippet-dir); Load the snippets
(setq yas-snippet-dirs '("~/emacs.d/mysnippets"
                           "~/Dropbox/Workspace/snippets"))


;;;;;;; set artbollock mode ;;;;;;;;;;
;; (require 'artbollocks-mode)
;; (add-hook 'text-mode-hook 'artbollocks-mode)
;; (add-hook 'org-mode-hook 'turn-on-artbollocks-mode)
;; ;; Avoid these phrases
;; (setq weasel-words-regex
;;       (concat "\\b" (regexp-opt
;;                      '("one of the"
;;                        "should"
;;                        "just"
;;                        "sort of"
;;                        "a lot"
;;                        "probably"
;;                        "maybe"
;;                        "perhaps"
;;                        "I think"
;;                        "really"
;;                        "pretty"
;;                        "maybe"
;;                        "nice"
;;                        "action"
;;                        "utilize"
;;                        "leverage") t) "\\b"))
;; ;; Fix a bug in the regular expression to catch repeated words
;; (setq lexical-illusions-regex "\\b\\(\\w+\\)\\W+\\(\\1\\)\\b")
;; ;; Don't show the art critic words, or at least until I figure
;; ;; out my own jargon
;; (setq artbollocks nil)
;; ;; Make sure keywords are case-insensitive
;; (defadvice search-for-keyword (around sacha activate)
;;   "Match in a case-insensitive way."
;;   (let ((case-fold-search t))
;;     ad-do-it))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; save buffers on exit
(require 'desktop)
;; How to set desktop-restore-eager?

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(desktop-restore-eager 6)
 '(desktop-save-mode t)
 '(ess-R-font-lock-keywords (quote ((ess-R-fl-keyword:modifiers . t) (ess-R-fl-keyword:fun-defs . t) (ess-R-fl-keyword:keywords . t) (ess-R-fl-keyword:assign-ops . t) (ess-R-fl-keyword:constants . t) (ess-fl-keyword:fun-calls . t) (ess-fl-keyword:numbers . t) (ess-fl-keyword:operators . t) (ess-fl-keyword:delimiters) (ess-fl-keyword:=) (ess-R-fl-keyword:F&T))))
 '(org-agenda-files (quote ("~/Dropbox/Workspace/Org/log/2015March.org" "~/Dropbox/Workspace/Org/Current.org" "~/Dropbox/Workspace/Org/Expression.org" "~/Dropbox/Workspace/Org/ProbSolving.org" "~/Dropbox/Workspace/Org/ProgPrac.org" "~/Dropbox/Workspace/Org/Research.org" "~/Dropbox/Workspace/Org/Work.org" "~/Dropbox/Scratch.org" "~/Dropbox/Workspace/Org/Fun.org")))
 '(scheme-program-name "scheme")
 '(show-paren-mode t))
;(desktop-save-mode 1)
(defun my-desktop-save ()
 (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)



;; Org mode
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; Set org agenda varaibles
;(setq org-agenda-files (list "~/Dropbox/Workspace/Org/Expression.org"
;                             "~/Dropbox/Workspace/Org/ProbSolving.org"
;			     "~/Dropbox/Workspace/Org/ProgPrac.org"
;			     "~/Dropbox/Workspace/Org/Research.org"
;			     "~/Dropbox/Workspace/Org/Work.org"
;			     "~/Dropbox/Workspace/Org/Current.org"
;			     "~/Dropbox/Scratch.org"
;			     "~/Dropbox/Workspace/Org/Fun.org"))

;; multiple cursors
(require 'multiple-cursors)
;; When you have an active region that spans multiple lines, the following will add a cursor to each line
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; First mark the word, then add more cursors.

;; org mode for markdown export
(eval-after-load "org"
  '(require 'ox-md nil t))



;;;;;;;;;;;;;;;;;; Latex ;;;;;;;;;;;;;;;;;;;;
(setq Tex-auto-save t)
(setq Tex-parse-self t)


;;;;;;;;;;;;;;;;;;; For Python ;;;;;;;;;;;;;;;;

; python-mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.3")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paul Johnson
;; 2013-09-30

;; Workaround for shift-enter trouble on Windows

;; UPDATE: Because Emacs ESS changes made this MUCH easier, my
;; re-work gets shorter :=)


;; INSTRUCTIONS. Put this file in ~/.emacs, or in ~/emacs.d/init.el,
;; or in the Emacs site-start.d folder.

;; R USER PREVIEW.
;; Here are my special features related to ESS with R.

;; 1. Indentation policy follows Programming R Extensions Manual
;; UPDATE 2013-07-10. No longer needed. This is ESS default as of version 13-05

;; 2. Shift+Enter will send the current line to R, and it will start R
;; if it is not running.  ESS 13-05 chose instead CTL+Enter, which I
;; DO NOT want because it conflicts with CUA mode.

;; 3. R will assume the current working directory is the document directory.

;; 4. R runs in its own "frame"

;; 5. Emacs help pops up in its own frame.


;; JUSTIFICATION.  The intention is to make Emacs work more like a
;; "modern" GUI editor.
;; See my companion lecture
;; "Emacs Has No Learning Curve"
;; http://pj.freefaculty.org/guides/Rcourse


;; Paul Johnson <pauljohn@ku.edu>
;; 2012-11-24
;;
;; Conflicts between Emacs-ESS and SAS usage forced me to make
;; some changes. And for no benefit, as SAS mode still not great.
;; I had to cut out a lot of framepop stuff.
;;


;; 2013-07-10 TODO: Find out if this is still necessary, or for
;; which versions of windows.

;; Section I. Windows OS work-arounds

(if (eq system-type 'windows-nt)
    (setq use-file-dialog nil))
;; There's been a chronic problem with file selection dialogs on Windows
;; Maybe you commment previous out and see if your Windows is fixed.



;; Section II. Keyboard and mouse customization

;; IIA: make mouse selection work in the usual Mac/Windows way

;; 2013-07-10 Comment these out
;; (setq shift-select-mode t) ; is default in Emacs 23+, replaces pc-select
;; (transient-mark-mode t) ; highlight text selection, is default Emacs 23+
(delete-selection-mode t) ; delete seleted text when typing


;; http://ergoemacs.org/emacs/emacs24_features.html
;; after copy Ctrl+c in X11 apps, you can paste by `yank' in emacs
;; (setq x-select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
;;(setq x-select-enable-primary t)
;; This seems not reliable to me (2013-07-10)

;; TODO:
;; Figure out Emacs-24 trouble with mouse selections. I need to
;; figure out where the truth lies

;; In Linux, I see weirdness in Emacs 24 with paste and clipboard. Confusing!
;; http://stackoverflow.com/questions/13036155/how-to-to-combine-emacs-primary-clipboard-copy-and-paste-behavior-on-ms-windows
(setq select-active-regions t)
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;;(setq mouse-drag-copy-region t)
;; See following http://emacswiki.org/emacs/CopyAndPaste
;; where there is a ton of really confusing advice.

;; highlight does not alter KILL ring
(setq mouse-drag-copy-region nil)


;; IIB: keyboard customization

;; CUA mode is helpful not only for copy and paste, but also C-Enter is rectangle select
;; (cua-mode t) ; windows style binding C-x, C-v, C-c, C-z
;; (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;20130717(setq cua-keep-region-after-copy t) ;; Selection remains after C-c

;; write line numbers on left of window
;; Caution: if you do this, it makes Emacs much slower!
;;(global-linum-mode 1) ; always show line numbers


;; Section III. Programming conveniences:
(show-paren-mode t) ; light-up matching parens
(global-font-lock-mode t) ; turn on syntax highlighting
(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))



;; Section IV. ESS Emacs Statistics

;; start R in current working directory, don't let R ask user
(setq ess-ask-for-ess-directory nil)

;; ESS 13.05 default C-Ret conflicts with CUA mode rectangular selection.
;; Change shortcut to use Shift-Return
;; Suggested by Vitalie Spinu ESS-help email 2013-05-15
;; worked in Linux, not Windows 2013-09-29
;;(define-key ess-mode-map [(control return)] nil)
;;(define-key ess-mode-map [(shift return)] 'ess-eval-region-or-line-and-step)

;; cause "Shift+Enter" to send the current line to *R*
(defun my-ess-eval ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))

(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(shift return)] 'my-ess-eval)))



;; create a new frame for each help instance
;; (setq ess-help-own-frame t)
;; If you want all help buffers to go into one frame do:
(setq ess-help-own-frame 'one)

;; I want the *R* process in its own frame
;; This was a broken feature in ESS, fixed now. Helps massively!
(setq inferior-ess-own-frame t)
;;(setq inferior-ess-same-window nil)

;; See no beauty in this. Test: move pointer into a function
;; Run C-c C-d C-e to see effect
;;(setq ess-describe-at-point-method 'tooltip)

;; PJ 2013-07-10 Following commented out
;; PJ 2012-03-21 because ESS 13.05 made it default
;; Indentation per Programming R Extensions
;; (add-hook 'ess-mode-hook
;;    (lambda ()
;;    (ess-set-style 'C++ 'quiet)
;;    (add-hook 'local-write-file-hooks
;;	      (lambda ()
;;		(ess-nuke-trailing-whitespace)))))
;;;;(setq ess-nuke-trailing-whitespace-p 'ask)
;;;; or even
;;(setq ess-nuke-trailing-whitespace-p t)
;;; Perl
;;(add-hook 'perl-mode-hook
;;	  (lambda () (setq perl-indent-level 4)))
;; End ESS


;; In Spring 2012, we noticed ESS SAS mode doesn't work well
;; at all on Windows, that lead to removal of lots of stuff
;; I really liked. Even then, we couldn't get much satisfaction.
;;
;; Following was needed for that, otherwise, it is not needed
;; (load "ess-site")
;; (ess-sas-global-unix-keys)


;; PJ 2013-02-28
;; stops suggestions in R when tabbing. Quiets noise, but ruins feature
;; (setq completion-auto-help nil)



;; ;; ;; Section V. Customize the use of Frames. Try to make new content
;; ;; ;; appear in wholly new frames on screen.
;; ;; ;;
;; ;; ;; V.A: Discourage Emacs from splitting "frames", encourage it to pop up new
;; ;; ;; frames for new content.
;; ;; ;; see: http://www.gnu.org/software/emacs/elisp/html_node/Choosing-Window.html
;; (setq pop-up-frames t)
;; (setq special-display-popup-frame t)
(setq split-window-preferred-function nil) ;discourage horizontal splits
;; (setq pop-up-windows nil)


;; V.C: Make files opened from the menu bar appear in their own
;; frames. This overrides the default menu bar settings.  Opening an
;; existing file and creating new one in a new frame are the exact
;; same operations.  adapted from Emacs menu-bar.el
(defun menu-find-existing ()
  "Edit the existing file FILENAME."
  (interactive)
  (let* ((mustmatch (not (and (fboundp 'x-uses-old-gtk-dialog)
                              (x-uses-old-gtk-dialog))))
         (filename (car (find-file-read-args "Find file: " mustmatch))))
    (if mustmatch
        (find-file-other-frame filename)
      (find-file filename))))
(define-key menu-bar-file-menu [new-file]
  '(menu-item "Open/Create" find-file-other-frame
	      :enable (menu-bar-non-minibuffer-window-p)
	      :help "Create a new file"))
(define-key menu-bar-file-menu [open-file]
  '(menu-item ,(purecopy "Open File...") menu-find-existing
              :enable (menu-bar-non-minibuffer-window-p)
              :help ,(purecopy "Read an existing file into an Emacs buffer")))


;; V.D  Open directory list in new frame.
(define-key menu-bar-file-menu [dired]
  '(menu-item "Open Directory..." dired-other-frame
	      :help "Read a directory; operate on its files (Dired)"
	      :enable (not (window-minibuffer-p (frame-selected-window menu-updating-frame)))))




;; Section VI: Miscellaneous convenience

;; Remove Emacs "splash screen"
;; http://fuhm.livejournal.com/
(defadvice command-line-normalize-file-name
  (before kill-stupid-startup-screen activate)
  (setq inhibit-startup-screen t))
  (setq inhibit-splash-screen t)


;; Show file name in title bar
;; http://www.thetechrepo.com/main-articles/549
(setq frame-title-format "%b - Emacs")


;; I'm right handed, need scroll bar on right (like other programs)
;;(setq scroll-bar-mode-explicit t)
;;(set-scroll-bar-mode `right)


;; Make Emacs scroll smoothly with down arrow key.
;; 2011-10-14
;; faq 5.45 http://www.gnu.org/s/emacs/emacs-faq.html#Modifying-pull_002ddown-menus
(setq scroll-conservatively most-positive-fixnum)


;; adjust the size of the frames, uncomment this, adjust values
;;(setq default-frame-alist '((width . 90) (height . 65)))


;; Remember password when connected to remote sites via Tramp
;; http://stackoverflow.com/questions/840279/passwords-in-emacs-tramp-mode-editing
;; Emacs "tramp" service (ssh connection) constantly
;; asks for the log in password without this
(setq password-cache-expiry nil)


;; Section : Emacs shells work better
;; http://snarfed.org/why_i_run_shells_inside_emacs
(setq ansi-color-for-comint-mode 'filter)
(setq comint-prompt-read-only t)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
