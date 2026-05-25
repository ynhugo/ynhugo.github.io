---
title: hugo博客增强篇
tags: ["hugo"]
date: 2025-07-08T19:01:41.14+0800
---

# 参考链接：[如何在hugo生成的网页中插入嵌入式视频-使用Hugo建立静态网站教程（进阶）](https://www.bilibili.com/video/BV1SS4y1n7Fc/?spm_id_from=333.788&vd_source=e7de88f963dcdcb94847fceb0e821942)

# 播放音乐测试
这里以网易云音乐为例，在网站根目录的layouts/下创建shortcodes/目录，然后在layouts/shortcodes/目录下创建netease.html文件，在该文件中加入如下代码定义：
```
<iframe
  frameborder="no"
  border="0"
  marginwidth="0"
  marginheight="0"
  width=330 height=86
  src="//music.163.com/outchain/player?type=2&id={{.Get 0}}&auto=0&height=66">
</iframe>
```

然后就可以在博客中按照如下方式添加音频了。

{{< netease 1304708603 >}}

# 测试文字属性
在网站根目录的layouts/下创建shortcodes/目录，然后在layouts/shortcodes/目录下创建align.html文件，在该文件中加入如下代码定义：
```
<p style="text-align:{{ index .Params 0 }}">{{ index .Params 1 | markdownify }}</p>
```

然后就可以在博客中按照如下方式设置文字属性了。

{{< align center "文字居中" >}}

# 测试插入github仓库

{{< github name="test" link="https://github.com/ynhugo/ynhugo.github.io" >}}

# 播放图片测试

![捕获1.PNG](/images/1DM+/捕获1.PNG)

# 播放视频测试

这里以B站为例，在网站根目录的layouts/下创建shortcodes/目录，然后在layouts/shortcodes/目录下创建bilibili.html文件，在该文件中加入如下代码定义：
```
<iframe
     src="//player.bilibili.com/player.html?bvid={{.Get 0 }}&page={{ if .Get 1 }}{{.Get 1}}{{ else }}1{{end}}&as_wide=1&high_quality=1"
     scrolling="no"
     border="0"
     frameborder="no"
     framespacing="0"
     allowfullscreen="true"
 >
 </iframe>
```

然后就可以在博客中按照如下方式添加视频了。

{{< bilibili BV1SS4y1n7Fc 4 >}}

{{< bilibili BV1SS4y1n7Fc 6 >}}

# 添加多标签

```
	title: "测试"
	tags: ["hugo", "blog"]
	categories: ["博客测试"]
	draft: false
```

# 配置主题

## 安装主题

把这个主题克隆到 themes 目录:

git clone https://github.com/dillonzq/LoveIt.git themes/LoveIt

## 配置主题

### 站点配置文件的修改

