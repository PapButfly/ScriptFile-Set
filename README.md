# 备份常用的 sh 文件

## 换源问题

> 部分来源于: https://github.com/SuperManito/LinuxMirrors
> 推荐项目：https://github.com/RubyMetric/chsrc

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

- ### Docker 更换轩辕镜像

    ```bash
    bash <(wget -qO- https://get.xuanyuan.cloud/docker.sh)
    ```

- ### Pip 换源

    ```bash
    pip config set global.extra-index-url "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple http://mirrors.aliyun.com/pypi/simple https://mirrors.cloud.tencent.com/pypi/simple"
    ```


## 其他命令

- ### Linux 改时区
  
  ```bash
  sudo timedatectl set-timezone Asia/Shanghai
  ```

  
