# 🚀 每日自动生成 + Git 推送配置说明

## 📋 完整流程

```
每天早上 7:00
    ↓
┌─────────────────────────────────────┐
│  Cron Job 触发                      │
│  ID: 57eef27e-9ed2-4ee8-9096-cff710f249ba │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  步骤 1: 抓取新闻                   │
│  - IRONMAN                          │
│  - UTMB                             │
│  - HYROX                            │
│  - Tennis ✅                        │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  步骤 2: 筛选 + 翻译                │
│  - 过滤 24 小时内内容                │
│  - 全部翻译为中文                   │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  步骤 3: 生成评论                   │
│  - Michael 独家点评                 │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  步骤 4: 生成 HTML                  │
│  - sports-digest-YYYY-MM-DD.html   │
│  - index.html (最新版本)           │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  步骤 5: Git 自动推送 ⭐            │
│  - git add .                        │
│  - git commit -m "daily update"     │
│  - git pull --rebase                │
│  - git push                         │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  ✅ 推送到 GitHub                   │
│  https://github.com/.../my-sports-site │
└──────────────┬──────────────────────┘
               ↓
┌─────────────────────────────────────┐
│  Windows 本地 git pull 获取更新     │
└─────────────────────────────────────┘
```

---

## ⚙️ 配置文件

### 1. 主脚本：`run-digest.sh`

**位置:** `/home/admin/openclaw/workspace/run-digest.sh`

**功能:**
- 抓取 4 个项目的 RSS 新闻
- 筛选 + 翻译
- 生成评论
- 生成 HTML 文件
- **自动执行 Git 推送（步骤 5）**

**关键代码（步骤 5）:**
```bash
# 进入网站目录
cd "$WORKSPACE/my-sports-site"

# 检查 Git 仓库
if [ -d ".git" ]; then
    git add -A
    git commit -m "📰 daily update $DATE $(date +%H:%M:%S)"
    git pull --rebase
    git push
fi
```

---

### 2. Cron Job 配置

**Job ID:** `57eef27e-9ed2-4ee8-9096-cff710f249ba`

**名称:** 每日体育新闻生成 (带日期归档)

**执行时间:** 每天早上 7:00 (Asia/Shanghai)

**Cron 表达式:** `0 7 * * *`

**Payload:**
```
执行每日体育新闻生成脚本：bash /home/admin/openclaw/workspace/run-digest.sh

要求：
1. 运行 run-digest.sh 脚本（已集成 Git 自动推送）
2. 生成 IRONMAN/UTMB/HYROX/TENNIS 四个项目的 RSS 新闻
3. 严格过滤 24 小时内内容
4. 全部翻译为中文
5. 生成带日期的归档文件
6. 同时更新 index.html
7. 自动执行 Git 推送（步骤 5）
8. 完成后汇报生成结果和推送状态

死命令：
- 网球板块必须启用，不得禁用！
- Git 推送必须执行，不得跳过！
```

---

### 3. 备用推送脚本：`auto-push.sh`

**位置:** `/home/admin/openclaw/workspace/auto-push.sh`

**用途:** 手动测试或独立推送

**执行方式:**
```bash
bash /home/admin/openclaw/workspace/auto-push.sh
```

---

## 🧪 测试命令

### 完整测试（生成 + 推送）

```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

### 仅测试推送

```bash
cd /home/admin/openclaw/workspace/my-sports-site
git add .
git commit -m "🧪 测试推送"
git pull --rebase
git push
```

### 查看 Cron Job 状态

```bash
openclaw cron list
```

### 手动触发 Cron Job

```bash
openclaw cron run --id 57eef27e-9ed2-4ee8-9096-cff710f249ba
```

---

## 📊 每日输出

### 生成的文件

1. **归档文件:** `sports-digest-YYYY-MM-DD.html`
   - 永久保存的历史版本
   - 文件名包含日期

2. **最新文件:** `index.html`
   - 始终指向最新版本
   - 每天自动替换

### Git 提交记录

每次推送会创建提交：
```
📰 daily update 2026-03-27 07:00:15
```

### GitHub 仓库

**地址:** https://github.com/Michael-Wang811008/my-sports-site

**查看提交历史:**
```bash
git log --oneline -10
```

---

## 💡 Windows 本地使用

### 首次克隆

```powershell
cd "D:\Github DESK"
git clone https://github.com/Michael-Wang811008/my-sports-site.git
```

### 每日拉取

**手动方式:**
```powershell
cd "D:\Github DESK\my-sports-site"
git pull
```

**自动方式（任务计划程序）:**

创建 `auto-pull.ps1`:
```powershell
cd "D:\Github DESK\my-sports-site"
git pull
```

设置每天 7:30 执行。

---

## 🔍 故障排查

### 问题 1: Git 推送失败

**症状:** `error: failed to push some refs`

**解决:**
```bash
cd /home/admin/openclaw/workspace/my-sports-site
git status
git pull --rebase
git push
```

### 问题 2: 认证失败

**症状:** `could not read Username` 或 `authentication failed`

**解决:**
```bash
# 检查凭据文件
cat ~/.git-credentials

# 如果为空或错误，重新配置
git config --global credential.helper store
git pull
# 输入用户名和 token
```

### 问题 3: 合并冲突

**症状:** `CONFLICT (content): Merge conflict`

**解决:**
```bash
cd /home/admin/openclaw/workspace/my-sports-site
git status  # 查看冲突文件
# 编辑文件解决冲突
git add <resolved-file>
git commit -m "解决合并冲突"
git push
```

### 问题 4: 网络超时

**症状:** `Connection timed out` 或 `Connection closed`

**解决:**
- 检查网络连接
- 稍后重试
- 使用代理（如果需要）

---

## 📅 下次执行时间

**自动生成 + 推送:** 明天早上 7:00 (Asia/Shanghai)

**预计完成:** 7:05 左右（取决于新闻数量）

---

## ✅ 检查清单

每日检查（可选）:

- [ ] 早上 7:00 后检查是否生成新文件
- [ ] 检查 GitHub 仓库是否有新提交
- [ ] Windows 本地 `git pull` 验证同步
- [ ] 打开 `index.html` 确认内容正常

---

## 📞 需要帮助？

运行诊断命令：

```bash
# 检查 Cron Job
openclaw cron list

# 检查 Git 状态
cd /home/admin/openclaw/workspace/my-sports-site
git status
git log --oneline -5

# 测试推送
bash /home/admin/openclaw/workspace/auto-push.sh

# 完整测试
bash /home/admin/openclaw/workspace/run-digest.sh
```

---

**最后更新:** 2026-03-27 09:05  
**维护:** Michael · 幽默轻松版
