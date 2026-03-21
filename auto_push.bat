@echo off
:: 1. 进入你的文件夹
cd /d "D:\Github DESK\my-sports-site"

:: 2. 记下变动（因为你已经手动把新文件放进来了）
git add .

:: 3. 提交变动
git commit -m "手动更新体育摘要 %date%"

:: 4. 推送至 GitHub
git push origin main

:: 5. 任务完成，自动关闭窗口
exit