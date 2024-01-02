; 实用参考链接
;; 列出一些常用学习链接
;; https://zhuanlan.zhihu.com/p/385214753
;; https://github.com/emacs-china/Spacemacs-rocks#%E5%AE%89%E8%A3%85-spacemacs
;; https://www.cnblogs.com/holbrook/archive/2012/04/12/2444992.html
;; https://www.cnblogs.com/ts65214/p/5561646.html

; 目录配置
;; (setenv "HOME" "C:/cygwin/home/username")
;; (setenv "PATH" "C:/cygwin/home/username")
;; (set default-directory "C:/cygwin/home/username")
;; (add-to-list 'load-path "C:/cygwin/home/username/.emacs.d/init.el")

                                        ; 函数配置
(setq inhibit-startup-message 1) ;; 禁止Emacs显示启动画面
(fset 'display-startup-echo-area-message 'ignore) ;; 禁止Echo Area显示For information about GNU Emacs and the GNU system,type C-h C-a
(setq-default indent-tabs-mode 1) ;; 在缩进时使用制表符
(setq-default tab-width 4) ;; 指定制表符的宽度为4个空格
(setq c-default-style "linux") ;; 指定C语言的默认代码样式为Linux风格，这其中包含了一些特定的规则和约定，例如缩进方式、括号对齐等等，可心根据自己的喜好和项目要求来修改这个值
(setq c-basic-offset 4) ;; 在C语言模式下，每个缩进级别使用4个空格
(recentf-mode 0) ;; recentf-mode是一个Emacs历史记录插件，它允许你在Emacs会话之间保留文件的历史记录，一旦启用recentf-mode，它将自动跟踪你最近打开的文件，并将它们保存在一个列表中，当你需要再次访问这些文件时，可以通过recentf-mode提供的命令和功能来查找和打开它们
;; (tool-bar-mode 0) ;; 禁用工具栏显示，工具栏通过包含了一些常用的功能按键
(menu-bar-mode 0) ;; 禁用菜单栏显示，菜单栏通过包含了一系列的菜单项
;; (scroll-bar-mode 0) ;; 禁用滚动条显示，滚动条通过用来显示当前文档的滚动位置
;; (global-hl-line-mode 1) ;; 全局高亮当前行模式，这个模式会在当前行添加高这显示
(global-linum-mode 1) ;; 全局显示行号，这个模式会在每行的左侧显示行号
(column-number-mode 1) ;; 显示列号
(xterm-mouse-mode 1) ;; 启用xterm鼠标模式，这个模式允许使用鼠标进行交互操作
;; (desktop-save-mode 1) ;; 启用Emacs的桌面保存模式，当桌面保存模式开启后，Emacs会在退出时保存当前的工作 环境(打开的文件、窗口配置等)，以便在下次启动时自动恢复
(save-place-mode 1) ;; 是用来启用Emacs的记忆光标位置模式，开启后，Emacs会记录你最后离开每个文件时的光 标位置，在再次打开该文件时会自动将光标定位到上次的位置
;; (toggle-truncate-lines t) ;; 换行模式，每次加载变量的值都会被再次取反
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) ;; org-mode固定自动换行
(setq default-major-mode 'text-mode)

(add-to-list 'default-frame-alist '(foreground-color . "#FFFFFF")) ;; 配置emacs前景颜色
(add-to-list 'default-frame-alist '(background-color . "#000000")) ;; 配置emacs背景颜色

(defun g-org-insert-note-header () ;; 定义一个名为g-org-insert-note-header ()的函数
  (interactive) ;; 函数的一个特殊声明，表示函数可以被用户调用
  (insert "#+options: ^:nil\n#+title: \n#+options: \n:t\n#+author: yenao\n")) ;; insert函数用于在当前光标位置插入指定的文本内容，当你调用这个函数时，它会在当前光标位置插入文本#+options: ^:nil、#+title: 和#+author: yenao

(with-eval-after-load 'eww
  (custom-set-variables
   '(eww-search-prefix "https://bing.com/search?q=")))

;; 参考链接：https://www.jianshu.com/p/af9e43f7f13e
;; 尝试配置GTD
(unless (file-exists-p "~/.emacs.d/OneDrive")
  (make-directory "~/.emacs.d/OneDrive")
  );; 检测OneDrive目录是否存在，如果不存在就创建这个目录
(unless (file-exists-p "~/.emacs.d/OneDrive/org")
  (make-directory "~/.emacs.d/OneDrive/org")
  );; 检测org目录是否存在，如果不存在就创建这个目录
(let ((filename "~/.emacs.d/my-agenda.el")) ;; 如果my-agenda.el文件不存在，就创建这个文件，如果需要往 该文件内写入内容，将该段该中insert的注释取消即可
  (unless (file-exists-p filename)
    (with-temp-file filename
      ;; (insert "这是文件内容") ;; 写入文件内容
      )))
(let ((filename "~/.emacs.d/OneDrive/org/todo.org")) ;; 如果todo.org文件不存在，就创建这个文件，如果需要往该文件内写入内容，将该段该中insert的注释取消即可
  (unless (file-exists-p filename)
    (with-temp-file filename
      ;; (insert "这是文件内容") ;; 写入文件内容
      )))

(load-file "~/.emacs.d/my-agenda.el") ;; 加载my-agenda.el配置文件
(setq org-agenda-files '("~/.emacs.d/OneDrive/org")) ;; 指定data存放目录
(setq org-default-notes-file "~/.emacs.d/OneDrive/org/todo.org") ;; 配置好data目录后，再配置具体要将信息写于哪个文件，可以配置多个文件，出于简化，这里将所有的agenda todo写入~/Onedrive/org/todo.org文件下
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cr" 'remember)

(setq org-todo-keywords '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")))
(setq org-tag-alist '(("@office" . ?w) ("@home" . ?h) ("traffic" . ?t) ("computer" . ?c) ("nocomputer" . ?n) ("either" . ?e) ("immediately" . ?i) ("wait" . ?w) ("action" . ?a)))

                                        ; 插件配置
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t) ;; 配置melpa-stable仓库，如果不配置的话，use-package安装不了，比如在wsl-ubuntu18.04环境上就是这样
(package-initialize)
;; 配置use-package用于安装各种插件
(eval-when-compile
  (require 'use-package)
  )

;; 配置company用于文本补全
(use-package company
  :ensure t
  :init (global-company-mode 1) ;; 启用全局的自动补全功能，这将使得在所有的缓冲区中的文本输入时，company会自动显示可能的实例选项
   :config
  (setq company-minimun-prefix-length 1) ;; 只需敲一个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t) ;; 设定自动补全提示框与注解的对齐方式，如果设为nil，则对 齐，如果设为t，则不对齐
  (setq company-idle-delay 0.0) ;; 设置自动补全的延时，在输入之后立即触发自动补全
  (setq company-show-numbers 1) ;; 给选项编号(按快捷键M-1、M-2等等来进行选择)
  (setq company-selection-wrap-around 1) ;; 当光标移到最后一个选项后，再按下TAB键时，光标将回到第一个 选项
  (setq company-transformers '(company-sort-by-occurrence)) ;; 根据选择的频率进行排序，如果不喜欢可以 去掉
  )

(use-package ox-hugo
  :ensure t
  )
