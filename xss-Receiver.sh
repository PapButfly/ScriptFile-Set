#! /bin/bash

# 
## 阿里云一键安装搭建 蓝莲花的XSSServer（docker版） 命令
## 默认自带了docker社区版
# 

echo "XSS-Receiver将于5秒后开始搭建"
sleep 5

# 1. 克隆项目
git clone https://github.com/DL668/XSSReceiver.git
cd XSSReceiver

# 2. 启动容器
docker compose up -d

echo "XSS-Receiver 搭建完成"
echo "请先通过 http://localhost/install.php 初始化数据库"
echo "然后访问 http://localhost/login.php 输入自设的密码登录后台"
echo "and Enjoy！"