将根目录\themes\LoveIt\exampleSite路径下的config.toml文件复制到根目录下，覆盖掉根目录下的hugo.toml文件。然后，我们在notepad++中打开并对其作一定的修改就可以直接使用，具体可以修改的内容如下：
```
baseURL = 'https://example.com/'
theme = 'loveit'

# theme
# 主题
# themes directory
# 主题目录
# themesDir = "../.."

# website title
# 网站标题
title = "yenao"

# determines default content language ["en", "zh-cn", "fr", "pl", ...]
# 设置默认的语言 ["en", "zh-cn", "fr", "pl", ...]
defaultContentLanguage = "zh-cn"
# language code ["en", "zh-CN", "fr", "pl", ...]
# 网站语言, 仅在这里 CN 大写 ["en", "zh-CN", "fr", "pl", ...]
languageCode = "zh-cn"
# language name ["English", "简体中文", "Français", "Polski", ...]
# 语言名称 ["English", "简体中文", "Français", "Polski", ...]
languageName = "简体中文"
# whether to include Chinese/Japanese/Korean
# 是否包括中日韩文字
hasCJKLanguage = false

# default amount of posts in each pages
# 默认每页列表显示的文章数目
paginate = 100
# google analytics code [UA-XXXXXXXX-X]
# 谷歌分析代号 [UA-XXXXXXXX-X]
googleAnalytics = ""
# copyright description used only for seo schema
# 版权描述，仅仅用于 SEO
copyright = ""

# whether to use robots.txt
# 是否使用 robots.txt
enableRobotsTXT = true
# whether to use git commit log
# 是否使用 git 信息
enableGitInfo = true
# whether to use emoji code
# 是否使用 emoji 代码
enableEmoji = true

# ignore some build errors
# 忽略一些构建错误
ignoreErrors = ["error-remote-getjson", "error-missing-instagram-accesstoken"]

# Author config
# 作者配置
[author]
  name = "夜闹"
  email = ""
  link = ""

# Menu config
# 菜单配置
[menu]
  [[menu.main]]
    weight = 1
    identifier = "posts"
    # you can add extra information before the name (HTML format is supported), such as icons
    # 你可以在名称 (允许 HTML 格式) 之前添加其他信息, 例如图标
    pre = ""
    # you can add extra information after the name (HTML format is supported), such as icons
    # 你可以在名称 (允许 HTML 格式) 之后添加其他信息, 例如图标
    post = ""
    name = "Posts"
    url = "/posts/"
    # title will be shown when you hover on this menu link
    # 当您将鼠标悬停在此菜单链接上时, 将显示标题
    title = ""
  [[menu.main]]
    weight = 2
    identifier = "tags"
    pre = ""
    post = ""
    name = "Tags"
    url = "/tags/"
    title = ""
  [[menu.main]]
    weight = 3
    identifier = "categories"
    pre = ""
    post = ""
    name = "Categories"
    url = "/categories/"
    title = ""

[params]
  # site default theme ["auto", "light", "dark"]
  # 网站默认主题 ["auto", "light", "dark"]
  defaultTheme = "auto"
  # public git repo url only then enableGitInfo is true
  # 公共 git 仓库路径，仅在 enableGitInfo 设为 true 时有效
  gitRepo = "https://github.com/dillonzq/LoveIt"
  # which hash function used for SRI, when empty, no SRI is used
  # ["sha256", "sha384", "sha512", "md5"]
  # 哪种哈希函数用来 SRI, 为空时表示不使用 SRI
  # ["sha256", "sha384", "sha512", "md5"]
  fingerprint = ""
  # date format
  # 日期格式
  dateFormat = "2006-01-02"
  # website title for Open Graph and Twitter Cards
  # 网站标题, 用于 Open Graph 和 Twitter Cards
  title = "LoveIt"
  # website description for RSS, SEO, Open Graph and Twitter Cards
  # 网站描述, 用于 RSS, SEO, Open Graph 和 Twitter Cards
  description = "Hugo theme - LoveIt"
  # website images for Open Graph and Twitter Cards
  # 网站图片, 用于 Open Graph 和 Twitter Cards
  # images = ["/logo.png"]

  # Header config
  # 页面头部导航栏配置
  [params.header]
    # desktop header mode ["fixed", "normal", "auto"]
    # 桌面端导航栏模式 ["fixed", "normal", "auto"]
    desktopMode = "auto"
    # mobile header mode ["fixed", "normal", "auto"]
    # 移动端导航栏模式 ["fixed", "normal", "auto"]
    mobileMode = "auto"
    # Header title config
    # 页面头部导航栏标题配置
    [params.header.title]
      # URL of the LOGO
      # LOGO 的 URL
      logo = ""
      # title name
      # 标题名称
      name = "yenao"
      # you can add extra information before the name (HTML format is supported), such as icons
      # 你可以在名称 (允许 HTML 格式) 之前添加其他信息, 例如图标
      pre = "<i class='far fa-kiss-wink-heart fa-fw' aria-hidden='true'></i>"
      # you can add extra information after the name (HTML format is supported), such as icons
      # 你可以在名称 (允许 HTML 格式) 之后添加其他信息, 例如图标
      post = ""
      # whether to use typeit animation for title name
      # 是否为标题显示打字机动画
      typeit = false

  # Footer config
  # 页面底部信息配置
  [params.footer]
    enable = false
    # Custom content (HTML format is supported)
    # 自定义内容 (支持 HTML 格式)
    custom = ""
    # whether to show Hugo and theme info
    # 是否显示 Hugo 和主题信息
    hugo = true
    # whether to show copyright info
    # 是否显示版权信息
    copyright = true
    # whether to show the author
    # 是否显示作者
    author = true
    # site creation time
    # 网站创立年份
    since = 2019
    # ICP info only in China (HTML format is supported)
    # ICP 备案信息，仅在中国使用 (支持 HTML 格式)
    icp = ""
    # license info (HTML format is supported)
    # 许可协议信息 (支持 HTML 格式)
    license= '<a rel="license external nofollow noopener noreffer" href="https://creativecommons.org/licenses/by-nc/4.0/" target="_blank">CC BY-NC 4.0</a>'

  # Section (all posts) page config
  # Section (所有文章) 页面配置
  [params.section]
    # special amount of posts in each section page
    # section 页面每页显示文章数量
    paginate = 100
    # date format (month and day)
    # 日期格式 (月和日)
    dateFormat = "01-02"
    # amount of RSS pages
    # RSS 文章数目
    rss = 100

  # List (category or tag) page config
  # List (目录或标签) 页面配置
  [params.list]
    # special amount of posts in each list page
    # list 页面每页显示文章数量
    paginate = 1000
    # date format (month and day)
    # 日期格式 (月和日)
    dateFormat = "01-02"
    # amount of RSS pages
    # RSS 文章数目
    rss = 100

  # App icon config
  # 应用图标配置
  [params.app]
    # optional site title override for the app when added to an iOS home screen or Android launcher
    # 当添加到 iOS 主屏幕或者 Android 启动器时的标题, 覆盖默认标题
    title = "LoveIt"
    # whether to omit favicon resource links
    # 是否隐藏网站图标资源链接
    noFavicon = false
    # modern SVG favicon to use in place of older style .png and .ico files
    # 更现代的 SVG 网站图标, 可替代旧的 .png 和 .ico 文件
    svgFavicon = ""
    # Android browser theme color
    # Android 浏览器主题色
    themeColor = "#ffffff"
    # Safari mask icon color
    # Safari 图标颜色
    iconColor = "#5bbad5"
    # Windows v8-11 tile color
    # Windows v8-11 磁贴颜色
    tileColor = "#da532c"

  # Search config
  # 搜索配置
  [params.search]
    enable = true
    # type of search engine ["lunr", "algolia"]
    # 搜索引擎的类型 ["lunr", "algolia"]
    type = "algolia"
    # max index length of the chunked content
    # 文章内容最长索引长度
    contentLength = 4000
    # placeholder of the search bar
    # 搜索框的占位提示语
    placeholder = ""
    # max number of results length
    # 最大结果数目
    maxResultLength = 10
    # snippet length of the result
    # 结果内容片段长度
    snippetLength = 30
    # HTML tag name of the highlight part in results
    # 搜索结果中高亮部分的 HTML 标签
    highlightTag = "em"
    # whether to use the absolute URL based on the baseURL in search index
    # 是否在搜索索引中使用基于 baseURL 的绝对路径
    absoluteURL = false
    [params.search.algolia]
      index = ""
      appID = ""
      searchKey = ""

  # Home page config
  # 主页信息设置
  [params.home]
    # amount of RSS pages
    # RSS 文章数目
    rss = 100
    # Home page profile
    # 主页个人信息
    [params.home.profile]
      enable = true
      # Gravatar Email for preferred avatar in home page
      # Gravatar 邮箱，用于优先在主页显示的头像
      gravatarEmail = ""
      # URL of avatar shown in home page
      # 主页显示头像的 URL
      avatarURL = "/images/avatar.png"
      # title shown in home page (HTML format is supported)
      # 主页显示的网站标题 (支持 HTML 格式)
      title = ""
      # subtitle shown in home page (HTML format is supported)
      # 主页显示的网站副标题 (允许 HTML 格式)
      subtitle = "A Clean, Elegant but Advanced Hugo Theme"
      # whether to use typeit animation for subtitle
      # 是否为副标题显示打字机动画
      typeit = true
      # whether to show social links
      # 是否显示社交账号
      social = true
      # disclaimer (HTML format is supported)
      # 免责声明 (支持 HTML 格式)
      disclaimer = ""
    # Home page posts
    # 主页文章列表
    [params.home.posts]
      enable = true
      # special amount of posts in each home posts page
      # 主页每页显示文章数量
      paginate = 100
  # Social config in home page
  # 主页的社交信息设置
  [params.social]
    GitHub = ""
    Linkedin = ""
    Twitter = ""
    Instagram = ""
    Facebook = ""
    Telegram = ""
    Medium = ""
    Gitlab = ""
    Youtubelegacy = ""
    Youtubecustom = ""
    Youtubechannel = ""
    Tumblr = ""
    Quora = ""
    Keybase = ""
    Pinterest = ""
    Reddit = ""
    Codepen = ""
    FreeCodeCamp = ""
    Bitbucket = ""
    Stackoverflow = ""
    Weibo = ""
    Odnoklassniki = ""
    VK = ""
    Flickr = ""
    Xing = ""
    Snapchat = ""
    Soundcloud = ""
    Spotify = ""
    Bandcamp = ""
    Paypal = ""
    Fivehundredpx = ""
    Mix = ""
    Goodreads = ""
    Lastfm = ""
    Foursquare = ""
    Hackernews = ""
    Kickstarter = ""
    Patreon = ""
    Steam = ""
    Twitch = ""
    Strava = ""
    Skype = ""
    Whatsapp = ""
    Zhihu = ""
    Douban = ""
    Angellist = ""
    Slidershare = ""
    Jsfiddle = ""
    Deviantart = ""
    Behance = ""
    Dribbble = ""
    Wordpress = ""
    Vine = ""
    Googlescholar = ""
    Researchgate = ""
    Mastodon = ""
    Thingiverse = ""
    Devto = ""
    Gitea = ""
    XMPP = ""
    Matrix = ""
    Bilibili = ""
    Discord = ""
    DiscordInvite = ""
    Lichess = ""
    ORCID = ""
    Pleroma = ""
    Kaggle = ""
    MediaWiki= ""
    Plume = ""
    HackTheBox = ""
    RootMe= ""
    Email = ""
    RSS = ""

  # Page global config
  # 文章页面全局配置
  [params.page]
    # whether to hide a page from home page
    # 是否在主页隐藏一篇文章
    hiddenFromHomePage = false
    # whether to hide a page from search results
    # 是否在搜索结果中隐藏一篇文章
    hiddenFromSearch = false
    # whether to enable twemoji
    # 是否使用 twemoji
    twemoji = false
    # whether to enable lightgallery
    # 是否使用 lightgallery
    lightgallery = false
    # whether to enable the ruby extended syntax
    # 是否使用 ruby 扩展语法
    ruby = true
    # whether to enable the fraction extended syntax
    # 是否使用 fraction 扩展语法
    fraction = true
    # whether to enable the fontawesome extended syntax
    # 是否使用 fontawesome 扩展语法
    fontawesome = true
    # whether to show link to Raw Markdown content of the content
    # 是否显示原始 Markdown 文档内容的链接
    linkToMarkdown = true
    # whether to show the full text content in RSS
    # 是否在 RSS 中显示全文内容
    rssFullText = true
    # Table of the contents config
    # 目录配置
    [params.page.toc]
      # whether to enable the table of the contents
      # 是否使用目录
      enable = true
      # whether to keep the static table of the contents in front of the post
      # 是否保持使用文章前面的静态目录
      keepStatic = false
      # whether to make the table of the contents in the sidebar automatically collapsed
      # 是否使侧边目录自动折叠展开
      auto = true
    # Code config
    # 代码配置
    [params.page.code]
      # whether to show the copy button of the code block
      # 是否显示代码块的复制按钮
      copy = true
      # the maximum number of lines of displayed code by default
      # 默认展开显示的代码行数
      maxShownLines = 1000
    # KaTeX mathematical formulas config (KaTeX https://katex.org/)
    # KaTeX 数学公式配置 (KaTeX https://katex.org/)
    [params.page.math]
      enable = true
      # default inline delimiter is $ ... $ and \( ... \)
      # 默认行内定界符是 $ ... $ 和 \( ... \)
      inlineLeftDelimiter = ""
      inlineRightDelimiter = ""
      # default block delimiter is $$ ... $$, \[ ... \], \begin{equation} ... \end{equation} and some other functions
      # 默认块定界符是 $$ ... $$, \[ ... \],  \begin{equation} ... \end{equation} 和一些其它的函数
      blockLeftDelimiter = ""
      blockRightDelimiter = ""
      # KaTeX extension copy_tex
      # KaTeX 插件 copy_tex
      copyTex = true
      # KaTeX extension mhchem
      # KaTeX 插件 mhchem
      mhchem = true
    # Mapbox GL JS config (Mapbox GL JS https://docs.mapbox.com/mapbox-gl-js)
    # Mapbox GL JS 配置 (Mapbox GL JS https://docs.mapbox.com/mapbox-gl-js)
    [params.page.mapbox]
      # access token of Mapbox GL JS
      # Mapbox GL JS 的 access token
      accessToken = "pk.eyJ1IjoiZGlsbG9uenEiLCJhIjoiY2s2czd2M2x3MDA0NjNmcGxmcjVrZmc2cyJ9.aSjv2BNuZUfARvxRYjSVZQ"
      # style for the light theme
      # 浅色主题的地图样式
      lightStyle = "mapbox://styles/mapbox/light-v10?optimize=true"
      # style for the dark theme
      # 深色主题的地图样式
      darkStyle = "mapbox://styles/mapbox/dark-v10?optimize=true"
      # whether to add NavigationControl (https://docs.mapbox.com/mapbox-gl-js/api/#navigationcontrol)
      # 是否添加 NavigationControl (https://docs.mapbox.com/mapbox-gl-js/api/#navigationcontrol)
      navigation = true
      # whether to add GeolocateControl (https://docs.mapbox.com/mapbox-gl-js/api/#geolocatecontrol)
      # 是否添加 GeolocateControl (https://docs.mapbox.com/mapbox-gl-js/api/#geolocatecontrol)
      geolocate = true
      # whether to add ScaleControl (https://docs.mapbox.com/mapbox-gl-js/api/#scalecontrol)
      # 是否添加 ScaleControl (https://docs.mapbox.com/mapbox-gl-js/api/#scalecontrol)
      scale = true
      # whether to add FullscreenControl (https://docs.mapbox.com/mapbox-gl-js/api/#fullscreencontrol)
      # 是否添加 FullscreenControl (https://docs.mapbox.com/mapbox-gl-js/api/#fullscreencontrol)
      fullscreen = true
    # Social share links in post page
    # 文章页面的分享信息设置
    [params.page.share]
      enable = true
      Twitter = true
      Facebook = true
      Linkedin = false
      Whatsapp = false
      Pinterest = false
      Tumblr = false
      HackerNews = true
      Reddit = false
      VK = false
      Buffer = false
      Xing = false
      Line = true
      Instapaper = false
      Pocket = false
      Flipboard = false
      Weibo = true
      Blogger = false
      Baidu = false
      Odnoklassniki = false
      Evernote = false
      Skype = false
      Trello = false
      Mix = false
    # Comment config
    # 评论系统设置
    [params.page.comment]
      enable = true
      # Disqus comment config (https://disqus.com/)
      # Disqus 评论系统设置 (https://disqus.com/)
      [params.page.comment.disqus]
        enable = false
        # Disqus shortname to use Disqus in posts
        # Disqus 的 shortname，用来在文章中启用 Disqus 评论系统
        shortname = ""
      # Gitalk comment config (https://github.com/gitalk/gitalk)
      # Gitalk 评论系统设置 (https://github.com/gitalk/gitalk)
      [params.page.comment.gitalk]
        enable = false
        owner = ""
        repo = ""
        clientId = ""
        clientSecret = ""
      # Valine comment config (https://github.com/xCss/Valine)
      # Valine 评论系统设置 (https://github.com/xCss/Valine)
      [params.page.comment.valine]
        enable = true
        appId = "QGzwQXOqs5JOhN4RGPOkR2mR-MdYXbMMI"
        appKey = "WBmoGyJtbqUswvfLh6L8iEBr"
        placeholder = ""
        avatar = "mp"
        meta= ""
        pageSize = 10
        # automatically adapt the current theme i18n configuration when empty
        # 为空时自动适配当前主题 i18n 配置
        lang = ""
        visitor = true
        recordIP = true
        highlight = true
        enableQQ = false
        serverURLs = "https://leancloud.hugoloveit.com"
        # emoji data file name, default is "google.yml"
        # ["apple.yml", "google.yml", "facebook.yml", "twitter.yml"]
        # located in "themes/LoveIt/assets/lib/valine/emoji/" directory
        # you can store your own data files in the same path under your project:
        # "assets/lib/valine/emoji/"
        # emoji 数据文件名称, 默认是 "google.yml"
        # ["apple.yml", "google.yml", "facebook.yml", "twitter.yml"]
        # 位于 "themes/LoveIt/assets/lib/valine/emoji/" 目录
        # 可以在你的项目下相同路径存放你自己的数据文件:
        # "assets/lib/valine/emoji/"
        emoji = ""
      # Facebook comment config (https://developers.facebook.com/docs/plugins/comments)
      # Facebook 评论系统设置 (https://developers.facebook.com/docs/plugins/comments)
      [params.page.comment.facebook]
        enable = false
        width = "100%"
        numPosts = 10
        appId = ""
        # automatically adapt the current theme i18n configuration when empty
        # 为空时自动适配当前主题 i18n 配置
        languageCode = ""
      # Telegram comments config (https://comments.app/)
      # Telegram comments 评论系统设置 (https://comments.app/)
      [params.page.comment.telegram]
        enable = false
        siteID = ""
        limit = 5
        height = ""
        color = ""
        colorful = true
        dislikes = false
        outlined = false
      # Commento comment config (https://commento.io/)
      # Commento comment 评论系统设置 (https://commento.io/)
      [params.page.comment.commento]
        enable = false
      # utterances comment config (https://utteranc.es/)
      # utterances comment 评论系统设置 (https://utteranc.es/)
      [params.page.comment.utterances]
        enable = false
        # owner/repo
        repo = ""
        issueTerm = "pathname"
        label = ""
        lightTheme = "github-light"
        darkTheme = "github-dark"
      # giscus comment config (https://giscus.app/)
      # giscus comment 评论系统设置 (https://giscus.app/zh-CN)
      [params.page.comment.giscus]
        # You can refer to the official documentation of giscus to use the following configuration.
        # 你可以参考官方文档来使用下列配置
        enable = false
        repo = ""
        repoId = ""
        category = "Announcements"
        categoryId = ""
        # automatically adapt the current theme i18n configuration when empty
        # 为空时自动适配当前主题 i18n 配置
        lang = ""
        mapping = "pathname"
        reactionsEnabled = "1"
        emitMetadata = "0"
        inputPosition = "bottom"
        lazyLoading = false
        lightTheme = "light"
        darkTheme = "dark"
    # Third-party library config
    # 第三方库配置
    [params.page.library]
      [params.page.library.css]
        # someCSS = "some.css"
        # located in "assets/" 位于 "assets/"
        # Or 或者
        # someCSS = "https://cdn.example.com/some.css"
      [params.page.library.js]
        # someJavascript = "some.js"
        # located in "assets/" 位于 "assets/"
        # Or 或者
        # someJavascript = "https://cdn.example.com/some.js"
    # Page SEO config
    # 页面 SEO 配置
    [params.page.seo]
      # image URL
      # 图片 URL
      images = []
      # Publisher info
      # 出版者信息
      [params.page.seo.publisher]
        name = "xxxx"
        logoUrl = "/images/avatar.png"

  # TypeIt config
  # TypeIt 配置
  [params.typeit]
    # typing speed between each step (measured in milliseconds)
    # 每一步的打字速度 (单位是毫秒)
    speed = 100
    # blinking speed of the cursor (measured in milliseconds)
    # 光标的闪烁速度 (单位是毫秒)
    cursorSpeed = 1000
    # character used for the cursor (HTML format is supported)
    # 光标的字符 (支持 HTML 格式)
    cursorChar = "|"
    # cursor duration after typing finishing (measured in milliseconds, "-1" means unlimited)
    # 打字结束之后光标的持续时间 (单位是毫秒, "-1" 代表无限大)
    duration = -1

  # Site verification code for Google/Bing/Yandex/Pinterest/Baidu
  # 网站验证代码，用于 Google/Bing/Yandex/Pinterest/Baidu
  [params.verification]
    google = ""
    bing = ""
    yandex = ""
    pinterest = ""
    baidu = ""

  # Site SEO config
  # 网站 SEO 配置
  [params.seo]
    # image URL
    # 图片 URL
    image = "/images/Apple-Devices-Preview.png"
    # thumbnail URL
    # 缩略图 URL
    thumbnailUrl = "/images/screenshot.png"

  # Analytics config
  # 网站分析配置
  [params.analytics]
    enable = false
    # Google Analytics
    [params.analytics.google]
      id = ""
      # whether to anonymize IP
      # 是否匿名化用户 IP
      anonymizeIP = true
    # Fathom Analytics
    [params.analytics.fathom]
      id = ""
      # server url for your tracker if you're self hosting
      # 自行托管追踪器时的主机路径
      server = ""
    # Plausible Analytics
    [params.analytics.plausible]
      dataDomain = ""
    # Yandex Metrica
    [params.analytics.yandexMetrica]
      id = ""

  # Cookie consent config
  # Cookie 许可配置
  [params.cookieconsent]
    enable = false
    # text strings used for Cookie consent banner
    # 用于 Cookie 许可横幅的文本字符串
    [params.cookieconsent.content]
      message = ""
      dismiss = ""
      link = ""

  # CDN config for third-party library files
  # 第三方库文件的 CDN 设置
  [params.cdn]
    # CDN data file name, disabled by default
    # ["jsdelivr.yml"]
    # located in "themes/LoveIt/assets/data/cdn/" directory
    # you can store your own data files in the same path under your project:
    # "assets/data/cdn/"
    # CDN 数据文件名称, 默认不启用
    # ["jsdelivr.yml"]
    # 位于 "themes/LoveIt/assets/data/cdn/" 目录
    # 可以在你的项目下相同路径存放你自己的数据文件:
    # "assets/data/cdn/"
    data = "jsdelivr.yml"

  # Compatibility config
  # 兼容性设置
  [params.compatibility]
    # whether to use Polyfill.io to be compatible with older browsers
    # 是否使用 Polyfill.io 来兼容旧式浏览器
    polyfill = false
    # whether to use object-fit-images to be compatible with older browsers
    # 是否使用 object-fit-images 来兼容旧式浏览器
    objectFit = false

# Markup related configuration in Hugo
# Hugo 解析文档的配置
[markup]
  # Syntax Highlighting (https://gohugo.io/content-management/syntax-highlighting)
  # 语法高亮设置 (https://gohugo.io/content-management/syntax-highlighting)
  [markup.highlight]
    codeFences = true
    guessSyntax = true
    lineNos = true
    lineNumbersInTable = true
    # false is a necessary configuration (https://github.com/dillonzq/LoveIt/issues/158)
    # false 是必要的设置 (https://github.com/dillonzq/LoveIt/issues/158)
    noClasses = false
  # Goldmark is from Hugo 0.60 the default library used for Markdown
  # Goldmark 是 Hugo 0.60 以来的默认 Markdown 解析库
  [markup.goldmark]
    [markup.goldmark.extensions]
      definitionList = true
      footnote = true
      linkify = true
      strikethrough = true
      table = true
      taskList = true
      typographer = true
    [markup.goldmark.renderer]
      # whether to use HTML tags directly in the document
      # 是否在文档中直接使用 HTML 标签
      unsafe = true
  # Table Of Contents settings
  # 目录设置
  [markup.tableOfContents]
    startLevel = 2
    endLevel = 6

# Sitemap config
# 网站地图配置
[sitemap]
  changefreq = "weekly"
  filename = "sitemap.xml"
  priority = 0.5

# Permalinks config (https://gohugo.io/content-management/urls/#permalinks)
# Permalinks 配置 (https://gohugo.io/content-management/urls/#permalinks)
[Permalinks]
  # posts = ":year/:month/:filename"
  posts = ":filename"

# Privacy config (https://gohugo.io/about/hugo-and-gdpr/)
# 隐私信息配置 (https://gohugo.io/about/hugo-and-gdpr/)
[privacy]
  # privacy of the Google Analytics (replaced by params.analytics.google)
  # Google Analytics 相关隐私 (被 params.analytics.google 替代)
  [privacy.googleAnalytics]
    # ...
  [privacy.twitter]
    enableDNT = true
  [privacy.youtube]
    privacyEnhanced = true

# Options to make output .md files
# 用于输出 Markdown 格式文档的设置
[mediaTypes]
  [mediaTypes."text/plain"]
    suffixes = ["md"]

# Options to make output .md files
# 用于输出 Markdown 格式文档的设置
[outputFormats.MarkDown]
  mediaType = "text/plain"
  isPlainText = true
  isHTML = false

# Options to make hugo output files
# 用于 Hugo 输出文档的设置
[outputs]
  home = ["HTML", "RSS", "JSON"]
  page = ["HTML", "MarkDown"]
  section = ["HTML", "RSS"]
  taxonomy = ["HTML", "RSS"]
  taxonomyTerm = ["HTML"]

# Multilingual
# 多语言
[languages]
  [languages.en]
    weight = 1
    languageCode = "en"
    languageName = "English"
    hasCJKLanguage = false
    copyright = "This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License."
    [languages.en.menu]
      [[languages.en.menu.main]]
        weight = 1
        identifier = "posts"
        pre = ""
        post = ""
        name = "Posts"
        url = "/posts/"
        title = ""
      [[languages.en.menu.main]]
        weight = 2
        identifier = "tags"
        pre = ""
        post = ""
        name = "Tags"
        url = "/tags/"
        title = ""
      [[languages.en.menu.main]]
        weight = 3
        identifier = "categories"
        pre = ""
        post = ""
        name = "Categories"
        url = "/categories/"
        title = ""
      [[languages.en.menu.main]]
        weight = 4
        identifier = "documentation"
        pre = ""
        post = ""
        name = "Docs"
        url = "/categories/documentation/"
        title = ""
      [[languages.en.menu.main]]
        weight = 5
        identifier = "about"
        pre = ""
        post = ""
        name = "About"
        url = "/about/"
        title = ""
      [[languages.en.menu.main]]
        weight = 6
        identifier = "github"
        pre = "<i class='fab fa-github fa-fw' aria-hidden='true'></i>"
        post = ""
        name = ""
        url = "https://github.com/dillonzq/LoveIt"
        title = "GitHub"
    [languages.en.params]
      [languages.en.params.search]
        enable = true
        type = "algolia"
        contentLength = 4000
        placeholder = ""
        maxResultLength = 10
        snippetLength = 30
        highlightTag = "em"
        absoluteURL = false
        [languages.en.params.search.algolia]
          index = "index.en"
          appID = "PASDMWALPK"
          searchKey = "b42948e51daaa93df92381c8e2ac0f93"
      [languages.en.params.home]
        rss = 10
        [languages.en.params.home.profile]
          enable = true
          gravatarEmail = ""
          avatarURL = "/images/avatar.png"
          title = ""
          subtitle = "A Clean, Elegant but Advanced Hugo Theme"
          typeit = true
          social = true
          disclaimer = ""
      [languages.en.params.social]
        GitHub = "xxxx"
        Twitter = "xxxx"
        Instagram = "xxxx"
        Facebook = "xxxx"
        Telegram = "xxxx"
        Youtubelegacy = "xxxx"
        Phone = "555-555-555"
        Email = "xxxx@xxxx.com"
        RSS = true
        [languages.en.params.social.Mastodon]
          id = "@xxxx"
          prefix = "https://mastodon.technology/"

  [languages.zh-cn]
    weight = 2
    languageCode = "zh-CN"
    languageName = "简体中文"
    hasCJKLanguage = true
    copyright = "This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License."
    [languages.zh-cn.menu]
      [[languages.zh-cn.menu.main]]
        weight = 1
        identifier = "posts"
        pre = ""
        post = ""
        name = "所有文章"
        url = "/posts/"
        title = ""
      [[languages.zh-cn.menu.main]]
        weight = 2
        identifier = "tags"
        pre = ""
        post = ""
        name = "标签"
        url = "/tags/"
        title = ""
      [[languages.zh-cn.menu.main]]
        weight = 3
        identifier = "categories"
        pre = ""
        post = ""
        name = "分类"
        url = "/categories/"
        title = ""
      [[languages.zh-cn.menu.main]]
        weight = 4
        identifier = "documentation"
        pre = ""
        name = "文档"
        url = "/categories/documentation/"
        title = ""
      [[languages.zh-cn.menu.main]]
        weight = 5
        identifier = "about"
        pre = ""
        post = ""
        name = "关于"
        url = "/about/"
        title = ""
      [[languages.zh-cn.menu.main]]
        weight = 6
        identifier = "github"
        pre = "<i class='fab fa-github fa-fw' aria-hidden='true'></i>"
        post = ""
        name = ""
        url = "https://github.com/dillonzq/LoveIt"
        title = "GitHub"
    [languages.zh-cn.params]
      [languages.zh-cn.params.search]
        enable = true
        type = "algolia"
        contentLength = 4000
        placeholder = ""
        maxResultLength = 10
        snippetLength = 50
        highlightTag = "em"
        absoluteURL = false
        [languages.zh-cn.params.search.algolia]
          index = "index.zh-cn"
          appID = "PASDMWALPK"
          searchKey = "b42948e51daaa93df92381c8e2ac0f93"
      [languages.zh-cn.params.home]
        rss = 100
        [languages.zh-cn.params.home.profile]
          enable = false
          gravatarEmail = ""
          avatarURL = "/images/avatar.png"
          title = ""
          subtitle = "一个简洁、优雅且高效的 Hugo 主题"
          typeit = true
          social = true
          disclaimer = ""
      [languages.zh-cn.params.social]
        GitHub = "xxxx"
        Weibo = "xxxx"
        Steam = "xxxx"
        Zhihu = "xxxx"
        Douban = "xxxx"
        Devto = "xxxx"
        Bilibili = "xxxx"
        Email = "xxxx@xxxx.com"
        Phone = "555-555-555"
        RSS = true
```

