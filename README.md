# fileSha256sum

fileSha256sum

## 初始化專案

```bash
cd [請輸入你的專案絕對路徑]/fileSha256sum
./install.sh
```

## 專案環境目錄

```
/usr/local/bin/fileSha256sum
```

## 排程設置

* crontab

```
10 6 * * * /bin/bash [請輸入你的專案絕對路徑]/fileSha256sum/start.sh
```

## 比對檔案方式

```bash
./compareTwoFiles.sh
```
