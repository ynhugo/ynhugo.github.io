---
title: 如何在windows环境实现make命令
tags: ["windows_make"]
date: 2025-07-08T18:57:42.59+0800
---



# 简要说明实现过程
在官网下载.tar.gz格式的二进制文件，在Cygwin环境中编译出make，再将make命令所在文件夹移到windows环境中，
同时make命令的执行依赖cygwin1.dll文件，将/bin/下的cygwin1.dll文件复制一份到make命令的文件中，然后再将
make命令所在文件夹的路径添加到电脑的环境变量中，打开cmd窗口，执行 make -v，正常输出显示make的版本信息。

# 编译过程
./configure
mkae
make install
