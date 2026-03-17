# 🚀 部署指南

## ✅ 已完成

- [x] 抓取 80 条体育新闻（IRONMAN、UTMB、HYROX、Tennis）
- [x] 生成精美的 HTML 页面（网球比分牌配色）
- [x] 初始化本地 Git 仓库
- [x] 创建 README 文档

## 📁 文件位置

```
/home/admin/openclaw/workspace/my-sports-site/
├── index.html      # 2026-03-17 体育新闻摘要（27KB）
├── README.md       # 项目说明
└── DEPLOY.md       # 本文件
```

## 🔧 推送到 GitHub（手动操作）

由于网络连接问题，自动推送失败。请按以下步骤手动操作：

### 方法 1：使用 GitHub Desktop（推荐）

1. 下载并安装 [GitHub Desktop](https://desktop.github.com/)
2. 登录你的 GitHub 账号
3. 选择 `Add Local Repository` → 选择 `/home/admin/openclaw/workspace/my-sports-site`
4. 点击 `Publish repository`
5. 仓库名：`my-sports-site`
6. 勾选 `Keep it private`（如果需要）
7. 点击 `Publish`

### 方法 2：使用命令行

```bash
cd /home/admin/openclaw/workspace/my-sports-site

# 如果仓库已存在，先删除远程
git remote remove origin 2>/dev/null

# 添加远程仓库
git remote add origin https://github.com/Michael-Wang811008/my-sports-site.git

# 推送（可能需要输入 GitHub 用户名和密码）
git push -u origin main
```

如果提示认证失败，请使用 [Personal Access Token](https://github.com/settings/tokens) 代替密码。

### 方法 3：直接上传文件

1. 访问 https://github.com/Michael-Wang811008/my-sports-site
2. 点击 `uploading an existing file`
3. 拖入 `index.html` 和 `README.md`
4. 点击 `Commit changes`

## 🌐 启用 GitHub Pages

推送成功后：

1. 进入仓库 → Settings → Pages
2. **Source**: 选择 `Deploy from a branch`
3. **Branch**: 选择 `main` / `root`
4. 点击 Save
5. 等待 1-2 分钟
6. 访问 `https://Michael-Wang811008.github.io/my-sports-site/`

## 🖥️ 本地预览

在浏览器中直接打开：
```
file:///home/admin/openclaw/workspace/my-sports-site/index.html
```

或使用本地服务器：
```bash
cd /home/admin/openclaw/workspace/my-sports-site
python3 -m http.server 8080
# 访问 http://localhost:8080
```

## 📊 今日内容摘要

- **IRONMAN**: 30 条新闻
  - 重点：铁三运动员受伤风险训练习惯、2026 社区调查、热训练益处
- **UTMB**: 17 条新闻
  - 来源：iRunFar、Trail Runner Magazine
- **HYROX**: 14 条新闻
  - 来源：HYROX 官方
- **Tennis**: 19 条新闻
  - 来源：WTA、Tennis.com

**总计**: 80 条内容，已筛选并格式化输出

---

**生成时间**: 2026-03-17 07:06 GMT+8
**生成工具**: Sports Daily Digest Skill
