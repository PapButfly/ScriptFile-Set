#!/bin/bash

# ================= 配置区域 =================
# 你的虚拟机 IP
BEEF_HOST="192.168.5.4"
# 设置你要的密码
BEEF_PASS="123456"
# ===========================================

echo "🚀 开始构建 BeEF (方案2: 纯净修正版)..."

# 1. 清理环境
docker rm -f beef >/dev/null 2>&1

# 2. 拉取镜像
docker pull beefproject/beef:latest

# 3. 启动容器 (加入了 --entrypoint 参数)
# 原理解析：
# --entrypoint /bin/sh : 覆盖原镜像默认的启动程序，改用系统 shell
# -c "..." : 让 shell 执行我们的组合命令 (改密码 -> 启动 beef)

echo "🔥 启动容器..."
docker run -d \
  --name beef \
  --entrypoint /bin/sh \
  -p 3000:3000 \
  -p 6789:6789 \
  -e BEEF_HOST="$BEEF_HOST" \
  --restart=always \
  beefproject/beef \
  -c "sed -i 's/passwd: \"beef\"/passwd: \"$BEEF_PASS\"/g' config.yaml && ./beef"

echo "------------------------------------------------"
echo "✅ 启动成功！"
echo "📊 控制台: http://$BEEF_HOST:3000/ui/panel"
echo "👤 账号: beef"
echo "🔑 密码: $BEEF_PASS"
echo "🪝 Hook地址: http://$BEEF_HOST:3000/hook.js"
echo "------------------------------------------------"
echo "💡 如果想看日志: docker logs -f beef"