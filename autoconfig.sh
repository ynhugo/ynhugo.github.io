# 修改baseurl
sed -i 's|\(^baseurl = "\).*\("\)|\1https://ynhugo.github.io/\2|g' config/_default/config.toml
# 修改语言
sed -i 's|\(^locale[[:space:]]*= "\).*\("\)|\1zh-cn\2|g' config/_default/config.toml
# 修改标题
sed -i 's|\(^title[[:space:]]*= "\).*\("\)|\1ynhugo\2|g' config/_default/config.toml
# 修改默认博文语言
sed -i 's|\(^defaultContentLanguage[[:space:]]*= "\).*\("\)|\1zh-cn\2|g' config/_default/config.toml
# 修改每页显示博文数量
sed -i 's|\(^[[:space:]]*pagerSize[[:space:]]*= \).*|\120|g' config/_default/config.toml
# 修改子标题
sed -i 's|\(^[[:space:]]*subtitle = "\).*\("\)|\1欢迎来到我的博客\2|g' config/_default/params.toml

# 4. 创建中文页面（纯本地操作，批量复制执行）
# 添加中文归档
cat > content/page/archives/index.zh-cn.md << 'EOF'
---
title: "文章归档"
date: 2019-05-28
layout: "archives"
slug: "archives"
menu:
    main:
        weight: -70
        params:
            icon: archives
---
EOF

# 添加中文主页
cat > content/_index.zh-cn.md << 'EOF'
---
menu:
    main:
        name: "主页"
        weight: 1
        params:
            icon: home
---
EOF

# 添加中文搜索
cat > content/page/search/index.zh-cn.md << 'EOF'
---
title: "搜索"
slug: "search"
layout: "search"
outputs:
    - html
    - json
menu:
    main:
        weight: -60
        params:
            icon: search
---
EOF

# 添加中文友情链接
cat > content/page/links/index.zh-cn.md << 'EOF'
---
title: 友情链接
links:
  - title: naoemb
    website: https://naoemb.github.io
  - title: embnao
    website: https://embnao.github.io
  - title: hexgio
    website: https://hexgio.github.io
  - title: Gitee
    website: https://gitee.com/yenao
    image: https://e-assets.gitee.com/gitee-community-web/_next/static/media/logo-black.d4cfe066.svg
  - title: GitHub
    website: https://github.com/hexgio
    image: https://github.githubassets.com/assets/pinned-octocat-093da3e6fa40.svg
menu:
    main:
        weight: 4
        params:
            icon: link
comments: false
---
EOF

# 5. 生成短代码脚本（本地操作，批量复制执行）
mkdir -p layouts/shortcodes/
# 添加网易云短代码
cat - > layouts/shortcodes/netease.html <<'EOF'
<iframe
  frameborder="no"
  border="0"
  marginwidth="0"
  marginheight="0"
  width=330 height=86
  src="//music.163.com/outchain/player?type=2&id={{.Get 0}}&auto=0&height=66">
</iframe>
EOF
# 添加文字属性
cat - > layouts/shortcodes/align.html <<'EOF'
<p style="text-align:{{ index .Params 0 }}">{{ index .Params 1 | markdownify }}</p>
EOF
# 插入github仓库
cat - > layouts/shortcodes/github.html <<'EOF'
<div class="github">
    <div class="logo">
        {{ replace $.Site.Data.SVG.repository "icon" "icon github-icon" | safeHTML }}
        <a class="name" href={{ .Get "link" }} target="_blank">{{ .Get "name" }}</a>
    </div>
    <div class="description">{{ .Get "description" }}</div>
    <div class="language">
        <span class="language-color" style="background-color: {{ .Get "color" }}"></span>
        <span class="language-name">{{ .Get "language" }}</span>
    </div>
</div>
EOF