# 配置环境变量

``` bash
export HUGO1=/cygdrive/d/share/hugo/hugo1
export H1P=/cygdrive/d/share/hugo/hugo1/content/posts
export H1U="source /cygdrive/d/share/hugo/hugo1/upload.sh"
```
upload.sh脚本包含的是博客编译并上传的命令

# 在 Hugo 的 config.yaml 文件中配置菜单

你需要在 `menu` 字段下添加相应的内容。在你提供的配置文件中，你可以看到以下部分用于定制菜单：

```yaml
menu:
    main: []

    social:
        - identifier: github
          name: GitHub
          url: https://github.com/ynhugo
          params:
              icon: brand-github

        - identifier: twitter
          name: Twitter
          url: https://twitter.com
          params:
              icon: brand-twitter
```

在上面的示例中，`menu` 字段下定义了两个菜单：`main` 和 `social`。你可以根据自己的需求添加或修改菜单项。例如，如果你想在 `main` 菜单中添加一个链接到主页的菜单项，可以像这样修改配置：

```yaml
menu:
    main:
        - identifier: home
          name: 首页
          url: /
          weight: 1
```

这样就会在网站的主菜单中添加一个指向首页的链接。记得根据自己的网站需求和页面结构来调整菜单配置。对于其他文件，通常不需要额外的配置来支持菜单的显示，只需在 `config.yaml` 中正确配置即可。

