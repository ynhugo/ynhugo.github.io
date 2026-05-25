---
title: termux环境搭建alist教程
tags: ["alist"]
date: 2025-07-08T18:57:42.57+0800
---

# 搭建alist教程
alist配置[官方文档](https://alist.nn.ci/zh/guide/)。

## 安装alist

安装程序后在命令行界面运行就可以了，第一次运行的时候先获取到用户名和密码，然后根据提供的用户名和密码进行网页访问并修改密码。

## 后台运行
在termux的家目录编辑".bashrc"文件，如果没有这个文件可以创建这个文件，该命名的文件在启动termux后可以自动运行，不过alist不能重复启动，为避免使用ssh连接termux时再次启动启动alist，我写了一个脚本进行判断，如果alist已经运行就不再重复运行，执行命令时产生的附带文件如`nohup.out`和`null`也通过判断是否存在，如果存在则删除，在这一部分我在网上找了两个链接参考了一下，分别是[shell判断进程是否存在，不存在则启动](https://blog.csdn.net/e345ug/article/details/103024875)和[Shell脚本实用小技巧-教你屏蔽执行命令的所有显示信息，包含错误信息](https://blog.csdn.net/qq_36154886/article/details/109659974)和[Shell 判断文件或文件夹是否存在（不存在则创建）](https://blog.csdn.net/u012206617/article/details/118366597)，这样这个脚本就可以实现alist在后台运行了，并且不需要自己手动做任何操作了。
想要完成上面描述的效果，则需要将下面的脚本内容添加到".bashrc"中
```
#!/data/data/com.termux/files/usr/bin/bash

ps -ef | grep "alist" | grep -v "grep" > /dev/null 2>&1
if [ $? -ne 0 ]
then
nohup alist server &
fi

if [ -e "/data/data/com.termux/files/home/null" ]
then
rm /data/data/com.termux/files/home/null
fi

if [ -e "/data/data/com.termux/files/home/nohup.out" ]
then
        rm /data/data/com.termux/files/home/nohup.out
fi[<35;177;4m
```
最后启动该文件即可
```
source .bashrc
```
## alist操作方式
使用alist的命令有两个就够用了，分别是用于获取alist密码的运行alist服务的。
### 获取用户名和密码
```
alist admin
```

### 运行alist服务
```
alist server
```
运行服务之后通过提示的端口进行网页访问，链接格式是这样的"127.0.0.1:5244"，通过这个链接进行访问你就可以访问alist的界面了。

## 添加存储
接下来就需要添加存储了，将百度网盘或者阿里云网盘添加进alist存储，也可以添加本地目录；
第一次访问alist时界面什么都没有，未来添加过网盘后首页应付出现相应的网盘了，添加网盘首先要做的操作是点 击首页最底部的管理，然后再点击存储，接着点击添加，接下来就可以选择要添加的网盘的类型了，添加好的网盘可以在主页浏览。

### 浏览官方文档
[官方文档](https://alist.nn.ci/zh/guide/)
刚开始接触alist只需要看"安装"和"添加存储"就够用了，相关内容介绍的也都比较到位，至少我们平时用的百度网 盘和阿里云网盘是没有问题的，其他网盘有待折腾，包括网上也会有许多不错的教程可以参考学习。

### 添加百度网盘
需要关注的有两点，刷新令牌和web代理；
刷新令牌可以根据官方文档进行操作获取并进行添加，web代理也勾选一下，挂载路径随便设置，格式是一个斜杠加 自定义名称，就像这样"/BaiduNetdisk"，剩下的不需要动，接着点击保存就可以了。

### 添加阿里云网盘Open
即添加阿里云盘，Open是开源的意思，即跟添加另一个阿里云盘时要做的操作不一样，但是目的都是一样的；
添加阿里云盘只需要关注刷新令牌，然后设置挂载路径，其他地方不需要做，接着保存就可以了；

### 添加本机存储
即添加本地目录，只需要设置根文件夹路径和挂载路径即可，根文件夹路径是termux的某个目录，就像这样"/data/data/com.termux/files/home/Alist"，这个路径中"/data/data/com.termux/files/home"对应termux的家目录，在家目录我创建了一个名字叫做"Alist"的目录，这就是我要添加到alist的目录，做完这些后保存就可以了；
我在添加本地存储的时候我有考虑过如果我想添加多个文件夹到本地存储怎么办，我总不能一个一个的复制到设定的目录中吧，因此我想了为要添加到本地存储的目录创建软链接，就像快捷方式一样，这些快捷方式都被我添加到我设定的根文件夹路径中，使用的创建软链接的命令是"ln"，"ln"的使用方法可以参考这个链接[Linux命令大全(手册)](https://www.linuxcool.com/ln)。

## 注意事项
alist程序在运行的过程中会在同一目录下创建data目录用来存放配置文件和一些数据文件，如果alist程序在其他地方运行了，会另外创建data目录，这意味着在不同地方运行的alist的data目录的数据不一样，最能直观感受到的就 是当你进行网页访问的时候，两次运行的用户名和密码不同，即配置文件不同，因此alist程序安排好运行路径之后 就不要再动了，不然会导致alist配置文件异常。
