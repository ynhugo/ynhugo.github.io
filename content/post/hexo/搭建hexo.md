---
title: 搭建hexo
tags: ["hexo"]
date: 2025-07-08T18:57:42.57+0800
---

# 笔记文件
[点击访问 搭建hexo.pdf](/images/搭建hexo.pdf)

# 视频教程
{{< bilibili BV1tG4y1h7UE >}}

# hexo博客搭建教程
##	准备工作
	需要安装：nodejs、git-bash
	因官网下载太慢，这里使用nodejs的国内网站和git-bash的镜像网站进行下载
	nodejs链接：http://nodejs.cn/download/
		nodejs下载地址：https://cdn.npmmirror.com/binaries/node/v16.17.0/node-v16.17.0-x64.msi
	git-bash链接：https://registry.npmmirror.com/binary.html?path=git-for-windows/
		git-bash下载地址：https://cdn.npmmirror.com/binaries/git-for-windows/v2.38.0.windows.1/Git-2.38.0-64-bit.exe
	
	接下来安装nodejs和git-bash

###	nodejs安装教程：

![](/images/nodejs/捕获1.PNG)

![](/images/nodejs/捕获2.PNG)

![](/images/nodejs/捕获3.PNG)

![](/images/nodejs/捕获4.PNG)

![](/images/nodejs/捕获5.PNG)

![](/images/nodejs/捕获6.PNG)

![](/images/nodejs/捕获7.PNG)

![](/images/nodejs/捕获8.PNG)


###	git-bash安装教程：
	
![](/images/git-bash/捕获1.PNG)

![](/images/git-bash/捕获2.PNG)

![](/images/git-bash/捕获3.PNG)

![](/images/git-bash/捕获4.PNG)

![](/images/git-bash/捕获5.PNG)

![](/images/git-bash/捕获6.PNG)

![](/images/git-bash/捕获7.PNG)

![](/images/git-bash/捕获8.PNG)

![](/images/git-bash/捕获9.PNG)

![](/images/git-bash/捕获10.PNG)

![](/images/git-bash/捕获11.PNG)

![](/images/git-bash/捕获12.PNG)

![](/images/git-bash/捕获13.PNG)

![](/images/git-bash/捕获14.PNG)

![](/images/git-bash/捕获15.PNG)

![](/images/git-bash/捕获16.PNG)

![](/images/git-bash/捕获17.PNG)

##	开始搭建
	接下来开始搭建hexo：
		在git-bash中执行命令
			npm install hexo-cli -g	#安装博客框架
				执行 hexo init myBlog		#生成博客的站点目录
				执行命令 hexo s 可以启动本地博客，博客显示的内容
					在站点目录的 source/_posts/ 路径下

			修改配置文件
				准备一个qq邮箱之外的邮箱，邮箱的实用性越高越好，因此我建议的邮箱是微软的Outlook邮箱，官网是 outlook.live.com 可以在注册一个Outlook邮箱,注册完Outlook邮箱之后就可以到 github.com官网 注册了，搭建hexo的前提是在github.com官网 注册并搭建一个用于部署hexo的仓库。
				在github注册并新建一个仓库，仓库格式为 用户名.github.io，然后将该仓库生成的	ssh链接复制下来，打开刚刚创建的站点目录下的 _config.yml
					vim _config.yml
					在该文件的最下面，有一段代码：

```	
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: ' '
```

					将代码更改为：
					
```					
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: 'git'	#部署博客类型
  repo: git@github.com:zzfxdyn/zzfxdyn.github.io.git	#仓库生成的链接
  branch: main		#仓库默认分支
```						 
					同时将该文件中url：http://example.com改为 https://仓库名
					
			npm install hexo-deployer-git --save	#安装博客部署插件

			生成ssh密钥
				ssh-keygen -t rsa -C "注册github时的邮箱"
				连续多次回车，生成ssh密钥在，按照提示的路径进入该路径下复制 id_rsa.pub 的内容
				默认路径为 ~/.ssh,在git-bash中通过命令 cd ~/.ssh 进入该路径
				cat id_rsa.pub		#显示id_rsa.pub的内容，然后鼠标选中复制
				复制的内容为生成的密钥的公钥，回到浏览器，打开github的设置，点击SSH and GPG Keys，
				添加新的密钥，自定义一个名字，粘贴密钥并确定

			
			回到git-bash，配置好站点目录文件后执行命令
			git config --global user.email "you@example.com"
			git config --global user.name "Your Name"
			执行 hexo clean && hexo g && hexo d 测试博客部署插件是否安装成功

##	vim编辑器的使用方法

	vim之所以被称之为强大的编辑器是因为本身支持很多的模式
	命令模式 命令行模式(底行模式) 编辑模式(插入模式) 可视 可视块 可视行
	注意 : 不要使用vim打开目录文件
	注意 : 用vim编写完成的文件内容要用正常的保存退出方式,不要直接关闭终端
		否则会生成交换文件(交换文件是隐藏文件)
					vim hello.c
						|
	按iIoOaA				V				按:
	编辑模式<----------命令模式---------->命令行模式
			--------->		<---------	
				按esc		按esc或者删掉:

	命令行模式的操作
		:w		保存
		:q		退出
		:wq		保存并且退出

##	如何修改hosts文件
###	第一种方法
	也是网上推荐较多的，比较常用的方法

![](/images/修改hosts文件的教程/第一种方法/捕获1.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获2.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获3.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获4.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获5.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获6.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获7.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获8.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获9.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获10.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获11.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获12.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获13.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获14.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获15.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获16.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获17.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获18.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获19.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获20.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获21.PNG)

![](/images/修改hosts文件的教程/第一种方法/捕获22.PNG)

###	第二种方法
	通过网站获得github网站的ip，我用的是 ipaddress.com 这个网站，点击进入网站后会显示一个403页面，再点击 Go to Homepage 即可真正进入网站。

![](/images/修改hosts文件的教程/第二种方法/捕获1.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获2.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获3.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获4.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获5.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获6.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获7.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获8.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获9.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获10.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获11.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获12.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获13.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获14.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获15.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获16.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获17.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获18.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获19.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获20.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获21.PNG)

![](/images/修改hosts文件的教程/第二种方法/捕获22.PNG)
