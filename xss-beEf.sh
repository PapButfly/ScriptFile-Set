#! /bin/bash

# 
## 阿里云一键安装搭建 xss-server 命令
## 默认自带了docker社区版
# 


#
## 开始搭建 beEf-xss
#
echo "beEf-xss搭建将于5秒后开始"
sleep 5
# 下载压缩包
if [ -f "beef-docker.tar" ]; then
        echo "文件已存在，正在导入docker"
        # 镜像导入到 docker
        result=$(docker load < beef-docker.tar 2>&1)
else
        echo "正在下载beef-docker.tar文件"
        wget https://oss-cdn.mashibing.com/teacher_attachment/149339/beef-docker.tar
fi

# 提取 ID
image_id=$(echo "$result" | grep "Loaded image ID" | awk '{print $4}')
if [ -n "$image_id" ]; then
    echo "捕获到的镜像 ID 为: $image_id"
    docker tag "$image_id" beef
else
    echo "错误：未能自动获取镜像 ID，请检查 tar 包是否完整。"
    echo "报错信息如下:"
    echo "$result"
    exit 1
fi
# 清理旧容器
echo "正在清理旧容器..."
docker rm -f beef 2>/dev/null
# 启动 beEf容器
docker run -d --name beef -p 3000:3000 beef
echo "beEf 容器启动完成"
echo "请通过 http://localhost:3000/ui/panel 访问页面"
echo "默认账密都是:beef"

# 修改账号密码
# 确保容器已经运行且名字是 beef
CONTAINER_NAME="beef"
echo "----------------------------------------"
# 1. 询问是否修改
read -p "❓ 检测到默认配置，是否需要修改 BeEF 的账号和密码? (y/n): " answer

# 2. 判断输入
# [yY]* 表示兼容输入 y, Y, yes, YES
if [[ "$answer" == [yY]* ]]; then
    echo "正在进入修改向导..."
    
    # 输入新账号
    read -p "👤 请输入新的账号: " new_user
    
    # 输入新密码 
    read -p "🔑 请输入新的密码: " new_pass
    echo "" # 因为输入密码不换行，这里手动输出一个换行
    
    echo "⏳ 正在应用修改..."

    # 3. 使用 sed 修改容器内的 config.yaml
    # 逻辑：匹配 user: "xxx" 替换为 user: "新账号"
    # 注意：这里的正则匹配 user: ".*" 意思是匹配引号里原来的任何内容，替换成新的
    docker exec $CONTAINER_NAME sed -i "s/user:[[:space:]]*".*"/user: \"$new_user\"/g" /opt/beef/config.yaml
    docker exec $CONTAINER_NAME sed -i "s/passwd:[[:space:]]*".*"/passwd: \"$new_pass\"/g" /opt/beef/config.yaml
    
    # 4. 重启容器生效
    echo "🔄 正在重启容器以使配置生效..."
    docker restart $CONTAINER_NAME
    
    echo "✅ 修改成功！"

else
    echo "已跳过修改，将使用默认账号密码 (beef/beef)。"
fi

echo "----------------------------------------"
