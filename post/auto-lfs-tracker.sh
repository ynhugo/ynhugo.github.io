#!/bin/bash
set -e

SCAN_DIR="post"
CONFIG_FILE=".gitattributes"
SCAN_ONLY=false

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
cat <<EOF
=============================================
        智能 Git LFS 自动追踪工具（加固终极版）
=============================================
【使用】
   ./auto-lfs-tracker.sh          # 自动扫描 + 提交配置
   ./auto-lfs-tracker.sh --scan-only # 仅扫描（钩子专用，不提交）
   ./auto-lfs-tracker.sh --help   # 查看帮助

=============================================
【一、历史大文件迁移到 LFS（仅执行一次）】
  作用：将仓库旧大文件转为 LFS 托管
=============================================
git lfs migrate import --everything --include="**/resources/**/*"
git push origin main --force

=============================================
【二、迁移后 .git 瘦身清理（必做）】
  作用：删除旧历史，从 GB → MB 级别
=============================================
git reflog expire --all --expire=now
git gc --prune=now --aggressive

=============================================
【三、pre-push 钩子安装（push 自动检查）】
  作用：每次 push 前自动扫描新文件类型
=============================================
cat > .git/hooks/pre-push << 'EOF_HOOK'
#!/bin/bash
echo "🔍 Git Push 前自动检查 LFS 未追踪文件（仅扫描）..."
./auto-lfs-tracker.sh --scan-only
EOF_HOOK
chmod +x .git/hooks/pre-push
chmod +x auto-lfs-tracker.sh

=============================================
【四、🔥 GitHub Actions / 克隆 404 / GH008 错误修复】
【报错：Object does not exist on the server / unknown Git LFS object】
  作用：把本地 LFS 大文件真正上传到 GitHub 服务器（必执行）
=============================================
git lfs push origin main --all
git push origin main --force

=============================================
【五、.sh 脚本误进 LFS 修复】
【报错：Smudge error 下载 sh 文件失败】
  作用：把脚本移出 LFS，恢复正常文本文件
=============================================
git lfs untrack "*.sh"
git add --renormalize auto-lfs-tracker.sh
git add .gitattributes
git commit -m "fix: 移除 .sh 从 LFS"
git push origin main --force

=============================================
【脚本作用】
1. 自动扫描 post/ 目录所有资源文件
2. 自动追加未追踪的类型到 Git LFS
3. 自动保护 **/resources/**/* 全部托管
4. 自动排除 .sh/.md/.org 等文本文件
5. 自动排除编辑器临时文件 *Minibuf* .DS_Store
6. 防止 Git 仓库爆炸、保证 CI 正常运行
7. 加固防 GH008 推送拒绝错误
=============================================
EOF
exit 0
fi

if [[ "$1" == "--scan-only" ]]; then
  SCAN_ONLY=true
  echo "============================================="
  echo "       智能 Git LFS 扫描模式（仅检查）"
  echo "============================================="
fi

cd "$(dirname "$0")"

echo -e "\n📂 扫描目录：$SCAN_DIR"

# 🔥 加固：排除文本、脚本、配置、编辑器临时文件
all_exts=$(find "$SCAN_DIR" -type f | \
  grep -vE '\.md$|\.org$|\.sh$|\.git|\.gitattributes|\.gitignore|README|LICENSE|^\./|/\.|Minibuf|\.DS_Store' | \
  sed -e 's/^.*\.//' | sort -u | grep -v '^/' | grep -v '^$' | grep -v ' ' | head -30)

echo -e "\n🔍 扫描到的文件类型："
echo "$all_exts"

existing_patterns=$(git lfs track | awk '{print $1}')
added=0

for ext in $all_exts; do
    # 🔥 加固：过滤非法后缀、空后缀、带空格的垃圾文件
    if [[ -z "$ext" || "$ext" =~ " " || "$ext" =~ "/" || "$ext" =~ "*" ]]; then
        continue
    fi

    pattern="*.${ext}"
    if ! echo "$existing_patterns" | grep -qx "$pattern"; then
        echo "✅ 新增 LFS 追踪：$pattern"
        git lfs track "$pattern"
        added=$((added + 1))
    fi
done

# 强制全局 resources 规则
if ! grep -q "**/resources/**/\*" "$CONFIG_FILE"; then
    echo "✅ 启用全局规则：**/resources/**/*"
    git lfs track "**/resources/**/*"
    added=$((added + 1))
fi

# 钩子模式：不提交
if [[ "$SCAN_ONLY" == true ]]; then
  echo -e "\n✅ 扫描完成（钩子模式：不提交）"
  exit 0
fi

if [ $added -gt 0 ]; then
    echo -e "\n📝 提交配置..."
    git add "$CONFIG_FILE"
    git commit -m "auto: lfs 自动追踪新文件类型"
    echo -e "\n🎉 更新完成！"
else
    echo -e "\n🎉 所有类型已追踪，无需更新！"
fi

echo -e "\n✅ 全部完成！"
