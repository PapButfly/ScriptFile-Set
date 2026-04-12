# 备份常用的 sh 文件

## 换源问题

> 来源于: https://github.com/SuperManito/LinuxMirrors

- ### GNU/Linux 更换系统软件源

    ```bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh)
    ```

- ### Docker 安装与换源

    ```bash
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
    ```

- ### Docker 更换镜像加速器（已安装docker）

    ```bash
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --only-registry
    ```

- ### Git 换源（国内）

    ```bash
    bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh)
    ```

## 其他命令

- ### Linux 改时区
  
  ```bash
  sudo timedatectl set-timezone Asia/Shanghai
  ```

  
