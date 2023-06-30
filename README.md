# fileSha256sum

fileSha256sum 檔案檢核工具

使用前先注意下列環境已經準備完畢

* /bin/bash
* python3

已經在下列系統完成測試

* Debian 11/12

* 建議專案環境目錄

```bash
/usr/local/bin/fileSha256sum
```

## 初始化專案

```bash
cd [請輸入你的專案絕對路徑]/fileSha256sum
./install.sh
```

## 功能介紹

### 比對檔案

#### 檔案配置

* config/fileList.txt

輸入要檢核的路徑，記得最後多劉一行空行

```
/opt/tomcat/conf
/etc/nginx/conf

```

#### 執行方式

```bash
./compareTwoFiles.sh
```

### 將比對結果用信件寄出

#### 檔案配置

* config/mail.properies

```bash
mailAccount=exmail@exmail.com
mailPassword=emailPwD
mailFrom=from@exmail.com
mailTo=example@exmail.com
orgName=單位名稱
systemName=系統名稱
hostName=主機名稱
```

#### 執行方式

```bash
./send-mail.sh
```

## 排程設置

* crontab

```
10 6 * * * /bin/bash [請輸入你的專案絕對路徑]/fileSha256sum/start.sh
```
