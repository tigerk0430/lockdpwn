;;; MELPA와 MARMALADE 저장소를 package list에 추가합니다
(require 'package)

(add-to-list 'package-archives'("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives'("melpa" . "http://melpa.org/packages/") t)

(package-initialize) ;; You might already have this line
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(defconst demo-packages
  '(
    anzu                   ;; 단어를 찾은 다음 교체하는 패키지 (단축키: M-%)
    duplicate-thing        ;; M-c 키로 현재 행을 그대로 복사하는 패키지
    helm                   ;; 파일목록이나 최근사용하 파일들, 버퍼를 쉽게 볼 수 있게 해주는 패키지
    helm-gtags
    helm-projectile
    helm-swoop
    clean-aindent-mode
    ws-butler              ;; whitespace를 알아서 제거해주는 패키지
    projectile
    undo-tree              ;; Alt + z 키를 통해 undo한 목록들을 볼 수 있는 패키지
    smartparens            ;; {}, [] 등 자동으로 괄호를 닫아주는 패키지
    auto-complete          ;; 단어 자동완성 패키지
    ecb                    ;; Emacs Code Browser의 약자로 코드를 상세하게 분석할 수 있게 해주는 패키지
    dtrt-indent            ;; 여러 파일들이 하나는 탭, 하나는 스페이스로 공백이 되어있을 경우 emacs가 알아서 처리하게 해주는 패키지
    google-c-style         ;; 들여쓰기 형식을 google style (구글 엔지니어들 스타일인듯)로 해주는 패키지
    etags                  ;; 함수나 여러 변수들의 선언을 찾아볼 수 있게 해주는 패키지
    key-chord              ;; 여러 쉬운 단축키들을 등록해주 수 있는 패키지 ( '..'키를 등록했습니다 )( 클래스 자동완성으로 등록 )
    rainbow-delimiters     ;; 괄호를 색색깔있게 바꿔줍니다
    jedi                   ;; 파이썬용 jedi 패키지 (terminal 창에서 $ pip install jedi epc pylint virtualenv 를 쳐줘야 정상작동하는듯 하다)
    arduino-mode           ;; 만약 아두이노를 사용한다면 추가해줍니다
    highlight-indentation  ;; 파이썬용 들여쓰기 라인을 보여주는 패키지 (Alt + l로 설정했다)
    ess                    ;; R 언어 전용 패키지입니다
    gtags                  ;; 함수나 여러 변수들의 선언을 찾아볼 수 있게 해주는 패키지
    highlight-symbol       ;; 같은 단어들 하이라이팅 해주는 패키지 (보기 좋게 글자를 색상을 칠해준다)
    ;; highlight-symbol.el 파일에서
    ;; highlight-symbol-colors ==> highlight-symbol-color로 수정한다 (색깔을 제대로 표시하지 못한다)
    ;; 바로 적용이 안되므로 .elc 파일을 삭제하던지 아니면 M-x : byte-compile-file을 실시한다
    yasnippet              ;; 여러가지 자주 사용하는 구문들을 쉽게 사용할 수 있게 템플릿 형식으로 제공해주는 패키지
    ;; ~/.emacs.d/elpa/yasnippet-.../snippets 에 있는 파일들을 ~/.emacs.d/snippets 에 넣어야 정상적으로 동작합니다
    hide-comnt             ;; 주석을 감췄다 보여줬다 하는 패키지 (F9 단축키)
    php-mode               ;; php 모드를 활성화합니다 (~/.emacs.d/elpa/php-mode.../php-mode.elc 파일이 잘못된 듯 합니다 이걸 삭제해주면 정상적으로 실행됩니다)
    flycheck               ;; 코드의 오류를 검사해주는 패키지
    robe                   ;; Ruby 관련된 패키지들 : 변수, 함수로 이동할 수 있는 패키지 : robe start를 입력해줘야 합니다
    inf-ruby               ;; Ruby 관련된 패키지들 : ruby shell (irb)를 사용할 수 있는 패키지
    rvm                    ;; Ruby 관련된 패키지들 : ruby version 관리해주는 패키지


    yaml-mode              ;; .yaml 구문을 하이라이팅해주는 패키지
    nxml                   ;; xml 구문들을 folding하기 위한 패키지
    lua-mode               ;; lua 언어를 하이라이팅해주는 패키지

    protobuf-mode          ;; .proto (google protocol buffer) 하이라이팅해주는 패키지

    csharp-mode            ;; C# 구문을 하이라이팅해주는 패키지

    multi-term             ;; 여러 터미널을 emacs에서 실행하 수 있게 해주는 패키지
    which-key              ;; 단축키들의 목록을 보여주는 패키지
    magit                  ;; emacs용 git 패키지 (Alt + \ 단축키)
    iedit                  ;; 단어들의 일괄편집을 해주는 패키지 (Alt + [ 단축키)
    wgrep                  ;; 프로젝트 내 grep 후 한개의 버퍼에서 모든 파일 수정하는 패키지 (grep창에서 C-c C-p 단축키)
    avy                    ;; 편집중 버퍼상의 빠른 이동   (Ctrl + = 단축키)
    swiper                 ;; 편집중 버퍼상의 빠른 이동2  (Ctrl + - 단축키)
    eyebrowse              ;; 워크 스페이스 관리 패키지 (다중 윈도우)

    elpy                   ;; jedi 모드 같이 python code navigation을 해주는 패키지
    markdown-mode          ;; markdown 구문을 하이라이팅해주는 패키지
    ein                    ;; emacs에서 Ipython Notebook를 사용하게 해주는 패키지
    org-bullets            ;; org-mode에서 마크 모양을 bullet 모양으로 해주는 패키지
    org-gcal               ;; org-mode와 google Calendar를 연동해주는 패키지
    git-gutter             ;; 수정된 파일의 변경된 라인을 하이라이팅해주는 패키지
    mic-paren              ;; 괄호로 닫혀진 구문이 너무 길어서 한쪽 끝이 안보일 경우 line, number를 알려주는 패키지

    company                ;; auto-complte와 유사한 코드 자동완성 패키지
    irony                  ;; c++ 코드 자동완성 패키지 (M-x irony-install-server로 설치한다)
    company-irony          ;; c++ 코드 자동완성 패키지

    image+                 ;; .jpg, .png 같은 이미지들의 크기를 조정할 수 있는 패키지

    solarized-theme        ;; solarized 테마





    ;; ample-theme            ;; ample 테마
    ;; arjen-grey-theme       ;; grey 테마를 설정할 수 있는 패키지



    ;; flymd                  ;; markdown 구문을 preview 해주는 패키지 (.md 파일을 켠 다음 Ctrl + 4 단축키)
    ;; org-preview-html       ;; org-mode의 편집을 실시간으로 html로 나타내주는 패키지 (not used)
    ;; htmlize                ;; org-preview-html을 실행하기 위한 의존성 패키지
    ;; smart-mode-line
    ;; smart-mode-line-powerline-theme
    ;; powerline              ;; emacs 상태창을 예쁘게 꾸며주는 패키지
    ;; anaconda-mode ;; jedi 모드 같이 python code navigation을 해주는 패키지2
    ;;helm-ros  ;; ROS용 emacs 패키지 (not used)
    ;; autopair
    ;; function-args
    ;; comment-dwim-2
    ;; volatile-highlights
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
;; (setq helm-gtags-prefix-key "\C-cg")

;;===========================================================================
;;===========================================================================

;; 1. helm에 관한 코드들

(require 'helm-config)
(require 'helm-grep)
;;(require 'setup-helm)
;;(require 'setup-helm-gtags)
;;(require 'setup-cedet)
;;(require 'setup-editing)



;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)            ; rebihnd tab to do persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)            ; rebihnd tab to do persistent action
(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 500 ; limit the number of displayed canidates
 ;; helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
 ;; useful in helm-mini that lists buffers

 )

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;; (global-set-key (kbd "C-c h o") 'helm-occur)
;; (global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
;; (global-set-key (kbd "C-c h x") 'helm-register)
;; (global-set-key (kbd "C-x r j") 'jump-to-register)

;;(define-key 'help-command (kbd "C-f") 'helm-apropos)
;;(define-key 'help-command (kbd "r") 'helm-info-emacs)
;;(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; use helm to list eshell history
;; (add-hook 'eshell-mode-hook
;;           #'(lambda ()
;;               (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
;;(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
;;(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

;;(define-key global-map [remap find-tag] 'helm-etags-select)
;;(define-key global-map [remap list-buffers] 'helm-buffers-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: helm-swoop                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Locate the helm-swoop folder to your path
(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
;;(global-set-key (kbd "C-c h o") 'helm-swoop)
;;(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
;;(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;; From helm-swoop to helm-multi-swoop-all
;;(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Save buffer when helm-multi-swoop-edit complete
;;(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
;;(setq helm-swoop-split-with-multiple-windows t)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
;;(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
;;(setq helm-swoop-speed-or-color t)

(helm-mode t)

(provide 'setup-helm)
(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode in Dired so you can jump to any tag
;; when navigate project tree with Dired
(add-hook 'dired-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in Eshell for the same reason as above
;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)

;; Enable helm-gtags-mode in languages that GNU Global supports
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'java-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)

;; key bindings
;;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; gtags 관련해서 자동으로 파일 열고 저장할 때 gtags를 실행하도록 하는 함수들
(gtags-mode t)
(add-hook 'prog-mode-hook 'gtags-mode)


(defun gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
      (let ((olddir default-directory)
            (topdir (read-directory-name
                     "gtags: top of source tree:" default-directory)))
        (cd topdir)
        (shell-command "gtags -q && echo 'created tagfile'")
        (cd olddir)) ; restore
    ;;  tagfile already exists; update it
    (with-temp-buffer
      (shell-command "global -u && echo 'updated tagfile'" t))))


;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (gtags-create-or-update)))
;; (add-hook 'c++-mode-common-hook
;;           (lambda ()
;;             (gtags-create-or-update)))


(defun gtags-root-dir ()
  "Return GTAGS Root directory or nil if doesn't exist"
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))


;; gtags를 매번 저장할 때마다 업데이트하는 함수인듯, global -u 커맨드가 핵심커맨드인듯하다
(defun gtags-update-single (filename)
  "Update Gtags database for changes in a single file"
  (interactive)
  (with-temp-buffer
    (shell-command "global -u" t))
  (start-process "update-gtags" "update-gtags" "bash" "-c" (concat "cd " (gtags-root-dir) " ; gtags --single-update " filename )))


(defun gtags-update-current-file()
  (interactive)
  (defvar filename)
  (setq filename (replace-regexp-in-string (gtags-root-dir) "." (buffer-file-name (current-buffer))))
  (gtags-update-single filename)
  (message "Gtags updated for %s" filename)
  )


(defun gtags-update-hook()
  "Update GTAGS file incrementally upon saving a file"
  (when gtags-mode
    (when (gtags-root-dir)
      (gtags-update-current-file))))


(add-hook 'after-save-hook 'gtags-update-hook)


(provide 'setup-helm-gtags)



;;===========================================================================
;; cedet에 관한 코드들 (auto-complete, cc-mode, semantic...)(단어 자동완성 관련된 코드들)

;; PACKAGE: auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; PACKAGE: semantic
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/complete)

;; Semantic ON
(semantic-mode t)

;; 함수나 변수들을 찾아 이동할 때마다 로그를 기록합니다
(global-semantic-mru-bookmark-mode)

;; 자동완성에 쓸 헤더 파일 경로 적는 예
;; 이것이 있어야 #include 한 헤더파일의 내용도 자동완성에 나타납니다.
(semantic-add-system-include "/usr/include" 'c-mode)
(semantic-add-system-include "/usr/include" 'c++-mode)
(semantic-add-system-include "/usr/include/c++/5" 'c-mode)
(semantic-add-system-include "/usr/include/c++/5" 'c++-mode)
(semantic-add-system-include "/opt/ros/kinetic/include" 'c++-mode)


;; Company mode On
(global-company-mode)

;; using company-irony
(add-hook 'c-mode-hook '(lambda ()
                          (local-set-key (kbd "<return>") 'newline-and-indent)
                          (linum-mode t)
                          (irony-mode t)
                          ))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; C++11 에서 추가된 코드들에 대한 자동완성을 하기 위해 추가한 코드
(setq irony-additional-clang-options '("-std=c++11"))



;;===========================================================================
;; 기타 초기값 설정 코드들

;; GROUP: Editing -> Editing Basics
(setq global-mark-ring-max 5000         ; increase mark ring to contains 5000 entries
      mark-ring-max 5000                ; increase kill ring to contains 5000 entries
      mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tab
      )

(add-hook 'sh-mode-hook (lambda ()
                          (setq tab-width 4)))


;; 한글폰트 설정 (size 부분을 바꾸면 크기가 바뀝니다)
(set-fontset-font t 'hangul  (font-spec :name "NanumGothicCoding" :size 20))
;; (set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NanumGothicCoding" . "unicode-bmp") )
;; (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp") )

;; 선호하는 인코딩환경을 utf-8으로 설정합니다 (한글 문제)
;; 한글이 깨지는 경우
;; M-x revert-buffer-with-coding-system --> korea-iso-8bit 으로 설정해주면 정상적으로 보인다
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)


;; emacs --daemon 버전에서 M-x load-file 하거나 새로 켜는 경우 한글폰트를 적용하는 함수
(defun set_korean_font_after_loading (&optional frame)
  (set-fontset-font "fontset-default" 'hangul "NanumGothicCoding"))

(add-hook 'after-make-frame-functions 'set_korean_font_after_loading)


;; Package: clean-aindent-mode
;; GROUP: Editing -> Indent -> Clean Aindent
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; PACKAGE: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode t)
(setq dtrt-indent-verbosity 0)

;; PACKAGE: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)
(add-hook 'text-mode 'ws-butler-mode)
(add-hook 'fundamental-mode 'ws-butler-mode)

;; Package: undo-tree
;; GROUP: Editing -> Undo -> Undo Tree
(require 'undo-tree)
(global-undo-tree-mode)


;; PACKAGE: jedi
;; $ pip install jedi epc pylint virtualenv
(require 'jedi)
;; python에서 클래스 이름에 .을 입력하면 자동으로 멤버함수들의 목록을 출력해준다
(setq jedi:install-server t)
(setq jedi:complete-on-dot t)

;; 파이썬 모드 단축키를 설정합니다
(add-hook 'python-mode-hook
          (lambda ()
            (jedi:setup)
            (jedi:ac-setup)
            (define-key jedi-mode-map (kbd "C-c /") nil)
            (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
            (local-set-key (kbd "M-.") 'jedi:goto-definition)

            ;; 파이썬 선택한영역을 < 또는 > 쪽으로 이동합니다
            (local-unset-key (kbd "C-c >"))
            (local-unset-key (kbd "C-c <"))
            (local-set-key (kbd "C-<") 'python-indent-shift-left)
            (local-set-key (kbd "C->") 'python-indent-shift-right)
            (setq indent-tabs-mode t)
            (setq python-indent-offset 4)
            (setq tab-width 4)

            (elpy-mode)         ;; elpy mode 추가 ("M-t" : elpy-rgrep으로 reference를 찾을 수 있습니다)
            ))


;; elpy에서 사용하는 모든 keymap을 비활성화합니다
(setq elpy-mode-map nil)

;; elpy 모드가 실행되고 나서 설정하고 싶은 코드는 아래 작성한다
(eval-after-load "elpy" (lambda ()
                          ;; Alt + t 키로 reference를 찾아준다 (grep -r 명령어와 비슷하다고 한다)
                          (local-set-key (kbd "M-t") 'elpy-rgrep-symbol)

                          ;; elpy-mode에서 부가적으로 실행되는 모든 모듈들을 해제한다
                          (remove-hook 'elpy-modules 'elpy-module-flymake)
                          (remove-hook 'elpy-modules 'elpy-module-yasnippet)
                          (remove-hook 'elpy-modules 'elpy-module-highlight-indentation)
                          (remove-hook 'elpy-modules 'elpy-module-django)
                          (remove-hook 'elpy-modules 'elpy-module-company)
                          (remove-hook 'elpy-modules 'elpy-module-eldoc)
                          (remove-hook 'elpy-modules 'elpy-module-pyvenv)
                          (remove-hook 'elpy-modules 'elpy-module-sane-defaults)
                          ))



;; PACKAGE : org mode
;; DONE 시에 CLOSED timestamp를 사용하는 함수
(defun my/org-mode-hook ()
  (progn
    "Stop the org-level headers from increasing in height relative to the other text."
    (dolist (face '(org-level-1))
      (set-face-attribute face nil :weight 'normal :height 1.2))

    (dolist (face '(org-level-2
                    org-level-3
                    org-level-4
                    org-level-5))
      (set-face-attribute face nil :weight 'normal :height 0.98))
    ))

;; org 모드가 실행되고 나서 설정하고 싶은 코드는 아래 작성한다
;; "org" because C-h f org-mode RET says that org-mode is defined in org.el
(eval-after-load "org"
  '(progn
     ;; ed: 단축키 해제
     (define-key org-mode-map (kbd "<M-right>") nil)
     (define-key org-mode-map (kbd "<M-left>") nil)
     (define-key org-mode-map (kbd "<S-right>") nil)
     (define-key org-mode-map (kbd "<S-left>") nil)
     (define-key org-mode-map (kbd "<S-up>") nil)
     (define-key org-mode-map (kbd "<S-down>") nil)
     (define-key org-mode-map (kbd "C-k") nil)
     (define-key org-mode-map (kbd "C-y") nil)
     (define-key org-mode-map (kbd "q") nil)
     (define-key org-mode-map (kbd "<C-tab>") nil)
     (define-key org-mode-map (kbd "<C-S-left>") nil)
     (define-key org-mode-map (kbd "<C-S-right>") nil)
     (define-key org-mode-map (kbd "C-a") nil)
     (define-key org-mode-map (kbd "C-C /") nil)
     (define-key org-mode-map (kbd "C-,") nil)
     (define-key org-mode-map (kbd "C-c <up>") nil)
     (define-key org-mode-map (kbd "C-c <down>") nil)
     (define-key org-mode-map (kbd "C-c a") nil)
     (define-key org-mode-map (kbd "C-m") nil)
     (define-key org-mode-map (kbd "M-f") nil)
     (define-key org-mode-map (kbd "<C-down>") nil)
     (define-key org-mode-map (kbd "M-e") nil)
     (define-key org-mode-map (kbd "C-'") nil)
     (define-key org-mode-map (kbd "C-c C-q") nil)
     (define-key org-mode-map (kbd "M-h") nil)
     (define-key org-mode-map (kbd "C-c \\") nil)

     ;; ed: 단축키 등록
     (define-key org-mode-map (kbd "<M-S-right>") 'org-shiftright)
     (define-key org-mode-map (kbd "<M-S-left>") 'org-shiftleft)
     (define-key org-mode-map (kbd "<M-S-up>") 'org-shiftup)
     (define-key org-mode-map (kbd "<M-S-down>") 'org-shiftdown)
     (define-key org-mode-map (kbd "<C-S-right>") 'org-metaright)
     (define-key org-mode-map (kbd "<C-S-left>") 'org-metaleft)
     ;; org capture 기능 단축키 (C-m 이 <return>과 충돌나므로 C-. 으로 변경했다)
     (define-key org-mode-map (kbd "C-.") 'org-capture)
     ;; org-mode를 저장할 때마다 html로 preview를 보여주는 단축키
     (define-key org-mode-map (kbd "C-c w") 'org-preview-html/preview)
     ;; code ==> image Update 단축키
     (define-key org-mode-map (kbd "C-c q") 'org-toggle-inline-images)
     ;; org  ==> markdown export 단축키
     (define-key org-mode-map (kbd "C-c m") 'org-md-export-to-markdown)
     ;; Shift + Enter 키로 현재 링크를 엽니다
     (define-key org-mode-map (kbd "<S-return>") 'org-open-at-point)
     ;; Alt + Enter 키로 org-meta-return키를 설정합니다 (원래 open-line으로 overriding 되어 있었다)
     (define-key org-mode-map (kbd "<M-return>") 'org-meta-return)
     ;; C-c v,b 키로 org-table 모드에서 열과 행을 추가합니다
     (define-key org-mode-map (kbd "C-c b") 'org-table-insert-row)
     (define-key org-mode-map (kbd "C-c v") 'org-table-insert-column)
     ;; C + | 키로 영역을 table화 합니다
     (define-key org-mode-map (kbd "C-|") 'org-table-create-or-convert-from-region)
     ;; C + . 키로 agenda를 실행합니다
     (define-key org-mode-map (kbd "C-/") 'org-agenda)
     ;; C-down + M-f 키를 기본 cpp,python 파일에서와 같이 구문단위로 이동하도록 설정합니다
     ;; org.el에서 remap이 되어있던 코드를 주석처리하니 아래 두 코드가 정상작동한다
     (define-key org-mode-map (kbd "<C-down>") 'forward-paragraph)
     (define-key org-mode-map (kbd "M-f") 'forward-paragraph)
     ;; C-' 키로 태그를 설정합니다
     (define-key org-mode-map (kbd "C-'") 'org-set-tags-command)
     ;; C-` 키로 org-tags-sparse-tree 명령을 실행합니다
     (define-key org-mode-map (kbd "C-`") 'org-tags-sparse-tree)


     ;; DONE 시에 CLOSED timestamp를 사용하는 설정
     (setq org-log-done 'time)
     ;; org-mode에서 이미지를 보여주는 설정
     ;; (setq org-startup-with-inline-images t)
     ;; src block에 syntax highlighting을 해주는 패키지
     (setq org-src-fontify-natively t)
     ;; org-mode를 시작할 때 unfold all
     ;;(setq org-inhibit-startup-visibility-stuff t)
     ;; org-mode에서 이미지 크기를 줄이기 위한 설정
     (setq org-image-actual-width nil)
     ;; tag가 달리는 위치 설정
     (setq org-tags-column 120)
     (setq org-startup-indented nil)
     ;; org-agenda view에서 하루가 지난 뒤까지 deadline이 없는 경우 계속 누적되지 않도록 설정
     (setq org-scheduled-past-days 0)
     (setq org-todo-keywords
           '((sequence "TODO" "DOING" "PENDING" "|" "REPLACED" "CANCELLED"  "DONE")))
     ;; Setting Colours (faces) for todo states to give clearer view of work
     (setq org-todo-keyword-faces
           '(("CANCELLED" . "red")
             ("REPLACED" . "purple")
             ("PENDING" . "orange")
             ("DOING" . "yellow")
             ))

     ;; org-bullets 모드 활성화
     (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
     ;; wrap line
     (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
     ;; header 크기 변하지 않게
     (add-hook 'org-mode-hook 'my/org-mode-hook)

     ;; 해당 폴더 내에 모든 .org 파일을 agenda view에 등록한다
     (setq org-agenda-files (file-expand-wildcards "~/gitrepo/ims_org/org_files/*.org"))
     (setq org-agenda-files (file-expand-wildcards "~/gitrepo/ims_org/org_files/note/*.org"))
     ;; C-. 키로 사용할 note 파일
     (setq org-default-notes-file "~/gitrepo/ims_org/org_files/edward.org")
     ;; orgm
     ;; org-capture에서 사용할 목록들 설정
     (setq org-capture-templates '(("1" "edward.org: [Task]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/edward.org" "Tasks")
                                    "*** TODO %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("2" "edward.org: [Issues]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/edward.org" "Issues")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("3" "edward.org: [Note]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/edward.org" "Note")
                                    "*** %i%?%i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("4" "dyros.org: [Task]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/dyros.org" "Tasks")
                                    "*** TODO %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("5" "dyros.org: [Issues]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/dyros.org" "Issues")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("6" "dyros.org: [Note]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/dyros.org" "Note")
                                    "*** %i%?%i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("7" "parkable.org: [Task]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_parkable.org" "Tasks")
                                    "*** TODO %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("8" "parkable.org: [Issues]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_parkable.org" "Issues")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("9" "parkable.org: [Note]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_parkable.org" "Note")
                                    "*** %i%?%i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("a" "cartographer.org: [Task]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_cartographer.org" "Tasks")
                                    "*** TODO %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("s" "cartographer.org: [Issues]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_cartographer.org" "Issues")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("d" "cartographer.org: [Note]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/project_cartographer.org" "Note")
                                    "*** %i%?%i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))")

                                   ("w" "emacs.org: [Task]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/emacs.org" "Tasks")
                                    "*** TODO %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ("e" "emacs.org: [Issues]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/emacs.org" "Issues")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")

                                   ("r" "ubuntu_tips.org: [Ubuntu]" entry
                                    (file+headline "~/gitrepo/ims_org/org_files/note/ubuntu_tips.org" "Ubuntu")
                                    "*** %i\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"\"))\n***** %?")
                                   ))

     (setq org-refile-targets '((org-agenda-files :level . 1)))
     (setq org-agenda-log-mode-items '(closed clock state))
     ))
;; (add-to-ordered-list 'emulation-mode-map-alists '((org-mode . ,my-org-mode-map)) 0)

;; Google Calendar와 연동하는 org-gcal 패키지 추가 & 세팅
(require 'org-gcal)
(setq package-check-signature nil)
(setq org-gcal-client-id "815785509878-3gn7mhcti240j6am59uk95s230n11172.apps.googleusercontent.com"
      org-gcal-client-secret "_bYrUIkY5zYh62fxGRtNryTj"
      org-gcal-file-alist '(("gyurse@gmail.com" .  "~/gitrepo/ims_org/org_files/gcal.org")))
;; agenda mode를 키면 자동으로 Google Calendar와 동기화합니다
(add-hook 'org-agenda-mode-hook (lambda ()
                                  (org-gcal-sync nil nil t)
                                  (define-key org-agenda-mode-map (kbd "C-n") nil)
                                  ))
;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; org-agenda-view에서 gcal.org의 색깔만 변경하는 코드
(add-hook 'org-agenda-finalize-hook
          (lambda ()
            (save-excursion
              (goto-char (point-min))
              (while (re-search-forward "gcal:" nil t)
                (add-text-properties (match-beginning 0) (point-at-eol)
                                     '(face (:foreground "dark orange"))
                                     )))))

;; C-c + s 키로 gcal.org <==> Google Calendar를 동기화합니다
(global-set-key (kbd "C-c s") (lambda () (interactive)(org-gcal-sync nil nil t) ))
;; C-c + / 키로 edward.org 파일을 엽니다
(global-set-key (kbd "C-c /") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/edward.org")))
;; C-c + # 키로 특정 .org 파일을 엽니다
(global-set-key (kbd "C-c 1") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/project_parkable.org")))
(global-set-key (kbd "C-c 2") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/project_cartographer.org")))
(global-set-key (kbd "C-c 3") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/dyros.org")))
(global-set-key (kbd "C-c 4") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/emacs.org")))
;; C-, 키로 link.opg 파일을 엽니다
(global-set-key (kbd "C-,") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/link.org")))
;; C-c + l 키로 org mode에서 링크를 타기 위한 단축키를 설정합니다
(global-set-key (kbd "C-c l") 'org-store-link)
;; C-/ 키로 어느곳에서나 agenda view를 열게합니다
(global-set-key (kbd "C-/") 'org-agenda)
(define-key undo-tree-map (kbd "C-/") 'org-agenda)
;; C-. 키로 어느곳에서나 capture 기능을 열게합니다
(global-set-key (kbd "C-.") 'org-capture)
;;org-END=================================================================

;; PACKAGE: smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; Alt + a 키로 괄호를 한 번에 지워주는 키를 설정합니다
;; (global-set-key (kbd "M-a") 'sp-splice-sexp)
;;(define-key c++-mode-map (kbd "M-a") 'sp-splice-sexp)

;; PACKAGE: comment-dwim
;; Alt + ' 키로 comment-dwim 명령어를 수행합니다
(global-set-key (kbd "M-'") 'comment-dwim)

;; (require 'evernote-mode)
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
;; (setq evernote-username "gyurse")
;; (setq evernote-developer-token "S=s1:U=94ad7:E=16b3c61dabe:C=163e4b0ad30:P=1cd:A=en-devtoken:V=2:H=25f588edfdb5ff0df834f685efa0e75b")


;; PACKAGE: image+
(require 'image+)
(imagex-global-sticky-mode t)
(eval-after-load "image+" (lambda ()
                            ;; C-c = 키로 이미지를 확대한다
                            (define-key imagex-sticky-mode-map (kbd "C-c =") 'imagex-sticky-zoom-in)
                            ;; C-+ 키로 이미지 크기를 자동조정한다
                            (define-key imagex-sticky-mode-map (kbd "C-+") 'imagex-auto-adjust-mode)
                            ))


;; Package: yasnippet
;; ~/.emacs.d/elpa/yasnippet-.../snippets 에 있는 파일들을 ~/.emacs.d/snippets 에 넣어야 정상적으로 동작합니다
(require 'yasnippet)
(yas-global-mode t)
(setq warning-suppress-types nil)
;; yasnippet에 elisp 함수를 쓰면 나타나는 경고문을 무시합니다
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))


;; PACKAGE: anzu
(require 'anzu)
(global-anzu-mode)

;; M-% 키로 해당 buffer에서 특정 단어를 바꿉니다
(global-set-key (kbd "M-%") 'anzu-query-replace)
;; C-M-% 키로 정규표현식을 이용한 단어치환을 합니다
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; PACKAGE: duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;; PACKAGE : flycheck
(require 'flycheck)
;; c++11에 안맞는 문법이 있을경우(range-based loop 등) 경고 메세지를 띄우는데 이를 무시한다
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c++11")
            (setq flycheck-clang-language-standard "c++11")
            ))

;; ROS를 사용하는 경우 flycheck #include <ros/ros.h>가 나지 않도록 추가한 코드
(setq flycheck-clang-include-path (list (expand-file-name "/opt/ros/kinetic/include")))


;; emacs syntax warning + error 들을 무시합니다
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  )

;; PAKCAGE: which-key
(require 'which-key)
;; 단축키 입력시 하단에서 목록을 보여주는 모드
(which-key-mode)

;; PACKAGE: avy
(require 'avy)

;; PACKGE: eyebrowse
(require 'eyebrowse)
(eyebrowse-mode t)

;; C + 1,2,3을 누를때마다 워크스테이션을 생성한다
(setq eyebrowse-new-workspace t)
(setq eyebrowse-wrap-around t)
(setq eyebrowse-switch-back-and-forth t)
(setq eyebrowse-new-workspace nil)
(setq eyebrowse-mode-line-style (quote always))


;; PACKAGE: solarized theme
(require 'solarized-dark-theme)
(provide 'solarized-dark-theme)

;; (load-theme 'arjen-grey t)
;; (load-theme 'ample-light t)


;; elisp, lisp 모드에서만 rainbow-delimiters를 활성화합니다
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

;; PACKAGE: ein
(require 'ein)
;; jupyter notebook을 킨 상태에서 브라우저가 자동으로 켜지지 않도록 설정합니다
(setq ein:jupyter-server-args (quote ("--no-browser")))
(setq ein:use-auto-complete t)

;; ein 모드가 실행되고 난 후 세팅에 관한 코드
(eval-after-load "ein"
  '(progn
     (ein:ipynb-mode)

     ;; ed: ein 단축키 해제
     (define-key ein:notebook-mode-map (kbd "C-c i") nil)
     (define-key ein:notebook-mode-map (kbd "H-i") nil)
     (define-key ein:notebook-mode-map (kbd "C-u") nil)
     (define-key ein:notebook-mode-map (kbd "C-x C-s") nil)

     ;; ed: ein 단축키 등록
     (define-key ein:notebook-mode-map (kbd "C-w") 'ein:notebook-save-notebook-command)
     (define-key ein:notebook-mode-map (kbd "C-c C-d") 'ein:worksheet-delete-cell)
     (define-key ein:notebook-mode-map (kbd "M-<return>") 'ein:worksheet-execute-cell-and-goto-next)
     ))

;; PACKAGE: flymd
;; markdown 언어를 볼 수 있게 해주는 패키지 (not used)
;; (require 'flymd)
;; markdown을 파이어폭스에서 실행하도록 하는 코드
;; (defun my-flymd-browser-function (url)
;;    (let ((browse-url-browser-function 'browse-url-firefox))
;;      (browse-url url)))
;;  (setq flymd-browser-open-function 'my-flymd-browser-function)


;; PACKAGE: highlight-indentation
(require 'highlight-indentation)
;;(add-hook 'python-mode-hook 'highlight-indentation-mode)
;;(add-hook 'js2-mode-hook 'highlight-indentation-mode)
;; (set-face-font 'highlight-indentation-face "Monospace")
;; (set-face-background 'highlight-indentation-face "#0d0d0d")
;; (set-face-attribute 'highlight-indentation-face nil :height 54)

;; PACKAGE: which-func
;; 현재 라인이 가리키고 있는 함수를 위에 상태창에 표시합니다
(require 'which-func)
;;(add-to-list 'which-func-modes 'ruby-mode)
;;(add-to-list 'which-func-modes 'cc-mode)
;;(add-to-list 'which-func-modes 'emacs-lisp-mode)
(setq which-func-unknown "n/a")
(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-func-mode mode-line-misc-info))

;; PACKAGE: git-gutter
;; git gutter 모드를 사용해 수정된 라인을 하이라이팅한다
(global-git-gutter-mode t)
;; linum-mode와 겹쳐서 linum이 안보이는 문제를 해결하기 위해 코드 추가
(git-gutter:linum-setup)

;; custom 모양 및 색상 추가
(set-face-foreground 'git-gutter:modified "yellow")
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")
;; C-c + g 키로 git gutter에서 수정된 부분을 뒤로 돌릴건지 물어보는 명령어를 실행합니다
(global-set-key (kbd "C-c g") 'git-gutter:revert-hunk)


;; PACKAGE: iedit
(require 'iedit)
;; smerge mode가 시작되고 실행되는 코드
(eval-after-load "iedit"
  (lambda()
    ;; iedit 모드에서 `키로 선택 해제를 합니다 (default: M-;)
    (define-key iedit-mode-keymap (kbd "`") 'iedit-toggle-selection)
    ))


;; PACKAGE: wgrep
(require 'wgrep)

;; PACKAGE: rvm
;; Ruby 관련된 패키지 설정들
;; 1. 처음 루비 파일을 연 다음 C-c C-s를 누르면 inf-ruby (irb) 창이 열립니다
;; 2. 이 때 다시 한 번 C-c C-s를 눌러 robe start 명령어를 실행합니다
;; 3. C-c C-c 를 눌러 irb 창을 닫습니다.
;; 그 다음부턴 원하는 함수, 변수의 자동완성과 jump 기능을 사용할 수 있습니다
(require 'rvm)
(rvm-use-default)
(defadvice inf-ruby-console-auto
    (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;;(eval-after-load 'company
;; '(push 'company-robe company-backends))
;;(require 'rinari)
;;(require 'ido)
;;(ido-mode)
;;(require 'rhtml-mode)
;;(global-rinari-mode)
;;(add-hook 'rhtml-mode-hook
;;	  (lambda () (rinari-launch)))
;;(setq rinari-tags-file-name "TAGS")
;;(add-hook 'ruby-mode-hook 'rinari-launch)

(add-hook 'ruby-mode-hook
          (lambda ()
            ;;(local-set-key (kbd "<tab>") 'company-robe)
            (local-set-key (kbd "C-c C-s") 'inf-ruby-console-auto)))

(add-hook 'inf-ruby-mode-hook
          (lambda()
            (local-set-key (kbd "C-c C-s") 'robe-start)
            ;; (local-set-key (kbd "C-c C-c") 'delete-window)
            ))

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
;;(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

;; PACKAGE: helm-projectile
(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; Package: arduino-mode
;; emacs 25.1 버전에서는 왜그런지 모르지만 이 부분에서 에러난다
;; (require 'arduino-mode)
;; arduino 아두이노 모드에 자동완성 기능을 추가합니다
;; (add-hook 'arduino-mode-hook 'auto-complete-mode)
;; (add-hook 'arduino-mode-hook
;;          (lambda ()
;;            (local-set-key (kbd "M-,") 'pop-tag-mark)))
;; 태그는 etags 기능을 써야하는듯 합니다 terminal >> etags *.ino

;; highlight symbol mode를 활성화합니다
(require 'highlight-symbol)
(add-hook 'c-mode-hook 'highlight-symbol-mode)
(add-hook 'c++-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

;; hs-minor-mode 를 활성화합니다. 코드를 접엇다 펼쳤다 하는 모드
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; PACKAGE: multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;; C + v 키로 multi-term 모드에서 붙여넣기를 설정한다
;; multi-term은 term-mode를 사용하므로
(add-hook 'term-mode-hook
          (lambda ()
            (cua-mode)

            (define-key term-raw-map (kbd "C-b") nil)
            (define-key term-raw-map (kbd "C-q") nil)
            (define-key term-raw-map (kbd "<S-insert>") nil)

            (define-key term-raw-map (kbd "C-b") 'helm-for-files)
            (define-key term-mode-map (kbd "C-b") 'helm-for-files)
            ))

;; C-c u 키로 cua-mode를 껐다 켰다 합니다
;; multi-term을 사용하면 .cpp 버퍼에서 C-c : copy(cua-mode)가 안먹히는 버그가 있는데 이 때 사용하기 위한 단축키
(global-set-key (kbd "C-C u") (lambda ()
                                (interactive)
                                (cua-mode -1)
                                (cua-mode 1)
                                (message "[+] cua-mode restarted..")
                                ))

;; revert buffer를 파라미터와 같이 함수화한 코드
(defun my-revert-buffer()
  (interactive)
  (revert-buffer t t t)
  (message "[+] this buffer reverted..")
  )

;; Ctrl + \ 키로 현재 버퍼를 업데이트합니다
(global-set-key (kbd "C-\\") 'my-revert-buffer)
(define-key undo-tree-map (kbd "C-\\") 'my-revert-buffer)

;; C-n C-S-n 키로 새로운 frame을 만들고 제거합니다
(global-set-key (kbd "C-n") 'make-frame-command)
(global-set-key (kbd "C-S-n") 'delete-frame)


;; PACKAGE: protobuf-mode
(require 'protobuf-mode)


;; Variable Customizing
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(async-bytecomp-allowed-packages (quote (async helm helm-core helm-ls-git helm-ls-hg magit)))
 '(auto-hscroll-mode t)
 '(avy-keys
   (quote
    (97 115 100 102 103 104 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122)))
 '(avy-style (quote at-full))
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-irony company-nxml company-css company-eclim company-clang company-xcode company-cmake company-capf company-files
                   (company-dabbrev-code company-gtags company-etags company-keywords)
                   company-oddmuse company-dabbrev)))
 '(company-idle-delay 0.3)
 '(cua-mode t nil (cua-base))
 '(custom-enable-theme (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(display-time-mode t)
 '(ecb-layout-name "right1")
 '(ecb-layout-window-sizes
   (quote
    (("right1"
      (ecb-directories-buffer-name 0.3151515151515151 . 0.20833333333333334)
      (ecb-sources-buffer-name 0.3151515151515151 . 0.2916666666666667)
      (ecb-methods-buffer-name 0.3151515151515151 . 0.4791666666666667))
     ("left14"
      (ecb-directories-buffer-name 0.271523178807947 . 0.7317073170731707)
      (ecb-history-buffer-name 0.271523178807947 . 0.24390243902439024)))))
 '(ecb-options-version "2.50")
 '(ecb-tip-of-the-day nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(find-file-visit-truename t)
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "▸")
 '(helm-bookmark-show-location t)
 '(org-agenda-files
   (quote
    ("~/gitrepo/ims_org/org_files/note/dl_tensorflow.org" "~/gitrepo/ims_org/org_files/note/dl_network_model.org" "~/gitrepo/ims_org/org_files/note/dl_core_concept.org" "~/gitrepo/ims_org/org_files/note/paper_research.org" "~/gitrepo/ims_org/org_files/link.org" "~/gitrepo/ims_org/org_files/note/cmake.org" "~/gitrepo/ims_org/org_files/project_parkable.org" "~/gitrepo/ims_org/org_files/emacs.org" "~/gitrepo/ims_org/org_files/note/ubuntu_tips.org" "~/gitrepo/ims_org/org_files/note/snu_interviews.org" "~/gitrepo/ims_org/org_files/note/jupyter_notebook_remote.org" "~/gitrepo/ims_org/org_files/note/algorithm.org" "~/gitrepo/ims_org/org_files/edward.org" "~/gitrepo/ims_org/org_files/dyros.org" "~/gitrepo/ims_org/org_files/gcal.org" "~/gitrepo/ims_org/org_files/project_cartographer.org")))
 '(org-bullets-bullet-list (quote ("●" "◉" "▸" "✸")))
 '(org-capture-after-finalize-hook nil)
 '(org-capture-before-finalize-hook (quote (org-gcal--capture-post)) t)
 '(org-capture-bookmark nil)
 '(org-capture-prepare-finalize-hook
   (quote
    ((lambda nil
       (goto-line
        (+
         (line-number-at-pos)
         -2))
       (beginning-of-line)
       (insert "*"))
     (lambda nil
       (progn
         (setq num 1)
         (loop
          (< num 500)
          (let
              ((numbering
                (concat "#"
                        (number-to-string num)))
               (content
                (with-current-buffer
                    (cadr
                     (split-string
                      (buffer-name)
                      "-"))
                  (buffer-substring-no-properties
                   (point-min)
                   (point-max))))
               (capture_content
                (with-current-buffer
                    (buffer-name)
                  (buffer-substring-no-properties
                   (point-min)
                   (point-max)))))
            (if
                (string-match "[*][*][*][*]" capture_content)
                (if
                    (save-excursion
                      (goto-char
                       (point-min))
                      (string-match numbering content))
                    nil
                  (return
                   (progn
                     (end-of-line)
                     (insert numbering))))
              (return))
            (setq num
                  (1+ num)))))))))
 '(org-default-priority 67)
 '(org-gcal-auto-archive nil)
 '(org-hide-emphasis-markers t)
 '(org-lowest-priority 69)
 '(org-scheduled-delay-days 0)
 '(org-tags-column 50)
 '(org-time-stamp-custom-formats (quote ("[%m/%d/%y %a]" . "[%m/%d/%y %a %H:%M]")))
 '(package-selected-packages
   (quote
    (image+ sr-speedbar org-gcal company-irony irony mic-paren htmlize org-preview-html jedi-direx yasnippet ws-butler undo-tree solarized-theme smartparens rainbow-delimiters key-chord jedi highlight-indentation helm-swoop helm-projectile helm-gtags google-c-style flycheck ess ecb duplicate-thing dtrt-indent clean-aindent-mode arduino-mode anzu)))
 '(safe-local-variable-values
   (quote
    ((eval font-lock-add-keywords nil
           (\`
            (((\,
               (concat "("
                       (regexp-opt
                        (quote
                         ("sp-do-move-op" "sp-do-move-cl" "sp-do-put-op" "sp-do-put-cl" "sp-do-del-op" "sp-do-del-cl"))
                        t)
                       "\\_>"))
              1
              (quote font-lock-variable-name-face))))))))
 '(sml/mode-width
   (if
       (eq
        (powerline-current-separator)
        (quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active1)
                   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   (quote sml/global)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
                  (quote display)
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   (quote powerline-active2)
                   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(sp-base-key-bindings nil)
 '(speedbar-update-flag t)
 '(vc-follow-symlinks t)
 '(yas-also-auto-indent-first-line t)
 '(yas-also-indent-empty-lines t))

;; Custom Face + 영어폰트 설정  (height 부분을 바꾸면 크기가 바뀝니다)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "PfEd" :slant normal :weight normal :height 136 :width normal))))
 '(avy-lead-face ((t (:inherit isearch :background "gold"))))
 '(avy-lead-face-0 ((t (:inherit isearch :background "gold"))))
 '(avy-lead-face-1 ((((class color) (min-colors 89)) (:inherit isearch :background "#cb4b16"))))
 '(avy-lead-face-2 ((t (:inherit isearch :background "orange"))))
 '(diff-added ((t (:background "dark olive green" :foreground "white smoke"))))
 '(diff-hunk-header ((t (:inherit diff-header :background "black"))))
 '(diff-refine-added ((t (:background "olive drab"))))
 '(diff-refine-changed ((t (:background "nil"))))
 '(diff-refine-removed ((t (:background "firebrick"))))
 '(diff-removed ((t (:background "brown" :foreground "white smoke"))))
 '(ein:cell-input-area ((t (:background "black"))))
 '(ein:cell-input-prompt ((t (:inherit header-line :foreground "deep sky blue"))))
 '(ein:cell-output-prompt ((t (:inherit header-line :foreground "red"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "forest green"))))
 '(font-lock-comment-face ((t (:foreground "forest green"))))
 '(hi-blue ((t (:background "blue" :foreground "#5c95b9"))))
 '(hi-blue-b ((t (:background "cyan" :foreground "#49a19a" :weight bold))))
 '(hi-green ((t (:background "green" :foreground "#8c9d50"))))
 '(hi-green-b ((t (:background "chartreuse" :foreground "#899b30" :weight bold))))
 '(hi-pink ((t (:background "pink" :foreground "#b36b91"))))
 '(hi-red-b ((t (:background "orange" :foreground "#c65351" :weight bold))))
 '(hi-yellow ((t (:background "yellow" :foreground "#a39450"))))
 '(highlight ((t (:background "grey"))))
 '(magit-diff-hunk-heading ((t (:background "black"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "black"))))
 '(org-agenda-calendar-event ((t (:foreground "#586e75"))))
 '(org-agenda-date ((t (:background "dim gray" :foreground "black" :inverse-video nil :box (:line-width 2 :color "#002b36") :overline nil :slant normal :weight normal :height 1.0))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "black" :inverse-video nil :overline nil :underline t))))
 '(org-block ((t (:background "gray13" :foreground "dark gray"))))
 '(org-block-begin-line ((t (:background "gray13" :foreground "gray13" :weight bold))))
 '(org-block-end-line ((t (:background "gray13" :foreground "gray13" :weight bold))))
 '(org-date ((t (:foreground "dark gray" :underline nil :weight normal))))
 '(org-link ((t (:foreground "#b58900" :box nil :underline t :weight bold))))
 '(org-meta-line ((t (:foreground "#586e75" :slant normal))))
 '(org-priority ((t (:inherit font-lock-keyword-face :foreground "gray"))))
 '(org-scheduled ((t (:foreground "#268bd2"))))
 '(org-scheduled-previously ((t (:foreground "#586e75"))))
 '(org-scheduled-today ((t (:foreground "#859900" :weight normal))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#586e75" :weight bold))))
 '(org-tag ((t (:foreground "dim gray" :weight bold :height 0.8)))))





;; 다중모니터에서 C-x-5-2를 통해서 새로운 frame을 생성한 다음에 모니터가 작아서 폰트사이즈가 작은 경우 폰트크기를 크게하기 위해 설정한 함수
;; https://stackoverflow.com/questions/24705984/increase-decrease-font-size-in-an-emacs-frame-not-just-buffer
(defun zoom-frame (&optional n frame amt)
  "Increase the default size of text by AMT inside FRAME N times.
  N can be given as a prefix arg.
  AMT will default to 10.
  FRAME will default the selected frame."
  (interactive "p")
  (let ((frame (or frame (selected-frame)))
        (height (+ (face-attribute 'default :height frame) (* n (or amt 5)))))
    (set-face-attribute 'default frame :height height)
    (message "Set frame's default text height to %d." height)))

(defun zoom-frame-out (&optional n frame amt)
  "Call `zoom-frame' with -N."
  (interactive "p")
  (zoom-frame (- n) frame amt))


;; C + -,= 키로 새로 생성한 프레임의 폰트가 작을 경우 크기를 키우거나 줄일 수 있다
(global-set-key (kbd "C-=") 'zoom-frame)
(global-set-key (kbd "C--") 'zoom-frame-out)
(define-key c++-mode-map (kbd "C-=") 'zoom-frame)
(define-key c++-mode-map (kbd "C--") 'zoom-frame-out)



;;GUI 환경에서 시작 시 창 화면 최대화 하기
(add-to-list 'default-frame-alist '(fullscreen . maximized))(add-to-list 'default-frame-alist '(height . 31))
(add-to-list 'default-frame-alist '(width . 100))
(set-frame-position (selected-frame) 0 0)

;; 매칭되는 괄호 강조하기
;;show paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

;; 시작화면 스킵하고 기본 모드 설정하기
(setq inhibit-startup-screen t)

;; 상태표시줄에 시간표시하기
(display-time)

;; 몇가지 유용한 설정
(transient-mark-mode t)
(global-set-key [C-kanji] 'set-mark-command)

;;파일 편집 위치 기억
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file     "~/_places.sav")

;;최근 파일 접근
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 20) ; 최근 파일 목록 수

;;GUI 환경에서 줄 간격 조절
(setq-default line-spacing 1)

;;파일이 수정되었을 때 자동으로 다시 읽어들이도록 하는 설정
(global-auto-revert-mode t)

;;linum 모드 켜기 (줄번호 표시하기)
(global-linum-mode t)

;; 계산기 자릿수 분리기호 삽입 calc EMACS 기본 계산기 모드에서 자릿수 분리기호 삽입
(setq calc-group-digits t)

;;시작 화면 메세지 끄기
(setq initial-scratch-message "")

;;시작 모드를 text모드로 시작하기. 보통은 LISP Interaction 상태.
(setq initial-major-mode 'emacs-lisp-mode)

;;블럭 선택부분 색상 반전시키기
(setq-default transient-mark-mode t)

;;status bar에 줄 번호, 칼럼 번호 표시
(setq line-number-mode t)
(setq column-number-mode t)

;;백업파일 만들지 않기, ( #Readmin.md# )
(setq make-backup-files nil)

;;자동 저장 기능 끄기  ( Readme.md~ )
(setq auto-save-default nil)

;; interlocking 파일 생성 끄기 ( .#Readme.md )
(setq create-lockfiles nil)

;; 모든 자동저장, 백업파일을 tmp 폴더에 만들기
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;;하단 스크롤시에 빈 줄 추가 하지 않기.
;;보통은 스크롤이 맨 끝까지 가면 자동으로 빈 줄이 추가 된다.
(setq next-line-add-newlines nil)

;;하단 스크롤시 1줄씩만 스크롤 되도록 하기.
(setq scroll-step 1)

;;페이지 넘길 때 3줄은 포함.
(setq next-screen-context-lines 3)

;;찾기 기능에서 하이라이트 설정
(setq search-highlight t)

;;상단 메뉴 숨기기
(menu-bar-mode 0)

;;도구 모음 숨기기
(tool-bar-mode 0)

;;스크롤바 숨기기
(scroll-bar-mode 0)

;;줄 바꿈 칼럼수 설정.
(setq-default fill-column 120)

;;날짜 삽입하기. 편집 할 때
(defun today ()
  "Insert Date YYYY-MM-DD"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;;날짜 삽입 단축키 (편집 시)
(global-set-key "\M-\pd" 'today)

;;날짜 삽입하기. 저장 할 때
(defun today1 ()
  "Insert Date YYMMDD00"
  (interactive)
  (insert (format-time-string "%y%m%d00")))

;;Dired모드에서 디렉토리 우선 정렬로 보기 (기본은 지원 안함)
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2)
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'sof/dired-sort)

;; dired mode에서 여러 단축키들을 설정하는 코드
(eval-after-load "dired" '(progn
                            ;; dired mode : Move to the parent directory
                            (define-key dired-mode-map "a"
                              (lambda ()
                                (interactive)
                                (find-alternate-file "..")))

                            ;; dired mode 관련 단축키들을 추가했다
                            ;; dired mode : Emacs's adaption of find
                            (define-key dired-mode-map "F" 'find-name-dired);

                            ;; dired mode : Move up and down
                            (define-key dired-mode-map "j" 'dired-next-line)
                            (define-key dired-mode-map "k" 'dired-previous-line);

                            ;; dired mode : Jump to a file with ido
                            (define-key dired-mode-map "i" 'ido-find-file)

                            ;; dired mode 에서 chmod를 바로 수행하고 싶을 경우 M키를 눌러서 합니다
                            (define-key dired-mode-map "M" 'chmod)

                            ;; dired mode 에서 /키를 검색키로 설정합니다
                            (define-key dired-mode-map "/" 'isearch-forward)
                            ))

;; 엔터 입력시 자동 들여쓰기 다른 방법
(load "cc-mode")
(define-key c++-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key c-mode-map "\r" 'reindent-then-newline-and-indent)
(define-key java-mode-map "\r" 'reindent-then-newline-and-indent)

;;emacs tab 설정
(setq c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)

;; 탭 대신 공백 넣기
(setq-default indent-tabs-mode nil)

;;최근 사용된 word list를 가지고, 자동 완성구현, 3글자 이후에 M-RET
(dynamic-completion-mode)

;; PACKAGE: mic-paren
;; 반대편 괄호의 line number를 알려주는 패키지
(require 'mic-paren) ; loading
(paren-activate)     ; activating
;; offscreen parenthesis의 경우 반대쪽 괄호의 라인정보를 알려준다
(setq paren-message-show-linenumber "absolute")

(defun set-default-programming-style ()
  ;; 엔터 입력시 들여쓰기
  (local-set-key (kbd "<return>") 'newline-and-indent)

  ;; 탭키 입력시 영역지정되어 있으면 영역 들여쓰기. 영역없으면 탭키.
  (local-set-key (kbd "<tab>") 'indent-block)

  ;; 들여쓰기 할 때 실제 탭문자 입력
  (setq indent-tabs-mode t)

  ;; 탭 사이즈 4
  (setq tab-width 4)

  ;; 줄번호 표시
  (linum-mode 1)
  )

;; PACKAGE: ECB Emacs Code Browser
(require 'ecb)

;; ECB tree view에서 F3 키가 ecb-show-help로 키바인딩되어있는 것을 해제해준다
(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (local-unset-key [f3])
            ))
(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (local-unset-key [f3])
            ))

;; path를 입력하면 그곳에서 TAGS 파일을 생성해주는 함수 (NOT USED)
(defun make_TAGS_file (&optional path)
  "make TAGS file"
  (interactive (list (read-file-name "path to make TAGS : " default-directory)))
  (with-temp-buffer
    (shell-command (concat "find " (concat path) (concat " -print | etags - *.{cpp,h,c,cc,hpp,py,el}")) t))
  )

;; 현재 위치에서 TAGS 파일을 생성해주는 함수
(defun make_TAGS_file_auto (&optional path)
  "make TAGS file automatically"
  (interactive)
  (with-temp-buffer
    (shell-command (concat "find " default-directory (concat " -print | etags - *.{cpp,h,c,cc,hpp,py,el}")) t))
  )

;; M-? 키를 이용해 자동으로 GTAGS && TAGS file을 만든다.
(global-set-key (kbd "M-?") '(lambda ()
                               (interactive)
                               (make_TAGS_file_auto)
                               (helm-gtags-create-tags default-directory "default")
                               ))


;; PACKAGE: google-c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)


;; C언어 모드에서 자동정렬 (들여쓰기 스타일)
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "google")))


;;C++ 모드 자동정렬 (들여쓰기 스타일)
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "google")))


;; 영어 대문자, 소문자를 토글해주는 함수
(defun xah-toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Always cycle in this order: Init Caps, ALL CAPS, all lower.
URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
Version 2017-04-19"
  (interactive)
  (let (
        (deactivate-mark nil)
        $p1 $p2)
    (if (use-region-p)
        (setq $p1 (region-beginning)
              $p2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alnum:]-_")
        (setq $p1 (point))
        (skip-chars-forward "[:alnum:]-_")
        (setq $p2 (point))))
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (upcase-initials-region $p1 $p2)
      (put this-command 'state 1))
     ((equal 1  (get this-command 'state))
      (upcase-region $p1 $p2)
      (put this-command 'state 2))
     ((equal 2 (get this-command 'state))
      (downcase-region $p1 $p2)
      (put this-command 'state 0)))))


;; Alt + = 키로 region 영역에 영어단어를 대문자, 소문자, 앞에만 대문자 형식으로 토글해줍니다
(global-set-key (kbd "M-u") 'xah-toggle-letter-case)

;;f1 이전 버퍼창 이동
(global-set-key [f1] 'previous-buffer)

;;f2 다음 버퍼창 이동
(global-set-key [f2] 'next-buffer)

;; f3, C-left, C-right  윈도우 창 이동
(global-set-key [f3] 'next-multiframe-window)

(global-set-key (kbd "<M-right>") 'next-multiframe-window)
(global-set-key (kbd "<M-down>") 'next-multiframe-window)
(global-set-key (kbd "<M-left>") 'previous-multiframe-window)
(global-set-key (kbd "<M-up>") 'previous-multiframe-window)

;; F4 또는 M-] 키로 파일 탐색기 Dired 모드 켜기
(global-set-key [f4] 'dired)

;; 단어 하이라이트(특정 단어만 색깔강조하기)
(global-set-key [f5] 'highlight-symbol)

;; 단어 하이라이트 모두 지우기
(global-set-key (kbd "<C-f5>") 'highlight-symbol-remove-all)

;; ECB 시작
(global-set-key [f6] 'ecb-minor-mode)

;; 컴파일 단축키
(global-set-key [f7] 'compile)

;; 디버깅 단축키
(global-set-key [f8] 'gdb)

;; f9 소스창에서 바로 브레이크포인트 설정
(global-set-key [f9] 'gud-break)

;; shift + f9 키로 gud를 실행한다
(global-set-key [(shift f9)] 'gud-run)

;; f10 라인 실행하고 다음 라인으로
(global-set-key [f10] 'gud-next)

;; f11 함수안으로 따라 들어간다
(global-set-key [f11] 'gud-step)

;; f12 현재 실행중인 함수 리턴후 멈춤
(global-set-key [f12] 'gud-finish)

;; shift + f10 현재 커서까지 실행하고 멈춤
(global-set-key [(shift f10)] '(lambda ()
                                 (interactive)
                                 (call-interactively 'gud-tbreak)
                                 (call-interactively 'gud-cont)))

(defun gdb-setup-windows-default ()
  "Layout the window pattern for option `gdb-many-windows'."
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil ( / ( * (window-height) 3) 4)))
        (win2 (split-window nil ( / (window-height) 3)))
        (win3 (split-window-right)))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win4 (split-window-right)))
      (gdb-set-window-buffer
       (gdb-get-buffer-create 'gdb-inferior-io) nil win4))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

;; custom gdb 창을 바꿔주는 함수들
(defun my-gdb-setup-windows1 ()
  "Restore GUD buffer, IO buffer and source buffer next to each other.
;; http://dschrempf.github.io/posts/Emacs/2015-06-24-Debugging-with-Emacs-and-GDB.html#orgb894a48
"
  (interactive)
  ;; Select dedicated GUD buffer.
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (set-window-dedicated-p (get-buffer-window) t)
  (when (or gud-last-last-frame gdb-show-main)
    (let ((side-win (split-window nil nil t))
          (bottom-win (split-window)))
      ;; Put source to the right.
      (set-window-buffer
       side-win
       (if gud-last-last-frame
           (gud-find-file (car gud-last-last-frame))
         (gud-find-file gdb-main-file)))
      (setq gdb-source-window side-win)
      ;; Show dedicated IO buffer below.
      (set-window-buffer
       bottom-win
       (gdb-get-buffer-create 'gdb-inferior-io))
      (set-window-dedicated-p bottom-win t)
      )))

(defun my-gdb-setup-windows2 ()
  (interactive)
  "Layout the window pattern for option `gdb-many-windows'.
;; https://github.com/saogog123456/.emacs.d/blob/e065ad86fa548d67a114f222154e6e2f399ad4c8/core/neoclear-window.el
"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (gdb-get-buffer-create 'gdb-inferior-io)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-height) 3) 4)))
        (win2 (split-window-right (/ (* (window-width) 2) 6))))
    (gdb-set-window-buffer (gdb-locals-buffer-name) nil win1)
    (set-window-buffer win2
                       (if gud-last-last-frame
                           (gud-find-file (car gud-last-last-frame))
                         (if gdb-main-file
                             (gud-find-file gdb-main-file)
                           ;; Put buffer list in window if we
                           ;; can't find a source file.
                           (list-buffers-noselect))))
    (select-window win1)
    (let ((win3 (split-window-right (/ (* (window-width) 3) 5)))
          (win4 (split-window-right (/ (* (window-width) 3) 5))))
      (gdb-set-window-buffer (gdb-breakpoints-buffer-name) nil win3)
      (gdb-set-window-buffer (gdb-stack-buffer-name) nil win4))
    (select-window win2)
    (setq gdb-source-window (selected-window))
    (select-window win0)
    (let ((win5 (split-window nil (/ (* (window-height) 3) 5))))
      (gdb-set-window-buffer (gdb-inferior-io-name) nil win5))
    (select-window win2)))

(defun my-gdb-setup-windows3 ()
  (interactive)
  "my gdb ui,fix sizes of every buffer
;; https://github.com/shanhaiying/.emacs.d-1/blob/b5e126649887f9099b0320c3432f719c52278e02/lisp/init-cc-mode.el
"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (gdb-get-buffer-create 'gdb-breakpoints-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (setq gud-gdb-buffer-width (/ (* (window-width) 3) 4)) ;for input/output buffer and locals buffer of gud mode
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-height) 8) 10)))
        (win2 (split-window nil (/ (* (window-height) 3) 8)))
        ;; (win3 (split-window nil (- (/ (* (window-width) 2) 3) 1) 'right))
        (win3 (split-window nil gud-gdb-buffer-width 'right)) ;input/output
	)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3)
    (select-window win2)
    (set-window-buffer
     win2
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win4 (split-window nil gud-gdb-buffer-width 'right))) ;locals
      (gdb-set-window-buffer (gdb-locals-buffer-name) nil win4))
    (select-window win1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (let ((win5 (split-window-right)))
      (gdb-set-window-buffer (if gdb-show-threads-by-default
                                 (gdb-threads-buffer-name)
                               (gdb-breakpoints-buffer-name))
                             nil win5))
    (select-window win0)))

(defun my-gdb-setup-windows4 ()
  (interactive)
  "my gdb ui, just source,gdb,io,stack buffers"
  (gdb-get-buffer-create 'gdb-locals-buffer)
  (gdb-get-buffer-create 'gdb-stack-buffer)
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let ((win0 (selected-window))
        (win1 (split-window nil (/ (* (window-width) 1) 2) 'left))                     ;code and output
        (win2 (split-window-below (/ (* (window-height) 3) 4))) ;stack
        )
    (select-window win2)
    (gdb-set-window-buffer (gdb-stack-buffer-name))
    (select-window win1)
    (set-window-buffer
     win1
     (if gud-last-last-frame
         (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
           (gud-find-file gdb-main-file)
         ;; Put buffer list in window if we
         ;; can't find a source file.
         (list-buffers-noselect))))
    (setq gdb-source-window (selected-window))
    (let ((win3 (split-window nil (/ (* (window-height) 3) 4)))) ;io
      (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io) nil win3)) ;gdb-inferior-io
    ;; (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-locals-buffer) nil win3)
    (select-window win0)
    ))

(defun my-gdb-setup-windows5 ()
  "https://stackoverflow.com/questions/39762833/emacsgdb-customization-how-to-display-source-buffer-in-one-window
"
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let
      ((win0 (selected-window))             ; breakpoints ==> Speedbar Watch Expression
       (win1 (split-window-horizontally
              (floor (* 0.4 (window-width)))))   ; source + i/o
       (win2 (split-window-vertically
              (floor (* 0.5 (window-body-height))))) ; gdb
       (win3 (split-window-vertically
              (floor (* 0.5 (window-body-height))))) ; locals
       ;; (win4 (split-window-vertically
       ;;     (floor (* 0.6 (window-body-height))))) ; stack
       )
    (select-window win1)
                                        ; configurating right window
    (let
        ((winSrc (selected-window)) ; source
         (winIO (split-window-vertically (floor (* 0.9 (window-body-height))))) ; I/O
         )
      (set-window-buffer winIO (gdb-get-buffer-create 'gdb-inferior-io))
      (set-window-buffer winSrc
                         (if gud-last-last-frame
                             (gud-find-file (car gud-last-last-frame))
                           (if gdb-main-file
                               (gud-find-file gdb-main-file)
                             (list-buffers-noselect))))
      (setq gdb-source-window winSrc)
      (set-window-dedicated-p winIO t)
      ;; ed: Stack Frame added
      (select-window winIO)
      (let
          ((winStack (split-window-horizontally (floor (* 15 (window-body-height))))) ;; ed: Stack buffer added
           )
        (set-window-buffer winStack (gdb-get-buffer-create 'gdb-stack-buffer)) ;; ed: Stack buffer added
        ))
    ;; (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (if (get-buffer " SPEEDBAR")
        (set-window-buffer win0 " SPEEDBAR")
      (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
      )
    ;; ed: " SPEEDBAR"" 추가!
    (set-window-buffer win3 (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-buffer win4 (gdb-get-buffer-create 'gdb-stack-buffer))
    (select-window win2)
    )
  )

(defun my-gdb-settings-toggle ()
  "처음으로 직접 만들어 본 elips defun
gdb-setup-windows 함수들을 순차적으로 불러온다
created by edward 180515"
  (interactive)
  (let ()
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (gdb-setup-windows-default)
      (message "[+] Setting my-gdb-setup-default...")
      (put this-command 'state 1))
     ((equal 1 (get this-command 'state))
      (my-gdb-setup-windows1)
      (message "[+] Setting my-gdb-setup-windows1...")
      (put this-command 'state 2))
     ((equal 2  (get this-command 'state))
      (my-gdb-setup-windows2)
      (message "[+] Setting my-gdb-setup-windows2...")
      (put this-command 'state 3))
     ((equal 3 (get this-command 'state))
      (my-gdb-setup-windows3)
      (message "[+] Setting my-gdb-setup-windows3...")
      (put this-command 'state 4))
     ((equal 4 (get this-command 'state))
      (my-gdb-setup-windows4)
      (message "[+] Setting my-gdb-setup-windows4...")
      (put this-command 'state 5))
     ((equal 5 (get this-command 'state))
      (my-gdb-setup-windows5)
      (message "[+] Setting my-gdb-setup-windows5...")
      (put this-command 'state 0))
     )))



;; 처음 F8로 시작할 때 생성되는 창을 설정하는 함수 (my-gdb-setup-windows5) 로 설정했다
;; defadvice로 설정하는 것인듯
(defadvice gdb-setup-windows (around setup-more-gdb-windows activate)
  (my-gdb-setup-windows5)
  )

;; shift + f12 gdb 다중창 On/Off
(global-set-key [(shift f12)] 'gdb-many-windows)

;; shift + f11 키로 gdb의 layout을 변경합니다
(global-set-key [(shift f11)] 'my-gdb-settings-toggle)

;; gdb variables
(setq gdb-show-changed-values t)
(setq gdb-use-colon-colon-notation t)
(setq gdb-use-separate-io-buffer nil)
(setq gdb-delete-out-of-scope t)
(setq gdb-speedbar-auto-raise t)

;; gdb 다중창 설정
(setq gdb-many-windows t)
(setq gdb-show-main t)

;; gdb 명령어 설정
(setq gud-gdb-command-name "gdb -q -i=mi --args")

;; gdb를 실행하고 나서 환경설정 코드
(eval-after-load "gud"
  '(progn
     ;; C-M-w 키로 gud-watch 명령을 실행합니다
     (define-key gud-minor-mode-map (kbd "C-M-w") 'gud-watch)
     ))

;; compile 명령어 수정 (c++일 경우 g++, c일 경우 gcc로 해주면 됩니다)
(setq compile-command "g++ -m64 -std=c++11 -g -o ")


;; eyebrowse 모드에서 C-1,2,3키로 워크스페이스를 변경합니다 (not used)
;; (global-set-key (kbd "C-1") 'eyebrowse-switch-to-window-config-0)
;; (global-set-key (kbd "C-2") 'eyebrowse-switch-to-window-config-1)
;; (global-set-key (kbd "C-3") 'eyebrowse-switch-to-window-config-2)
;; Ctrl + 4 키로 .md 파일을 파이어폭스로 프리뷰합니다 (not used)
;; (global-set-key (kbd "C-4") 'flymd-flyit)

;; C-4 키로 *scratch* buffer를 생성하고 이동합니다
(global-set-key (kbd "C-4") 'create-scratch-buffer)

;; C-5 키로 다른 프로젝트로 스위치하는 명령어를 실행합니다
(global-set-key (kbd "C-5") 'helm-projectile-switch-project)
;; helm-projectile-switch-project (C-5) 로 프로젝트를 바꾼 다음 실행하는 명령어로
;;                                         바뀐 프로젝트의 홈폴더에서 dired 모드를 실행합니다
(setq projectile-switch-project-action 'projectile-dired)

;; Ctrl + ^키로 jupyter notebook 서버를 실행합니다
(global-set-key (kbd "C-^") 'ein:jupyter-server-start)

;; Ctrl + 6키로 remote 접속을 위한 notebooklist-login 명령어를 설정합니다
(global-set-key (kbd "C-6") 'ein:notebooklist-login)

;; Ctrl + 7 키로 선택한 버퍼를 닫습니다
(global-set-key (kbd "C-7") 'buffer-menu)

;; kill-this-buffer가 가끔 menu-bar-mode 때문에 실행되지 않는 경우가 있는데
;; 이를 방지하기 위해 직접 제작한 함수
(defun my-kill-this-buffer ()
  (interactive)
  (menu-bar-mode 1)
  (kill-this-buffer)
  (menu-bar-mode -1)
  )

;; Ctrl + 8 키로 현재 버퍼를 닫습니다
(global-set-key (kbd "C-8") 'my-kill-this-buffer)

;; Ctrl + 9 키로 Customize Variable 명령어를 사용한다
(global-set-key (kbd "C-9") 'pwd)

;; Ctrl + 0 키로 Customize Variable 명령어를 사용한다
(global-set-key (kbd "C-0") 'customize-variable)

;; Alt + 1 키로 shell을 불러오는 커맨드를 실행합니다
(global-set-key (kbd "M-1") 'shell-command)

;; Alt + 2 키로 multi terminal을 실행합니다
(global-set-key (kbd "M-2") 'multi-term)

;; Alt + 3 키로 flycheck 기능을 ON/OFF합니다
(global-set-key (kbd "M-3") 'global-flycheck-mode)

;; Alt + 4 키로 projectile에 project를 추가합니다
(global-set-key (kbd "M-4") 'projectile-add-known-project)

;; Alt + 5 키로 projectile에 project를 제거합니다
(global-set-key (kbd "M-5") 'projectile-remove-known-project)

;; Alt + 6키로 remote 접속을 위한 notebooklist-open 명령어를 설정합니다
(global-set-key (kbd "M-6") 'ein:notebooklist-open)

;; edebug defun을 ctrl + b로 설정한다
;; (global-set-key "\C-b" 'edebug-defun)

;; Ctrl + q 키로 현재 창 남기고 나머지 창 모두 닫기
(global-set-key "\C-q" 'delete-other-windows)

;; Alt + q 키로 현재 창을 닫습니다
(global-set-key "\M-q" 'delete-window)
(define-key c++-mode-map (kbd "M-q") 'delete-window)

;; Ctrl + tab 키를 한/영키로
(global-unset-key (kbd "S-SPC"))
(global-unset-key (kbd "C-S-SPC"))
(global-set-key [(control tab)] 'toggle-input-method)

;;잘라내기, 붙여넣기, CTRL+C, V를 활성화 시켜준다.
(cua-mode)

;;북 마크에 저장 하기 Alt + b
(global-set-key (kbd "M-b") 'bookmark-set)

;; 북마크 삭제 Ctrl + Alt + b
(global-set-key (kbd "C-M-b") 'bookmark-delete)

;;북 마크 열기 Alt + v
(global-set-key (kbd "M-v") 'bookmark-jump)
(define-key cua--cua-keys-keymap (kbd "M-v") 'bookmark-jump)

;;줄번호 이동(C-i)
(global-set-key (kbd "H-i") 'goto-line)

;; Ctrl + k 키로 해당 커서의 한 줄 전체를 지웁니다
(global-set-key "\C-k" 'kill-whole-line)

;; 현재 커서로부터 맨 아래까지 라인을 지우는 함수
(defun kill-to-end-of-buffer() "Deletes all lines after the current line"
  (interactive)
  (progn
    (forward-line 1)
    (delete-region (point) (point-max))))

;; Ctrl + Shift + k 키로 현재 커서부터 아래 라인을 모두 지웁니다
(global-set-key (kbd "C-S-k") 'kill-to-end-of-buffer)


;; Ctrl + j 키로 해당 커서의 오른쪽부분만 삭제합니다
(global-set-key (kbd "C-j") 'kill-visual-line)
(define-key org-mode-map (kbd "C-j") 'kill-visual-line)

;; Ctrl + a 키로 전체선택하게 합니다
(global-set-key "\C-a" 'mark-whole-buffer)

;; Ctrl + w 키로 해당 버퍼를 저장합니다
(global-set-key "\C-w" 'save-buffer)

;; Ctrl + Shift + w 키로 모든 버퍼를 저장합니다
(defun save-all () (interactive)
       (save-some-buffers t)
       (message "[+] saving all buffers..."))
(global-set-key (kbd "C-M-w") 'save-all)

;; 랜덤한 string을 생성하는 함수 (not used)
(defun random-alpha ()
  (let* ((alnum "abcdefghijklmnopqrstuvwxyz")
         (i (% (abs (random)) (length alnum))))
    (substring alnum i (1+ i))))

;; 현재 버퍼의 파일을 임의로 /tmp 폴더에 저장하는 함수
(defun copy-buffer-to-file ()
  (interactive)
  (let ((bufname (concat "/tmp/" (concat (format-time-string "%Y%m%d_%T")
                                         "_"
                                         (buffer-name)
                                         ))))
    (write-region (point-min) (point-max) bufname t)
    (message (concat "[+] saving a temp file in " bufname))))

;; C-c + ' 키를 사용해 현재 버퍼를 /tmp 폴더에 임의의 5개 랜덤글자 파일로 저장한다
(global-set-key (kbd "C-c '") 'copy-buffer-to-file)


;; Alt + e 키로 현재 커서의 라인 맨 앞칸으로 이동합니다
(global-set-key (kbd "M-e") 'move-beginning-of-line)
(add-hook 'c-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-e") 'move-beginning-of-line))
          )
(add-hook 'c++-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-e") 'move-beginning-of-line))
          )

;; Ctrl + p 키로 grep 명령어를 실행합니다
(global-set-key (kbd "C-p") 'grep-find)

;; grep-find 기본 명령어를 아래와 같이 수정합니다
;;(setq grep-find-template
;;"find . <X> -type f <F> -exec grep <C> -nH -ie <R> \\{\\} +")
;;"find . -type f -exec grep --exclude=*{ph.h, rviz, rst} --include={cpp,c,h,py} -nH -ie   {} +" 같이 확장자를 필터링할 수 있다
(grep-apply-setting 'grep-find-command '("find . -type f -exec grep -nH -ie   {} +" . 35))

;; Ctrl + ; 키로 find file 파일이 존재하는지 검색합니다
(global-set-key (kbd "C-;") 'helm-find)

;; Ctrl + ' 키로 find dir 폴더가 존재하는지 검색합니다
(global-set-key (kbd "C-'") 'helm-projectile-find-dir)

;; c++ 주석 처리 변경 코드 (// -> /* */ 로 변경한다)
(add-hook 'c++-mode-hook (lambda () (setq comment-start "/* "
                                          comment-end   "*/")))

;; 괄호 사이를 이동하는 코드
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(")
         (forward-list 1) (backward-char 1))
        ((looking-at "\\s)")
         (forward-char 1) (backward-list 1))
        (t nil)))

;; Ctrl + ] 키를 누르면 해당 괄호의 끝부분으로 이동합니다
(global-set-key (kbd "\C-]") 'match-paren)

(defun newline-without-break-of-line ()
  "1. move to end of the line, 2. insert newline with index."
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(defun newline-without-break-of-line-upper ()
  "1. move to end of the line, 2. insert newline with index above."
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (open-line 1)))

;; Ctrl + F 키를 누르면 자동으로 빈 라인이 하나 만들어집니다 (vim의 o키와 동일합니다)
(global-set-key "\C-f" 'newline-without-break-of-line)

;; Ctrl + O 키를 누르면 자동으로 한 줄 위에 빈 라인이 하나 만들어집니다
(global-set-key "\C-o" 'newline-without-break-of-line-upper)

;; Alt + Enter 키로 현재 커서는 멈춘 상태에서 newline을 생성합니다
(global-set-key (kbd "M-<return>") 'open-line)


;; vim과 같이 앞에 있는 단어 중 숫자의 크기를 증가시키는 함수
(defun increment-number-at-point ()
  "customized by ewdard"
  (interactive)
  (skip-chars-backward "0-9")
  (or (search-forward-regexp "[0-9]+"))  ;; 여기 코드를 수정하니 정상적으로 작동한다
  (replace-match (number-to-string
                  (1+ (string-to-number
                       (match-string 0)))))
  )


;; Ctrl + t 를 누르면 커서의 숫자가 증가합니다
(global-set-key (kbd "C-t") 'increment-number-at-point)


;; 함수나 변수로 이동하는 단축키를 Alt + . , 로 설정한다
;; semantic이 gtags보다 좋네 gtags는 zz,aa로 설정했다
(global-set-key (kbd "M-.") 'semantic-ia-fast-jump)
(global-set-key (kbd "M-,") 'pop-global-mark)


;; 변수나 함수 하이라이팅한 구문을 빠르게 이동합니다 higlight-symbol 패키지
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)


;; Alt + G 단축키로 구문을 fold 접거나 펼치거나 합니다
(global-set-key "\M-g" 'hs-toggle-hiding)

;; Ctrl + Alt + G 키로 주석을 감췄다 보여줬다 하는 단축키 설정
(hide/show-comments)
(global-set-key (kbd "C-M-g") 'hide/show-comments-toggle)


;; Ctrl + PageUp, Down 단축키로 첫째줄, 마지막줄로 바로 이동합니다. Ctrl + Home, End는 원래 가능
(global-set-key (kbd "C-<prior>") 'beginning-of-buffer)
(global-set-key (kbd "C-<next>") 'end-of-buffer)

;; Alt + z로 시각화된 undo tree를 봅니다
(global-set-key "\M-z" 'undo-tree-visualize)

;; Ctrl + z로 뒤로가기 기능을 실행합니다
(global-set-key "\C-z" 'undo-tree-undo)

;; Alt + j & END 키로 vim처럼 한칸씩 아래로 움직입니다
(define-key c++-mode-map "\M-j" nil)
(define-key c-mode-map "\M-j" nil)
(global-set-key "\M-j" 'next-line)
(global-set-key (kbd "<end>") 'next-line)

;; Alt + k & HOME 키로 vim처럼 한칸씩 위로 올라갑니다
(global-set-key "\M-k" 'previous-line)
(global-set-key (kbd "<home>") 'previous-line)

;; vim 처럼 M-y,o 키를 좌우로 단어 단위로 움직이도록 설정합니다
(global-set-key (kbd "M-y") 'left-word)
(global-set-key (kbd "M-o") 'right-word)

;; vim 처럼 M-u,i 키를 좌우로 글자 단위로 움직이도록 설정합니다
(global-set-key (kbd "M-u") 'left-char)
(global-set-key (kbd "M-i") 'right-char)

;; Alt + h,l,t key unbinding
(global-set-key (kbd "M-h") nil)
(global-set-key (kbd "M-l") nil)
(global-set-key (kbd "M-t") nil)


;; C-c + C-c (or C-v) 로 window의 사이즈를 조절합니다
(define-key c++-mode-map (kbd "C-c C-c") nil)
(define-key c-mode-map (kbd "C-c C-c") nil)
(global-set-key (kbd "C-c C-c") (lambda ()
                                  (interactive)
                                  (enlarge-window-horizontally 2)
                                  (enlarge-window 2)
                                  ))
(global-set-key (kbd "C-c C-v") 'enlarge-window)

;; python-mode, org-mode에서도 같은 단축키가 동작하도록 설정한다
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-c") (lambda ()
                                              (interactive)
                                              (enlarge-window-horizontally 2)
                                              (enlarge-window 2)
                                              ))
             (local-set-key (kbd "C-c C-v") 'enlarge-window)
             ))
(add-hook 'org-mode-hook
          '(lambda ()
             (local-unset-key (kbd "M-j"))
             (local-set-key (kbd "C-c C-c") (lambda ()
                                              (interactive)
                                              (enlarge-window-horizontally 2)
                                              (enlarge-window 2)
                                              ))
             (local-set-key (kbd "C-c C-v") 'enlarge-window)
             (local-set-key (kbd "M-j") 'next-line)

             (define-key input-decode-map (kbd "C-[") (kbd "H-["))
             (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
             (define-key input-decode-map (kbd "C-m") (kbd "H-m"))
             ))

;; M-/ 키로 함수참조에 사용할 TAGS 파일을 변경합니다
(global-set-key (kbd "M-/") 'visit-tags-table)

;; C-S-l 키로 python 코드에서 들여쓰기를 보여줍니다
(global-set-key (kbd "C-S-l") 'highlight-indentation-mode)


(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

;; Ctrl + y 키로 현재 커서의 라인을 선택합니다
(global-set-key (kbd "C-y") 'select-current-line)

;; Ctrl + b 키로 helm 파일 브라우저를 실행합니다
(global-set-key (kbd "C-b") 'helm-for-files)

(defun select-current-line-and-comment ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position))
  (comment-dwim 1))

;; Alt + ; 키로 현재 커서라인을 주석처리 Toggle ON/OFF 합니다
(global-set-key (kbd "M-;") 'select-current-line-and-comment)

;; Alt + \ 키로 magit의 상태창을 실행합니다
(global-set-key (kbd "M-\\") 'magit-status)

;; C-c + e 키로 git project에서 두 파일을 비교하는 magit-ediff-dwim을 수행합니다
(global-set-key (kbd "C-c e") 'magit-ediff-dwim)

;; C-c + d 키로 git project에서 두 파일을 비교하는 magit-diff-dwim을 수행합니다
(global-set-key (kbd "C-c d") 'magit-diff-dwim)

;; C-c + f키로 두 파일을 비교하는 diff 명령을 실행합니다
(global-set-key (kbd "C-c f") 'diff)

;; C-c + r키로 두 파일을 비교하는 ediff 명령을 실행합니다
(global-set-key (kbd "C-c r") 'ediff)

;; C-c + w키로 region 영역 단위로 ediff를 실행하는 명령을 설정합니다
(global-set-key (kbd "C-c r") 'ediff-region-linewise)

;; C-c + t 키로 한 파일의 변경기록을 검사하는 magit-log-buffer-file 명령을 수행합니다
(global-set-key (kbd "C-c t") 'magit-log-buffer-file)

;; C-c + y 키로 다른 branch에 있는 파일의 내용을 확인합니다
(global-set-key (kbd "C-c y") 'magit-find-file)

;;; 이맥스가 기본적으로 제공하는 Git 백엔드를 켜두면 매우 느려진다. magit만 쓴다.
(setq vc-handled-backends nil)

;; Alt + [ 키로 선택된 단어를 iedit 일괄편집합니다
(global-set-key (kbd "M-[") 'iedit-mode)

;; git merge 도중 conflict가 난 파일은 <<<< HEAD 같은 코드가 생기는데
;; 이 때 smerge-mode를 사용해서 conflict를 관리하는 함수
(global-set-key (kbd "C-c v") 'smerge-mode)

;; Ctrl + \ - 키로 창을 가로,세로로 분할합니다
(global-set-key (kbd "C-c \\") 'split-window-right)
(global-set-key (kbd "C-c -") 'split-window-vertically)
(define-key imagex-sticky-mode-map (kbd "C-c -") 'split-window-vertically)


;; smerge mode가 시작되고 실행되는 코드
(eval-after-load "smerge-mode" (lambda()
                                 ;; merge conflict를 효율적으로 관리하기 위해 단축키를 변경한다
                                 ;; e 키로 ediff 모드를 사용한다 (a,b로 내 코드, 다른 코드를 선택 가능)
                                 (define-key smerge-mode-map (kbd "e") 'smerge-ediff)

                                 ;; n,p 키로 움직입니다
                                 (define-key smerge-mode-map (kbd "n") 'smerge-next)
                                 (define-key smerge-mode-map (kbd "p") 'smerge-prev)

                                 ;; a,b 키로 어느 conflict를 선택할지 결정합니다
                                 (define-key smerge-mode-map (kbd "a") 'smerge-keep-mine)
                                 (define-key smerge-mode-map (kbd "b") 'smerge-keep-other)
                                 ))


;; 모든 환경에서 C-i <==> TAB 키를 따로 사용하기 위한 훅 코드
;; C-i <==> TAB 이 같은 키로 인식되므로 아래 코드를 추가해준다
(add-hook 'prog-mode-hook '(lambda()
                             (keyboard-translate ?\C-i ?\H-i)
                             (define-key input-decode-map (kbd "C-[") (kbd "H-["))
                             (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
                             (define-key input-decode-map (kbd "C-m") (kbd "H-m"))
                             (define-key input-decode-map (kbd "C-S-m") (kbd "H-S-m"))
                             (define-key input-decode-map (kbd "C-S-i") (kbd "H-S-i"))
                             ))

;; C-g , C-S-g 키로 avy (버퍼 간 빠른이동) 기능을 실행합니다
(global-set-key (kbd "C-g") 'avy-goto-word-0)
(global-set-key (kbd "C-S-g") 'avy-goto-word-1)


;; C-u 키로 swiper (버퍼 간 빠른이동) 기능을 실행합니다 (NOT USED)
;; (global-set-key (kbd "C-u") 'swiper-all)

;; Alt + a 키로 해당 단어의 reference를 검색해줍니다
(global-set-key (kbd "M-a") 'helm-projectile-grep)
(define-key c++-mode-map (kbd "M-a") 'helm-projectile-grep)

;; ESC키 2번으로 기존에 3번 ESC를 눌러야 작동하던 escape를 대신합니다
(global-set-key (kbd "<escape> <escape>") 'keyboard-escape-quit)

;; C-x C-z 키가 suspend-frame으로 되어있어서 잘못해서 emacs가 멈추는 경우가 생기므로 해제합니다
(global-unset-key (kbd "C-x C-z"))

;; White space를 없애주는 함수
(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

;; Alt + w 키로 white-space를 제거하는 기능을 설정합니다
(global-set-key (kbd "M-w") 'kill-whitespace)
(define-key c++-mode-map (kbd "M-w") 'kill-whitespace)

;; Alt + m 키로 공백들을 제거합니다
(global-set-key (kbd "M-m") 'delete-blank-lines)

;; Alt + f 키로 forward paragraph (C-<down>) 과 같은 명령을 실행합니다
(global-set-key (kbd "M-f") 'forward-paragraph)
(define-key c++-mode-map (kbd "M-f") 'forward-paragraph)

;; Alt + r 키로 backward paragraph (C-<up>) 과 같은 명령을 실행합니다
(global-set-key (kbd "M-r") 'backward-paragraph)
(define-key c++-mode-map (kbd "M-r") 'backward-paragraph)

;; C-M-r,f 키로 buffer의 맨 처음과 끝으로 이동합니다
(global-set-key (kbd "C-M-r") 'beginning-of-buffer)
(global-set-key (kbd "C-M-f") 'end-of-buffer)

;; C-M-j,k 키로 forward, backward paragraph 명령을 수행합니다
(global-set-key (kbd "C-M-j") 'forward-paragraph)
(define-key c++-mode-map (kbd "C-M-j") 'forward-paragraph)
(global-set-key (kbd "C-M-k") 'backward-paragraph)
(define-key c++-mode-map (kbd "C-M-k") 'backward-paragraph)

;; Horizontal <--> Vertical view를 토글해주는 함수
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

;; Alt + ] 키로 horizontal <--> vertical을 토글하는 키를 설정한다
(global-set-key (kbd "M-]") 'window-split-toggle)

;; M-c, C-v 키를 복사, 붙여넣기로 전역적으로 설정합니다 (not used)
;; (global-set-key (kbd "C-c") 'cua--prefix-override-handler)
;; (global-set-key (kbd "C-v") 'cua-paste)

;; Package: key-chord
(require 'key-chord)
;; 두 키가 입력되는데 걸리는 시간 설정
(setq key-chord-two-keys-delay 0.1) ; default 0.1
;; 1개의 키가 입력되는데 걸리는 시간 설정
(setq key-chord-one-key-delay 0.17) ; default 0.2
(key-chord-define-global "66" 'ein:jupyter-server-stop)        ;; jupyter notebook 서버 종료
(key-chord-define-global "``" 'helm-find-files)                ;; 파일 열기
(key-chord-define-global ",," 'ac-complete-semantic)           ;; 코드 자동완성
(key-chord-define-global "mm" 'jedi:complete)                  ;; 코드 자동완성 for python
(key-chord-define-global "zz" 'helm-gtags-dwim)                ;; 코드 네비게이션 함수 찾아가기
(key-chord-define-global "aa" 'helm-gtags-pop-stack)           ;; 코드 네비게이션 돌아오기
(key-chord-define-global "xx" 'xref-find-definitions)          ;; 코드 네비게이션 함수 찾아가기 (up to emacs 25.2)
(key-chord-define-global "cc" 'xref-pop-marker-stack)          ;; 코드 네비게이션 돌아오기      (up to emacs 25.2)
(key-chord-define-global "xc" 'save-buffers-kill-terminal)     ;; emacs 종료하기 (or emacsclient)
(key-chord-define-global "zv" 'kill-emacs)                     ;; emacs --daemon 종료하기
(key-chord-mode t)
;;(key-chord-define-global "??" 'split-window-right)             ;; 오른쪽에 새창 만들기 (NOT USED)
;;(key-chord-define-global ">>" 'split-window-below)             ;; 아래쪽에 새창 만들기 (NOT USED)
;;(key-chord-define-global "<<" 'ac-complete-semantic-raw)       ;; 코드 자동완성2 (NOT USED)


;; .h header 파일을 c++ 모드로 설정합니다
;; 아니면 아래 라인을 적용하지 않고 헤더파일 맨 첫줄에 // -*-c++-*- 구문을 입력합니다
;; 아니면 .hpp 파일로 만들면 됩니다
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; xml 구문을 folding해서 쉽게 보기 위해 아래와 같이 코드를 작성합니다.
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"
               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; Alt + g 키로 xml 파일 내에서 코드를 folding할 수 있습니다
(define-key nxml-mode-map (kbd "M-g") 'hs-toggle-hiding)
;; nxml(.launch file) 모드에서도 C-c + / 키로 edward.org 파일을 엽니다
(define-key nxml-mode-map (kbd "C-c /") (lambda() (interactive)(find-file "~/gitrepo/ims_org/org_files/edward.org")))

;; grep-find (C-p) 명령어에서 새로운 grep 창이 열리지 않고 바로 현재창이 바뀌도록 하는 코드
(eval-when-compile (require 'cl))
(defun kill-grep-window ()
  (destructuring-bind (window major-mode)
      (with-selected-window (next-window (selected-window))
        (list (selected-window) major-mode))
    (when (eq major-mode 'grep-mode)
      (delete-window window))))
(add-hook 'next-error-hook 'kill-grep-window)

;; *scratch* 버퍼를 새로 생성하는 함수
(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))


;; ROS의 .launch 파일을 xml모드로 구문 하이라이팅하기 위해 설정합니다
(setq auto-mode-alist
      (append '((".*\\.launch\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.xacro\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.urdf\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.gazebo\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.world\\'" . xml-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.sdf\\'" . xml-mode))
              auto-mode-alist))
;; ROS의 CMakefile을 구문하이라이팅하기 위해 설정합니다
(setq auto-mode-alist
      (append '((".*\\.txt\\'" . ruby-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.vim\\'" . ruby-mode))
              auto-mode-alist))
(setq auto-mode-alist
      (append '((".*\\.msg\\'" . ruby-mode))
              auto-mode-alist))
;; .cu 같은 CUDA 확장자를 c++ 환경으로 인식하도록 설정합니다
(setq auto-mode-alist
      (append '((".*\\.cu\\'" . c++-mode))
              auto-mode-alist))

;; Map Alt key to Meta Alt키를 Meta키로 인식하도록 설정한다 (vnc에서 emacs를 사용하는 경우)
(setq x-alt-keysym 'meta)