# 在 Hugo 的配置文件中添加图标通常需要使用图标库或者自定义图标

在你提供的配置文件中，看到有一个示例使用了 `icon: brand-github` 和 `icon: brand-twitter` 来指定图标。这里使用的是 FontAwesome 图标库中的图标类名。

如果你想使用其他图标库或自定义图标，可以按照以下步骤进行：

1. **选择图标库：**选择一个适合你需求的图标库，比如 Font Awesome、Material Icons 等。确保你能够获取到所需图标的类名或标识符。

2. **下载或引入图标库：**根据图标库的要求，下载相应的图标文件或通过 CDN 引入。将图标库的 CSS 文件或 JavaScript 文件链接添加到你的 Hugo 主题中。

3. **配置图标：**在 Hugo 的配置文件中，为菜单项指定相应的图标类名或标识符。例如，如果你选择了 Font Awesome 图标库，可以像下面这样配置：

```yaml
menu:
    social:
        - identifier: github
          name: GitHub
          url: https://github.com/ynhugo
          params:
              icon: fab fa-github

        - identifier: twitter
          name: Twitter
          url: https://twitter.com
          params:
              icon: fab fa-twitter
```

在上述示例中，`fab` 表示 Font Awesome 的品牌图标系列，后面跟着具体的图标名称。根据你选择的图标库和图标名称，替换 `fab fa-github` 和 `fab fa-twitter` 部分即可。

