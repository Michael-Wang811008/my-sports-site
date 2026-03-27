# ✅ 自动同步配置完成！

## 🎉 已完成的配置

### 1️⃣ 同步脚本已创建

- **`sync-to-windows.sh`** - WSL 直接同步方案
- **`auto-push.sh`** - Git 自动推送方案
- **`run-digest.sh`** - 已更新，集成自动同步逻辑

### 2️⃣ 每日生成任务

- **Cron Job:** `57eef27e-9ed2-4ee8-9096-cff710f249ba`
- **执行时间:** 每天 7:00 (Asia/Shanghai)
- **自动同步:** ✅ 已启用

---

## 🚀 下一步：选择你的同步方案

### 方案 A: WSL 直接同步（最简单）

**如果你能看到 `/mnt/d` 目录：**

```bash
# 1. 测试挂载
ls /mnt/d

# 2. 测试同步
bash /home/admin/openclaw/workspace/sync-to-windows.sh "/mnt/d/Github DESK/my-sports-site"
```

**如果成功** → 🎉 每天自动生成后会自动同步！

**如果失败** → 使用方案 B

---

### 方案 B: Git 自动推送（最可靠）⭐推荐

**步骤 1: 配置 Git 远程仓库**

```bash
cd /home/admin/openclaw/workspace/my-sports-site

# 查看当前远程仓库
git remote -v

# 如果没有，添加你的 GitHub/Gitee 仓库
git remote add origin <你的仓库地址>
```

**步骤 2: 测试推送**

```bash
bash /home/admin/openclaw/workspace/auto-push.sh
```

**步骤 3: 在 Windows 本地拉取**

```powershell
cd "D:\Github DESK\my-sports-site"
git pull
```

**每天自动执行流程：**

```
Linux (7:00 AM) → 生成新文件 → git commit → git push
                                      ↓
Windows (任意时间) → git pull ← 获取最新文件
```

---

## 📊 文件结构

```
D:\Github DESK\my-sports-site\
├── index.html              (每天自动替换，指向最新版本)
├── sports-digest-2026-03-27.html  (历史归档)
├── sports-digest-2026-03-26.html  (历史归档)
├── sports-digest-2026-03-25.html  (历史归档)
└── ... (每天自动增加新文件)
```

---

## 🧪 立即测试

### 选项 1: 手动运行一次完整流程

```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

### 选项 2: 只测试同步

```bash
# 方案 A
bash /home/admin/openclaw/workspace/sync-to-windows.sh "/mnt/d/Github DESK/my-sports-site"

# 方案 B
bash /home/admin/openclaw/workspace/auto-push.sh
```

### 选项 3: 等待明天 7:00 自动执行

无需操作，系统会自动生成并同步！

---

## 📱 在 Windows 本地查看

同步成功后，在 Windows 中：

```powershell
# 打开文件夹
explorer "D:\Github DESK\my-sports-site"

# 或在浏览器中打开
start "D:\Github DESK\my-sports-site\index.html"
```

---

## ⚙️ 高级配置（可选）

### Windows 自动拉取（任务计划程序）

创建一个 PowerShell 脚本 `D:\Github DESK\my-sports-site\auto-pull.ps1`：

```powershell
cd "D:\Github DESK\my-sports-site"
git pull
```

然后在任务计划程序中设置每天 7:30 执行。

### 查看 Cron Job 状态

```bash
openclaw cron list
```

### 修改生成时间

如果需要修改每天生成的时间，告诉我即可！

---

## 💡 小贴士

1. **第一次建议手动测试**，确保同步成功后再依赖自动执行
2. **Git 方案更可靠**，推荐作为首选
3. **历史文件不会删除**，所有归档文件都会保留
4. **index.html 每天替换**，始终指向最新版本

---

## ❓ 需要帮助？

运行诊断命令：

```bash
# 检查 WSL 挂载
df -h | grep mnt

# 检查 Git 状态
cd /home/admin/openclaw/workspace/my-sports-site && git status

# 查看 Cron Job
openclaw cron list
```

---

**配置完成时间:** 2026-03-27 08:45
**配置者:** Michael · 幽默轻松版

🎊 现在你的体育新闻网站会自动同步到 Windows 本地啦！
