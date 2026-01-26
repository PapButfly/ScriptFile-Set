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
