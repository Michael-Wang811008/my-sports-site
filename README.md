# 每日体育精选 - 归档目录

## 📁 文件命名规则

### 归档文件
- **格式**: `sports-digest-YYYY-MM-DD.html`
- **示例**: `sports-digest-2026-03-19.html`
- **说明**: 每天生成的独立归档文件，永久保存

### 最新文件
- **文件名**: `index.html`
- **说明**: 始终指向最新版本的每日体育精选
- **访问**: http://localhost:8888/

## 📂 文件列表

| 文件名 | 类型 | 说明 |
|--------|------|------|
| `index.html` | 最新 | 当前最新版本 |
| `sports-digest-2026-03-19.html` | 归档 | 2026 年 3 月 19 日版本 |
| `sports-digest-2026-03-17.html` | 归档 | 2026 年 3 月 17 日版本 |
| `comments.html` | 测试 | 评论页面测试文件 |

## 🔧 生成脚本

**脚本位置**: `/home/admin/openclaw/workspace/run-digest.sh`

**运行方式**:
```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

**输出**:
1. 归档文件：`sports-digest-YYYY-MM-DD.html`
2. 最新文件：`index.html`（复制自归档文件）

## 📅 自动化

**Cron 任务**: 每天早上 7:00 自动运行

```bash
openclaw cron list  # 查看任务
```

## 🗂️ 归档管理

### 查看历史文件
```bash
ls -lht /home/admin/openclaw/workspace/my-sports-site/*.html
```

### 查看特定日期
```bash
# 查看 2026 年 3 月的所有文件
ls /home/admin/openclaw/workspace/my-sports-site/sports-digest-2026-03-*.html
```

### 清理旧文件（可选）
```bash
# 删除 30 天前的归档文件
find /home/admin/openclaw/workspace/my-sports-site/ -name "sports-digest-*.html" -mtime +30 -delete
```

## 📊 内容说明

每日体育精选包含以下板块：
- 🏊 **IRONMAN 铁人三项** - 国际铁人三项赛事新闻
- 🏔️ **UTMB 越野跑** - 越野跑赛事新闻
- 💪 **HYROX 健身竞速** - 健身竞速赛事新闻
- 🎾 **网球** - 暂时禁用（RSS 源不可用）

## 🎨 技术特点

- **配色**: 网球比分牌 (#006633 / #663399)
- **主题**: 支持明暗主题切换
- **翻译**: googletrans 4.0.0-rc1 (Google Translate)
- **评论**: 跨界者 Michael 独家点评

---

**最后更新**: 2026-03-19
