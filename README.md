<div align="center">

# 🔒 VPN Project

![Python](https://img.shields.io/badge/python-3.11-blue)
![Docker](https://img.shields.io/badge/docker-required-blue)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS-lightgrey)

**직접개발 VPN 서버-클라이언트**

안정성을 높이기 위해 우회 방식을 공개하지는 않고, 설정 파일을 전체 공개합니다. 
https://hub.docker.com/repository/docker/scbaek65/vpn-server/tags


</div>

# Self-Developed VPN Server–Client

To improve stability, the bypass mechanism is not disclosed.  
Instead, the full configuration files are provided.

---

## 1. Server Setup

Purchase a virtual cloud server from **AWS / GCP / Azure** or another provider.

1. Open **port 443**
2. Select **Ubuntu Linux**
3. Install **Docker for Ubuntu**

Docker installation guide:  
https://docs.docker.com/engine/install/ubuntu/

---

### Single Server as VPN Server (Easy)

```env
1. Create a `docker-compose.yml` file in Linux  
   or upload the project files via FTP.

2. Edit the configuration values:


VPN_ENCRYPTION_KEY="Generate a random 32-character encryption key using uppercase, lowercase letters and special characters (do NOT use $)"
VPN_TLS_DOMAIN="Set a domain you want to mimic (example: google.com)"
Save the file and run:
sudo docker-compose up -d

Done.

Running Multiple Servers in Parallel (Intermediate)
Create or upload the following files:
docker-stack.yml
deploy.sh
remove.sh
Edit docker-stack.yml:
VPN_ENCRYPTION_KEY="Generate a random 32-character encryption key using uppercase, lowercase letters and special characters (do NOT use $)"
VPN_TLS_DOMAIN="Set a domain you want to mimic (example: google.com)"
Deploy:
sudo bash ./deploy.sh

Wait for the deployment to finish.

2. Client Setup

Currently supported operating systems:

macOS (ARM)
Windows

(Android client support is planned)

Enter the folder corresponding to your OS inside the client directory.
Edit the .env file:
VPN_SERVER_HOST="Server IP"
VPN_ENCRYPTION_KEY="Same 32-character key as the server"
VPN_TLS_SNI="Same disguised domain as the server"
Run the application and click Connect.

Wait a few seconds and the connection will be established.
⚠️ Note: After clicking "Connect" in the client application, please wait a moment until the "recv" value appears.

Contact

For inquiries about paid VPN server hosting, please contact:

📧 scbaek65@gmail.com


---

# 🇨🇳 中文版本 (Chinese)

```markdown
# 自研 VPN 服务器-客户端

为了提高稳定性，绕过机制不会公开。  
但完整的配置文件会提供。

---

## 1. 服务器设置

在 **AWS / GCP / Azure** 等云服务商购买一台虚拟服务器。

1. 开放 **443 端口**
2. 选择 **Ubuntu Linux**
3. 安装 **Docker**

Docker 安装说明：  
https://docs.docker.com/engine/install/ubuntu/

---

### 单服务器作为 VPN 服务器（简单）

1. 在 Linux 中创建 `docker-compose.yml`  
   或通过 FTP 上传项目文件。

2. 修改配置：

```env
VPN_ENCRYPTION_KEY="生成一个32位随机加密密钥（包含大小写字母和特殊字符，但不能使用 $）"
VPN_TLS_DOMAIN="设置一个想要伪装的域名（例如：google.com）"
保存后执行：
sudo docker-compose up -d

完成。

多服务器并行部署（稍复杂）
创建或上传以下文件：
docker-stack.yml
deploy.sh
remove.sh
修改 docker-stack.yml：
VPN_ENCRYPTION_KEY="生成一个32位随机加密密钥（包含大小写字母和特殊字符，但不能使用 $）"
VPN_TLS_DOMAIN="设置一个想要伪装的域名（例如：google.com）"
执行部署：
sudo bash ./deploy.sh

等待部署完成即可。

2. 客户端设置

当前支持的系统：

macOS (ARM)
Windows

（Android 客户端计划后续支持）

进入 client 目录中对应操作系统的文件夹。
修改 .env 文件：
VPN_SERVER_HOST="服务器IP"
VPN_ENCRYPTION_KEY="与服务器相同的32位加密密钥"
VPN_TLS_SNI="与服务器相同的伪装域名"
运行应用程序并点击 Connect。
⚠️ 注意事项： 在客户端程序中点击"连接"后，请稍等片刻，直到"recv"值出现为止。

等待几秒即可连接成功。

联系方式

如需咨询 付费 VPN 服务器服务，请联系：

📧 scbaek65@gmail.com

1. 서버 설정
AWS / GCP / Azure 등에서 가상 클라우드 서버 구입
443 포트를 개방하고, 우분투 리눅스를 선택한 후, 설치합니다.
우분투용 도커를 설치해주세요. 설치방법은 아래에 링크에서 확인합니다.
https://docs.docker.com/engine/install/ubuntu/

- 단일 서버만을 VPN 서버로 지정할 경우 (쉬움)
리눅스에서 docker-compose.yml 생성 또는 FTP 등으로 프로젝트 내의 파일을 이동
그후, VPN_ENCRYPTION_KEY="32자의 대소영문자 및 특수문자로 암호화키를 임의로 생성($ 특수문자는 사용불가)"
VPN_TLS_DOMAIN="위장하고 싶은 대표 도메인으로 설정 (예: google.com)" 형식으로 바꾸어 주세요.
저장 후, 명령어 sudo docker-compose up -d 를 입력하면 끝!

- 여러 서버를 병렬로 운영하고 싶은 경우 (약간 어려움)
리눅스에 docker-stack.yml 및 deploy.sh 및 remove.sh 파일 3개를 생성 또는 파일을 이동
그후,docker_stack.yml에서 VPN_ENCRYPTION_KEY="32자의 대소영문자 및 특수문자로 암호화키를 임의로 생성($ 특수문자는 사용불가)"
VPN_TLS_DOMAIN="위장하고 싶은 대표 도메인으로 설정 (예: google.com)" 형식으로 바꾸어 주세요.
저장후, sudo bash ./deploy.sh 입력 후 기다리면 끝!

2. 클라이언트 설정
현재 지원 OS - MacOS(ARM), Windows (추후 안드로이드 클라이언트 지원 예정)
client 폳더 내에서 각 OS에 맞는 폴더로 들어가, .env 파일에서 
VPN_SERVER_HOST="서버IP"
VPN_ENCRYPTION_KEY="서버와 동일한 32자 암호"
VPN_TLS_SNI="서버와 동일한 위장 URL"을 바꾸어 줍니다.
그후 각각의 응용 프로그램을 실행해 Connect 버튼을 누르고 잠시 기다리면 끝!
* 클라이언트 프로그램에서 "connect" 클릭후 recv 값이 나올 때 까지 잠시만 기다려 주세요

유료 서버 제공은 아래 이메일을 통해 문의해 주세요.
scbaek65@gmail.com
