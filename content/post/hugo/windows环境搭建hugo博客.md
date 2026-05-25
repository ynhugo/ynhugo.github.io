---
title: windows环境搭建hugo博客
tags: ["hugo"]
date: 2025-07-08T18:57:42.57+0800
---

# 搭建hugo博客
这里跟着[官网教程](https://gohugo.io/getting-started/quick-start/)进行配置，刚开始折腾hugo博客的话，最重要的是折腾成功，官网教程简单实用。

## 安装hugo
到官方的[github](https://github.com/gohugoio/hugo/releases/latest)仓库下载对应windows系统的hugo博客框
架，然后将下载下来的文件进行解压，解压后的目录根据个人喜好选择是否重命名，我将解压后的目录命名为hugo，该目录中有一个hugo.exe文件，其它两个文件不用看，删了都不影响，将hugo.exe程序所在目录的路径添加至环境变量。

## 创建站点目录
然后在硬盘中找一个自己想要存放博客的位置，创建站点目录，例如我要创建的站点目录的名字叫做hugo1.
```
hugo new site hugo1
```
然后名字叫做hugo1的站点目录就创建好了。
## 配置博客主题
还是刚开始说的，能够快速折腾成功还是挺重要的，因此还是根据官方教程操作，配置一个主题名叫做ananke的主题。
```
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```
然后在站点目录的hugo.toml文件中最下边添加一行内容，添加的内容是
```
theme = 'ananke'
```
可以用用shell命令添加
```
echo "theme = 'ananke'" >> hugo.toml
```
## 创建博客
创建属于该博客的第一篇内容，名字就叫"我的第一篇博客"吧
```
hugo new posts/我的第一篇博客.md
```
然后在站点目录下的content/posts/下就相应的出现了一个文件"我的第一篇博客.md"
## 本地预览
```
hugo server -D
```
## 部署博客
### 配置github仓库
在github创建账户，然后创建仓库，仓库命名格式为"yourname.github.io"，配置仓库的主分支为master，配置仓库设置界面的pages的主分支为master。
### 在本地生成ssh密钥
```
ssh-keygen
```
三次回车后密钥就生成了，生成的密钥在家目录下的.ssh目录下，将.ssh/的id_rsa.pub的内容复制到剪切板，然后 回到github网站，在帐户设置的SSH and GPG keys界面中添加剪切板的ssh公钥，然后给添加该密钥的记录随便起一 个名字用于区分可以了。
### 配置hugo
将自己仓库的名字yourname.github.io添加到站点目录的hugo.toml配置文件中，将示例链接替换掉，然后设置博客 的语言，接着设置博客的名称，最后一行也就是第四行是咱刚开始就添加过了的，所以不用修改。
```
baseURL = 'yourname.github.io'
languageCode = 'zh-cn'
title = 'MyBlogs'
theme = 'ananke'
```
### 部署
先将博客的草稿模式关闭，将true修改为false，然后回到站点目录的第一级目录，然后执行命令run，再进入publib目录，先添加github的仓库链接，然后执行git命令进行部署hugo的操作。
```
git remote add origin git@github.com:yourname/yourname.github.io.git
```
```
git add .
git commit -m "upload"
git push -u origin master
```
### 部署失败解决方法
如果部署过程出现问题，可以执行以下命令来解决
```
#!/data/data/com.termux/files/usr/bin/bash

git remote rm origin

git remote add origin git@github.com:ynhugo/ynhugo.github.io.git

git add .; git commit -m upload; git push -u origin master

/data/data/com.termux/files/home/hugo/hugo1/content/posts
```