4. **查看效果：**保存配置文件并重新生成 Hugo 网站，查看菜单是否显示了相应的图标。

记得根据实际情况调整图标库和图标类名，确保图标能够正确显示在你的网站上。

# 在 Hugo 中，创建对应菜单的首页文件通常是通过创建 content 文件来实现的

你可以按照以下步骤来创建对应菜单的首页文件：

1. **确定菜单对应的内容页面：** 首先确定菜单项所对应的内容页面。比如，如果你创建了一个 "blog" 菜单，那么你可能需要创建一个用于显示博客列表的页面。

2. **创建内容文件：** 在 Hugo 网站的 `content` 目录下，根据菜单对应的内容类型创建相应的 Markdown 文件。假设你要创建一个 "blog" 菜单对应的页面，可以在 `content` 目录下创建一个名为 `blog.md` 的文件。

3. **编辑内容文件：** 编辑刚创建的 Markdown 文件，添加页面所需的 Front Matter 和内容。Front Matter 是位于文件开头的一组 YAML 元数据，用于定义页面的属性，比如标题、日期、标签等。

   例如，一个简单的 `blog.md` 文件可能如下所示：

   ```markdown
   ---
   title: "博客"
   date: 2024-03-24
   description: "这是我的博客页面"
   ---

   这里是博客页面的内容。
   ```

