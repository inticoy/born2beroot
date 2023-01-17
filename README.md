# README.md

# Why Virtual Machine?

## How Virtual Machine works?

<aside>
💾 Hypervisor가 가상머신이 호스트의 하드웨어를 사용할 수 있게끔 해준다. 하지만 Hypervisor 또한 Virtual Box와 같은 프로그램이기 때문에, 호스트의 운영체제 상에서 실행되어 가상머신이 요구한 작업이 실행되도록 하고, 가상머신 입장에서는 실제로 컴퓨터 하드웨어 상에서 곧바로 실행되는 것처럼 인식되도록 한다.

쉽게 말해, Virtual Box는 프로그램으로서 Host OS에게 실제 하드웨어를 일부분 할당받고, Guest OS가  할당받은 하드웨어를 전부라고 생각하게끔 해주는 역할을 한다.

</aside>

## Purpose of Virtual Machine

<aside>
💡 새로운 하드웨어를 장만할 필요 없이 시스템을 구축할 수 있다는 장점이 있다. 
개인의 관점에서는 맥을 쓰는 사람이 윈도우용 컴퓨터를 추가로 살 필요 없이 프로그램처럼 윈도우를 설치해 쓸 수 있기도하고 이를 통해 다른 운영체제에서만 사용할 수 있는 프로그램 등을 테스트하는 용도 등으로 사용할 수 있다.

예시로, Born2BeRoot 과제만 하더라도, 맥 컴퓨터에 리눅스를 물리적으로 설치하지 않고 가상머신에 설치함으로써 호스트 맥 운영체제에 영향을 주지 않고 리눅스 환경에서 다양한 작업들을 할 수 있고, 리눅스 환경의 서버를 구성할 수도 있다.

회사나 서버의 관점에서는 한대의 서버 컴퓨터에 여러 개의 가상 머신을 만들어 여러 개의 서버를 돌리면 유지 비용이나 관리 등에서 유리하다.
 
다양한 예시가 있겠지만, AWS 는 서버 컴퓨터 하나에서 가상 머신을 만들어 각각의 가상 머신 서버를 사용자들에게 빌려주는 방식으로 클라우드 서버 시스템을 대여해주고 있다.

</aside>

