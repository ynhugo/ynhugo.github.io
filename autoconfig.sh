# 修改baseurl
sed -i 's|\(^baseurl = "\).*\("\)|\1https://ynhugo.github.io/\2|g' config/_default/config.toml
# 修改语言
sed -i 's|\(^locale[[:space:]]*= "\).*\("\)|\1zh-cn\2|g' config/_default/config.toml
# 修改title
sed -i 's|\(^title[[:space:]]*= "\).*\("\)|\1ynhugo\2|g' config/_default/config.toml
# 修改默认博文语言
sed -i 's|\(^defaultContentLanguage[[:space:]]*= "\).*\("\)|\1zh-cn\2|g' config/_default/config.toml
# 修改每页显示博文数量
sed -i 's|\(^[[:space:]]*pagerSize[[:space:]]*= \).*|\120|g' config/_default/config.toml