4. **保存文件并生成网站：** 保存 `blog.md` 文件并重新生成 Hugo 网站。在生成的网站中，你应该能够在菜单中看到相应的 "博客" 链接，并且点击链接后会跳转到你刚创建的内容页面。

根据你的网站主题和页面结构，有时候不同的主题可能需要在不同的位置进行配置或创建文件，具体操作可能会有些许差异。请根据你使用的主题及其文档说明进行相应的操作。

# 添加About 栏

如果 ~/hugo_blog/content/ 下面没有about 文件夹的话

在 ~/hugo_blog/content/ 创建 about 目录，并在该目录下添加 index.md 文件

```yaml
---
title : "About"
lastmod : 2022-03-10T19:36:26+08:00
draft : false
menu:
    main: 
        weight: -90
        params:
            icon: user
---

Hellow, World!
```

:@ 注意: Even 主题中 文件头部是用 +++ +++ 包起来的 而Stack 主题中 文件头部是用 --- --- 包起来的
而且在Stack 中 menu: 到时user 部分不能动, 哪怕是改了缩进都会导致识别不出About

## 参考链接

[博客切换到STACK 主题](https://skfwe.cn/p/博客切换到stack-主题/)

## 要使用其他图标，你可以按照以下步骤获取对应的 SVG 代码：

1. 打开一个提供免费图标的网站，比如 [Tabler Icons](https://tablericons.com/)、[FontAwesome](https://fontawesome.com/) 或 [Feather Icons](https://feathericons.com/)。

2. 在网站上搜索你想要使用的图标，然后找到该图标对应的 SVG 代码。这些网站通常会提供直接复制的 SVG 代码。

3. 复制选定图标的完整 SVG 代码。

4. 将复制的 SVG 代码粘贴到 Hugo 博客的 Markdown 或 HTML 文件中，遵循之前提到的插入方法。

5. 确保格式正确，保存文件并在浏览器中查看效果。
