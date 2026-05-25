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
