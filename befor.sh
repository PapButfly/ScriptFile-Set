#! /bin/bash

#
## 前期准备
#
echo "前期准备工作将于5秒后开始"
sleep 5
# 更新apt源
sudo apt update -y
sudo apt upgrade -y
# 安装 docker-compose
# apt install docker-compose-plugin -y
# 配置docker镜像
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://rk1lvq4j.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
echo "前期准备完成"