---
title: linux环境如何添加环境变量
tags: ["linux"]
date: 2025-07-08T18:57:42.58+0800
---

# linux环境如何添加环境变量
在linux环境找到/etc/profile文件，在该文件最底部用export定义变量并赋值，然后将该变量升级为环境变量，即与PATH变量连在一起，以我要添加hugo站点目录作为环境变量为例，我的站点目录在家目录下，我添加的内容作如下
```
export HUGO1=$HOME/hugo/hugo1
export PATH=$PATH:$HUGO1;
```

