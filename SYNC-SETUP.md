# 📦 体育新闻网站自动同步配置指南

## 🎯 目标
每天生成的 `index.html` 和归档文件自动保存到 `D:\Github DESK\my-sports-site`

---

## 📋 方案对比

| 方案 | 优点 | 缺点 | 推荐度 |
|------|------|------|--------|
| **方案 A: WSL 直接同步** | 全自动，无需手动操作 | 需要 WSL 挂载 Windows 磁盘 | ⭐⭐⭐⭐ |
| **方案 B: Git 自动推送** | 最可靠，有版本历史 | 需要在 Windows 本地 git pull | ⭐⭐⭐⭐⭐ |
| **方案 C: 云存储同步** | 跨平台，自动同步 | 需要配置云存储 | ⭐⭐⭐ |

---

## 🔧 方案 A: WSL 直接同步（推荐）

### 步骤 1: 在 WSL 中挂载 Windows D 盘

```bash
# 创建挂载点
sudo mkdir -p /mnt/d

# 挂载 D 盘
sudo mount -t drvfs D: /mnt/d
```

### 步骤 2: 验证挂载

```bash
ls /mnt/d
# 应该能看到 D 盘的内容
```

### 步骤 3: 测试同步脚本

```bash
bash /home/admin/openclaw/workspace/sync-to-windows.sh "/mnt/d/Github DESK/my-sports-site"
```

### 自动化配置

脚本已集成到 `run-digest.sh`，每天生成后自动执行。

---

## 🔧 方案 B: Git 自动推送（最可靠）

### 步骤 1: 初始化 Git 仓库

```bash
cd /home/admin/openclaw/workspace/my-sports-site
git init
git add .
git commit -m "initial commit"
```

### 步骤 2: 创建远程仓库（GitHub/Gitee）

在 GitHub 或 Gitee 创建新仓库，然后：

```bash
git remote add origin <你的仓库地址>
git push -u origin main
```

### 步骤 3: 在 Windows 本地克隆仓库

```powershell
cd "D:\Github DESK"
git clone <你的仓库地址> my-sports-site
```

### 自动化配置

脚本已集成到 `run-digest.sh`，如果方案 A 失败会自动尝试方案 B。

### 每日更新流程

**Linux 侧（自动）：**
```bash
# 每天 7:00 自动执行
bash /home/admin/openclaw/workspace/run-digest.sh
# → 生成新文件
# → 自动 git commit + push
```

**Windows 侧（手动或自动）：**
```powershell
# 手动拉取
cd "D:\Github DESK\my-sports-site"
git pull

# 或设置自动拉取（任务计划程序）
```

---

## 🔧 方案 C: 云存储同步

### OneDrive 配置

1. 在 Windows 本地创建目录：`D:\Github DESK\my-sports-site`
2. 将此目录添加到 OneDrive 同步
3. 在 WSL 中挂载 OneDrive 目录（复杂，不推荐）

### 更简单的方式

直接使用方案 B（Git），更可靠且版本可控。

---

## 📝 当前配置

### 每日生成任务

- **Cron Job ID:** `57eef27e-9ed2-4ee8-9096-cff710f249ba`
- **执行时间:** 每天 7:00 (Asia/Shanghai)
- **脚本:** `/home/admin/openclaw/workspace/run-digest.sh`

### 同步流程

```
1. 生成 sports-digest-YYYY-MM-DD.html
2. 更新 index.html（指向最新版本）
3. 尝试方案 A（WSL 同步）
4. 如果失败，尝试方案 B（Git 推送）
5. 汇报结果
```

---

## 🧪 测试命令

### 手动测试同步

```bash
# 测试方案 A
bash /home/admin/openclaw/workspace/sync-to-windows.sh "/mnt/d/Github DESK/my-sports-site"

# 测试方案 B
bash /home/admin/openclaw/workspace/auto-push.sh
```

### 查看 Cron Job 状态

```bash
openclaw cron list
```

### 手动触发每日生成

```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

---

## ⚠️ 常见问题

### Q1: WSL 挂载失败

**错误:** `mount: /mnt/d: mount point does not exist`

**解决:**
```bash
sudo mkdir -p /mnt/d
sudo mount -t drvfs D: /mnt/d
```

### Q2: Git 推送失败

**错误:** `permission denied` 或 `authentication failed`

**解决:**
```bash
# 配置 Git 凭据
git config --global credential.helper store
git push
# 输入用户名和密码
```

### Q3: 路径中有空格

**错误:** `No such file or directory`

**解决:** 确保路径用引号包裹：
```bash
bash sync-to-windows.sh "/mnt/d/Github DESK/my-sports-site"
```

---

## 📞 需要帮助？

运行以下命令诊断问题：

```bash
# 检查 WSL 挂载
df -h | grep mnt

# 检查 Git 状态
cd /home/admin/openclaw/workspace/my-sports-site
git status

# 测试同步脚本
bash /home/admin/openclaw/workspace/sync-to-windows.sh
```

---

**最后更新:** 2026-03-27
**维护:** Michael · 幽默轻松版