- 비용 절감, 민첩성 및 속도, 가동 중지 시간 감소, 스케일링 성능, 보안 이점 (출처 : [microsoft asure](https://azure.microsoft.com/ko-kr/resources/cloud-computing-dictionary/what-is-a-virtual-machine))

# About Debian

### Rocky vs. Debian

<aside>
🆚 Linux에는 크게 Redhat 계열과 Debian 계열의 Linux로 나누어진다.

Redhat Enterprise Linux는 Redhat 기업에서 개발하고 있는 기업용 리눅스로, 오픈 소스이지만, 1년 단위 구독을 해서 비용을 지불하면 SW 업데이트 등의 기술지원을 받을 수 있다. 한 기업에서 제공하는 리눅스이기 때문에 업데이트가 6개월 주기로 늦다. 패키지 관리자는 RPM(Redhat Package Manager)를 사용하며 패키지 의존성 해결을 위해  YUM을 사용한다. 패키지 개수는 3000여개로 적은데, 이는 안정성을 위한 것으로 보인다. 물론, 써드파티 패키지 관리자 등을 이용해 설치해서 사용할 수 있다.

Redhat 계열의 Linux는 Fedora Linux가 최신 기술을 포함해 업데이트가 되면 (Beta 버전과 같이) 이후 Redhat Enterprise Linux로 업데이트가 적용되고, 이후 그 코드를 가지고 Rocky Linux가 출시되는 방식이다. RHEL은 매우 안정적이여서 대형 기업들의 서버들로도 사용되고, CERN(유럽 입자 물리 연구소), Fermilab(페르미 국립 가속기 연구소) 등의 과학 연구소들에서도 이 리눅스를 사용한다.

Debian Linux는 커뮤니티 기반의 프로젝트로 개발되어 업데이트와 버그 수정이 빠르다. 패키지 관리자는 DPKG(Debian Package)를 사용하고, 패키지 의존성 해결을 위해 APT를 사용한다. 패키지 개수는 3만여개가 넘는다. 의존성 해결 측면에서는 YUM 보다 APT이 더 뛰어나다. 

Debian Linux는 Stable 버전만 존재하는 RHEL과 달리 Stable, Unstable, Testing 저장소가 존재한다. 일반 사용자들이 많이 사용하는 Ubuntu Linux 역시 Debian Linux를 기반으로 하며, 구글에서도 Debian을 기반으로 수정한 gLinux를 사용한다.

</aside>

### apt vs. aptitude

<aside>
💾 데비안 리눅스에서는 dpkg(Debian PacKaGe)로 *.deb 라는 설치 파일로 패키지를 설치 할 수 있다. 그런데 패키지들은 실행되기 위해 필요로 하는(의존하는) 다른 패키지들이 있는데, 이로 인해 의존성 문제가 발생하게 된다. 이를 해결하기 위해 Apt와 Aptitude 같은 Front-end 도구가 생겨났다. 

apt-get 은 사용자가 A 패키지의 설치를 요구하면 /etc/apt/sources.list 파일에서 우분투 패키지 저장소의 링크를 찾아 A 패키지 설치에 필요한 패키지 목록을 받아 필요 패키지들을 먼저 설치한 뒤 A 패키지를 설치한다.

APT는 커맨드 라인에서 작동하는 패키지 관리 도구이다. 기존에 패키지 설치 및 삭제를 위해 사용했던 apt-get과 패키지 검색 및 의존성 문제 확인을 위해 사용했던 apt-cache의 핵심 기능을 합쳐 조금 더 사용자 친화적으로 만든 도구이다.

Aptitude 는 기능상으로 apt와 비슷하지만 TUI(Text User Interface) 이며, 의존성 문제 발생시 다른 대안을 제시해주는 등의 추가 기능이 있다.

</aside>

### DAC vs. MAC

<aside>
🆚 리눅스나 유닉스는 기본적으로 DAC 방식을 이용해 사용자의 리소스에 대한 접근을 제어하는데, Redhat 계열의 리눅스에서는 SELinux(Security Enhanced Linux)가, Debian 계열에서는 AppApmor(Application Armor) 모듈이 MAC 방식을 이용해 접근을 제어한다.

DAC(Discretionary Access Control), 임의 접근 통제는 시스템 객체 접근을 사용자 혹은 그룹의 신분을 기준으로 제한하는 방법이다. 사용자의 판단하에 자신이 소유한 파일의 접근 권한을 다른 사용자에게 줄 수 있다. 이로 인해 발생하는 가장 큰 문제는 사용자의 권한을, 특히 root의 권한을 탈취당한다면 시스템을 완벽히 장악당할 수 있다는 문제가 발생한다. 

MAC(Mandatory Access Control), 강제 접근 통제는 미리 정해진 정책과 보안 등급에 따라 사용자와 객체의 허용 등급을 비교하여 접근을 통제하는 방법이다. 높은 보안 등급의 정보는 낮은 보안 등급의 사용자가 접근할 수 없으며, 아무리 소유자라고 하더라도 등급 정책에 어긋나면 접근할 수 없다.

</aside>

### AppArmor

<aside>
🛡️ AppArmor는 MAC 방식으로 접근을 제어하는 모듈로, 프로그램들이 실행되기 전에 호출되는 명령들을 검사하고 실행여부를 정할 수 있다. 더 자세한 예시로는 System Call을 제한하여 프로그램의 동작을 제한한다.

</aside>

```bash
# Check AppArmor Status
aa-status

# Check AppArmor Enabled
aa-enabled
```

# Using Linux

## Hostname

- 네트워크에서 시스템(컴퓨터)을 특정하기 위한 이름
- [건물]

```bash
# Check Hostname
sudo hostnamectl

# Change Hostname (/etc/hostname)
sudo hostnamectl set-hostname [new one]

# Change Hostname (/etc/hosts)
sudo vi /etc/hosts
# [old] -> [new]
```

## Domain name

- hostname의 오른쪽에 붙어 host들이 들어있는 네트워크를 지칭하는 이름
- [동네]

## USAGE

- 일반적으로 [hostname.domain.com](http://hostname.domain.com) 과 같은 식으로 사용되며 다른 도메인에 들어있는 특정 host에 접속하기 위해서 두 이름 모두 필요
- 같은 네트워크 도메인 상에서 다른 컴퓨터에 접속하기 위해서는 hostname 만으로 접속 가능
- [특정건물이름].[동네명].com

### 탄생배경

- 컴퓨터가 방 크기만하던 시절을 생각해보면 이해하기 쉬움. 지금과 같이 인당 하나씩 컴퓨터를 가지고 있는 것이 아니라, 매우 비싼 컴퓨터를 여러 사람들이 동시에 접속해서 사용하기 위해 다중 사용자 운영체제로 구현한 것이다.

```bash
# Add user
sudo adduser [new username]

# Delete user
sudo deluserq -r [username]
```

## Group

```bash
# print the groups a user is in
groups [username]

# make group
groupadd [groupname]

# Delete group
groupdel [groupname]

# add a user into groups
usermod -aG sudo,user42 gyoon
```

# Setting Server

## UFW

### Definition

<aside>
🚧 UFW(Uncomplicated Firewall)은 Debian 계열의 리눅스에서 방화벽 설정을 쉽게 관리 할 수 있게끔 하기 위해 있는 프로그램이다. 사용법이 까다로운 iptables보다 간단하게 설정할 수 있도록 한 패키지이다.

</aside>

### Solution

```bash
# Check Installed or not
apt search ufw
dpkg -l ufw

# Install
apt install ufw

# Check Status
ufw status

# Enable UFW
ufw enable

# Standard Imcoming deny
ufw default deny

# Allow only port 4242
ufw allow 4242

# Firewall status show in numbers
ufw status numbered

# Delete Rules
ufw delete [number]
```

## SSH

### Definition

![Untitled](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Untitled.png)

<aside>
⌨️ SSH(Secure Shell)은 다른 컴퓨터의 로그인하여 Shell을 사용할 수 있게 해주는 프로그램 혹은 프로토콜의 명칭이다. 기존의 원격 접속 방식이었던 Telnet은 암호화를 제공하지 않아 패킷을 분석하면 주고 받는 파일의 내용이나 비밀번호 등의 데이터를 탈취할 수 있었는데, SSH는 이를 암호화하여 안전하게 통신할 수 있도록 한다. 대칭키 방식이 클라이언트-서버 간 연결 암호화에 사용되고, 비대칭키 방식이 키 교환, 클라이언트 인증, 서버 인증에 사용된다. 또한 해시 알고리즘이 패킷의 무결성 확인을 위해 사용된다. 그 사용 예시와 SSH 프로토콜의 순서는 다음과 같다. 

1. 클라이언트가 서버의 TCP 포트(Default : 22)로 SSH 접속 요청을 보내면 서버는 자신이 지원하는 SSH 프로토콜의 버전을 응답으로 보내 준다. 그러면 클라이언트는 자신의 버전 중 일치하는 것이 있다면 연결을 지속한다.

2. 서버가 자신의 공개키를 클라이언트에 전송한다. 클라이언트는 서버들의 공개키를 ~/.ssh/known_hosts 파일에 저장한다.

3.1. 올바른 서버인지 확인
    1. 클라이언트에서 난수 생성 및 난수 해시값 생성, 저장
    2. 난수를 서버의 공개키로 암호화 후 서버로 전송
    3. 서버에서 서버의 개인키로 복호화해 난수를 추출
    4. 서버에서 복호화된 난수의 해시값을 생성 한 뒤 클라이언트에게 전송
    5. 클라이언트에 저장된 해시값과 서버로부터 전송 받은 해시값 비교
    6. 동일하면 올바른 서버 확인

3.2. 암호화된 통신을 위한 세션키(대칭키) 생성
전체 세션을 암호화하는데 사용되는 세션키는 대칭키로, 모든 통신을 암호화한다. 대칭키는 비대칭키 방식에 비해 빠르고 컴퓨팅 파워가 적게 드는 대신, 유출될 경우 공격자가 모든 통신 데이터를 복호화할 수 있기 때문에 키 교환 알고리즘을 통해 안전하게 대칭키를 공유한다. SSH에서는 디피-헬만(Diffie-Hellman) 알고리즘을 사용한다. 이는 상대방의 공개키와 나의 개인키를 통해 대칭키를 얻어낸다. 여기서 서버와 클라이언트 각각은 임시 비대칭키 키 쌍을 생성하고 공개키를 교환한다. 그러면 DH를 통해 서로는 세션키를 공유하게 되고, 모든 통신은 이 세션키로 암호화되며 이 대칭키는 개별 세션에 대해 생성된다. 따라서 과거의 세션키가 유출되어도, 현재 통신한 데이터의 내용은 알아낼 수 없다.

3.3. 서버 접근 가능한 클라이언트인지 확인
패스워드 인증과 SSH 키쌍 방식이 있다. 패스워드 방식은 세션키를 통해 암호화되어 보호된다. 권장되는 방식은 SSH 키 쌍을 이용하는 것이다. 이는 올바른 서버인지 확인하는 방식과 유사 하다.
    1. 클라이언트가 인증할 키 쌍의 ID를 서버에 전송
    2. 서버는 클라이언트가 접속하고자 하는 계정의 .ssh/authorized_key 파일 확인
    3. ID에 매칭된 공개키 있으면, 서버는 난수 생성 뒤 클라이언트 공개키로 암호화
    4. 서버는 클라이언트에게 암호화된 메세지 전송
    5. 클라이언트는 개인키로 복호화 해 난수 추출
    6. 클라이언트는 난수와 세션키를 결합해 해시값 계산해 서버로 전송
    7. 서버는 난수와 세션키 결합해 해시값 계산 후 비교
    8. 동일하면 클라이언트 인증 완료

</aside>

### Solution

```bash
# Check Installed or not
apt search openssh-server
dpkg -l openssh-server

# Install
apt install openssh-server

# Check Status and port
sudo systemctl status ssh

# Set port 4242 only
vi /etc/ssh/sshd_config -> Port 4242

# Set impossible to connect using SSH as root
vi /etc/ssh/sshd_config -> PermitRootLogin no

# Restart
sudo systemctl restart ssh
```

# Linux Settings

## Strong Password Policy

### Requirements

- 30일마다 만료
- 암호 설정 전 최소 허용 일수는 2일
- 비밀번호 만료 7일전 경고 메세지 수신
- 최소 10자
- 대소문자, 숫자 반드시 포함
- 같은 문자 3번 연속 포함 불가
- 유저 이름 포함 불가
- Root 계정 외 다른 계정들의 경우 새로운 비밀번호는 이전 비밀번호의 일부가 아닌 최소 7자를 포함해야 함
- Root 계정 역시도 정책을 만족해야 함.
- 정책 설정 후에는 Root 계정을 포함한 가상 머신 상에 있는 모든 계정들의 비밀번호를 바꾸어야 함.

### Solution

```bash
# Set Password Duration
sudo vi /etc/login.defs
# edit
# PASS_MAX_DAYS 30
# PASS_MIN_DAYS 2
# PASS_WARN_AGE 7

# Install libpam-pwquality
sudo apt install libpam-pwquality

# Set strong password policy
sudo vi /etc/pam.d/common-password
# edit
# password requisite pam_pwquality.so [options]
# [options]
# minlen=10 : Least 10 characters long
# ucredit=-1 : Least one Uppercase Letter
# lcredit=-1 : Least one Lowercase Letter
# dcredit=-1 : Least one number
# maxrepeat=3 : Must not contain more than 3 consecutive identical characters
# reject_username : Must not include the name of the user and the opposite
# difok=7 : Must have at least 7 characters that are not part of the former password (except root)
# enforce_for_root : Enforce root to comply with this policy

# Show account aging information
sudo chage -l [username]

# Enforce to change password (Expires passwords)
passwd -e [username]
```

## Strong Configuration for sudo groups

### Sudo

<aside>
🦸🏻‍♂️ SUDO, excute a comman as another user (Substitute User DO)

</aside>

### Requirements

- sudo를 사용할 때 인증은 잘못된 비밀번호를 입력했을 때 3번의 기회로 제한되어 있다.
- sudo를 사용할 때 잘못된 비밀번호를 입력하면 임의의 메세지를 화면에 표시해야 한다.
- sudo를 사용한 각 행동의 입력값과 출력값들은 모두 저장되어야 한다. 로그 파일들은 /var/log/sudo/ 폴더에 저장되어야 한다.
- TTY 모드는 보안상의 이유로 활성화되어야 한다.
- 보안상의 이유로 sudo로 사용될 수 있는 경로는 제한되어야 한다.
    - Example : /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

### Solution

```bash
# Execute visudo
# Visudo safely edit /etc/sudoers
sudo visudo

# Add these options to file
Defaults passwd_tries=3
Defaults authfail_message="Authentication failed"
Defaults badpass_message="Wrong Password"
Defaults log_input
Defaults log_output
Defaults iolog_dir="/var/log/sudo/"
Defaults requiretty
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

### SECURE_PATH

- sudo 명령어는 현재 계정의 shell이 아니라 가상의 shell을 생성한 뒤 그 안에서 실행한다. 이 때 가상 shell의 환경변수 PATH를 secure_path에 적힌 경로에서만 찾아 명령이 실행된다. 그러면 shell을 실행했을 때 입력받은 shell 명령어들은 PATH로 지정된 경로에서 바이너리 파일들을 찾아 명령을 수행한다.
- 만약 secure_path가 지정되어 있지 않다면, sudo 권한이 있는 사용자가 sudo를 이용하여 PATH 환경변수에 악성코드가 포함된 경로의 바이너리를 실행해 문제가 발생할 수 있다.

## Monitoring.sh

### Requirements

- Bash로 작성
- 서버를 켜면, 아래에 있는 정보들을 모든 터미널에 10분마다 화면에 표시해야 함. (wall 참고)
- 배너는 선택사항
- 어떤 에러도 보이면 안된다.
- 스크립트를 수정하지 않고 중단할 수 있어야 함. (cron 참고)

### Informations

- 운영체제의 구조(Architecture)와 커널 버전
- 물리 프로세서의 개수
- 가상 프로세서의 개수
- 서버에서 사용가능한 램과 그 이용 비율을 백불율로 표현
- 서버에서 사용가능한 메모리와 그 이용 비율을 백불율로 표현
- 프로세서들의 현재 이용 비율을 백불율로 표현
- 가장 최근 재시동된 날짜와 시간
- LVM 활성화 여부
- 활성화 된 연결의 개수
- 서버를 사용하고 있는 유저의 수
- 서버의 IPv4 주소와 서버의 MAC 주소
- sudo 프로그램으로 실행된 명령어의 개수

### Bash file

```bash
#!/bin/bash

os=$(uname -a)

pcpu=$(cat /proc/cpuinfo | sed '/physical id/!d' | uniq -c | wc -l)

vcpu=$(nproc --a)

ram_total=$(free -m | sed '/Mem/!d' | awk '{print $2}')
ram_used=$(free -m | sed '/Mem/!d' | awk '{print $3}')
ram_usage=$(printf "%.2f" $(echo "scale=4;$ram_used/$ram_total*100" | bc))
ram_info="${ram_used}/${ram_total}MB ($ram_usage%%)"

disk_total=$(df -BM | sed '/dev\/map/!d' | awk '{sum += $2} END {print sum}')
disk_used=$(df -BM | sed '/dev\/map/!d' | awk '{sum += $3} END {print sum}')
disk_usage=$(printf "%.2f" $(echo "scale=4;$disk_used/$disk_total*100" | bc))
disk_info="${disk_used}/${disk_total}MB ($disk_usage%%)"

cpu_unused=$(iostat -c | awk 'FNR==4 {print $6}')
cpu_used=$(printf "%.2f" $(echo "100-$cpu_unused" | bc))
cpu_info="${cpu_used}%%"

last_boot_date=$(who -b | awk '{print $3}')
last_boot_time=$(who -b | awk '{print $4}')
last_boot="$last_boot_date $last_boot_time"

lvm_mapper=$(cat /etc/fstab | sed '/\/dev\/mapper\//!d' | wc -l)
lvm_usage=$(if [ $lvm_mapper > 0 ]
			then
				echo "Yes"
			else
				echo "No"
			fi)

connections="$(netstat -ant | sed '/ESTABLISHED/!d' | wc -l) ESTABLISHED"

users=$(who | sed '/pts/!d' | wc -l)

ipv4=$(ifconfig | sed '/broadcast/!d' | awk '{print $2}')
mac=$(ifconfig | sed '/ether/!d' | awk '{print $2}')
network="IP $ipv4 ($mac)"

sudoes="$(echo "($(find /var/log/sudo -type f | wc -l)-1)/8" | bc) cmd"

printf "\t#ㅈArchitecture : $os\n"
printf "\t#CPU physical : $pcpu\n"
printf "\t#vCPU : $vcpu\n"
printf "\t#Memory Usage : $ram_info\n"
printf "\t#Disk Usage : $disk_info\n"
printf "\t#CPU load : $cpu_info\n"
printf "\t#Last boot : $last_boot\n"
printf "\t#LVM use : $lvm_usage\n"
printf "\t#Connections TCP : $connections\n"
printf "\t#User log : $users\n"
printf "\t#Network : $network\n"
printf "\t#Sudo : $sudoes\n"
```

### Cron

<aside>
❓

</aside>

### Notes

- 위에서 visudo를 통해  `Defaults requirestty` 옵션을 주었는데, cron은 tty 환경에서 실행되지 않기 때문에 `sudo` 명령어가 정상적으로 작동하지 않는다.

# Bonus Part

## Set up partitions

### Example

![Screen Shot 2022-12-24 at 6.32.08 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.32.08_PM.png)

- 참고 : [https://story-of-flower.tistory.com/m/451](https://story-of-flower.tistory.com/m/451)
- Boot Partition
    - 크기 boot (500M) + boot code (2048 * 512) ⇒ (524288000 + 1048576) = 525336576B
    1. Primary
    2. Beginning
    3. Mount point : /boot
- LVMGroup Partition
    - 크기 : 32554300416B
        - System Partition (6142 * 512) [3144704]
        - root (10G) [10737418240]
        - swap (2.3G) [2469606195.2] 512 -> 2469606400 2048 -> 2469607424
        - home (5G) [5368709120]
        - var (3G) [3221225472]
        - srv(3G) [3221225472]
        - tmp (3G) [3221225472]
        - var-log (4G) [4294967296]
        - crypt size (2048 * 512 * 16) [16777216]
    1. Logical
    2. Beginning
    
    ![Screen Shot 2022-12-24 at 5.31.42 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_5.31.42_PM.png)
    
- Configure encrypted volumes
    - 수정한 파티션을 먼저 디스크에 적고 난 뒤 암호화 볼륨을 만들 수 있음.
    - Create encrypted volumes
    
    ![Screen Shot 2022-12-24 at 5.37.12 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_5.37.12_PM.png)
    
    ![Screen Shot 2022-12-24 at 5.38.15 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_5.38.15_PM.png)
    
    ![Screen Shot 2022-12-24 at 5.42.37 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_5.42.37_PM.png)
    
    ![Screen Shot 2022-12-24 at 6.15.21 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.15.21_PM.png)
    
    Passphrase : Leave my door open
    
    /goinfre : born2beroot
    
- Configure the Logical Volume Manager
    - LVMGroup 이라는 volume group을 먼저 만든다.
    
    ![Screen Shot 2022-12-24 at 6.19.12 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.19.12_PM.png)
    
    - Create logical volume
        - root (10G) [10737418240]
        - swap (2.3G) [2469606195.2] 512 -> 2469606400 2048 -> 2469607424
        - home (5G) [5368709120]
        - var (3G) [3221225472]
        - srv(3G) [3221225472]
        - tmp (3G) [3221225472]
        - var—log (4G) [4294967296]
        - crypt size (2048 * 512 * 16) [16777216]
        
        ![Screen Shot 2022-12-24 at 6.27.07 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.27.07_PM.png)
        
- Mount point setting
    
    ![Screen Shot 2022-12-24 at 6.29.28 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.29.28_PM.png)
    
    Use as : Ext4 journaling file system → Mount point 설정
    
    ![Screen Shot 2022-12-24 at 6.33.48 PM.png](README%20md%202ed0a84498664e7ea842cc3958ad40ac/Screen_Shot_2022-12-24_at_6.33.48_PM.png)
    

## Set functional WordPress

## Set up a optional service

```bash
sudo apt install gpm
```