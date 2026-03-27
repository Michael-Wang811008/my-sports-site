# 每日体育精选 - 使用说明

## 📦 已安装技能

### 1. sports-daily-digest - 体育每日新闻生成

**位置**: `/home/admin/.openclaw/skills/sports-daily-digest/`

**功能**:
- 从四大项目 RSS 源抓取新闻（IRONMAN、UTMB、HYROX、Tennis）
- 严格过滤 24 小时内新闻
- 按优先级筛选（P0 赛事结果 > P1 赛场故事 > P2 训练装备 > P3 其他）
- 使用 MyMemory API 翻译为中文
- 生成 HTML 页面（网球比分牌配色 #006633 / #663399）

**手动运行**:
```bash
cd /home/admin/.openclaw/skills/sports-daily-digest

# 1. 抓取新闻
python3 scripts/fetch_news.py --date 2026-03-17

# 2. 筛选 + 翻译
python3 scripts/select_news.py --input raw_news.json --output selected_news.json

# 3. 生成 HTML
python3 scripts/write_digest.py --input selected_news.json --output /home/admin/openclaw/workspace/my-sports-site/index.html
```

### 2. michael-commentator - Michael 的评论员助手

**位置**: `/home/admin/.openclaw/skills/michael-commentator/`

**功能**:
- 基于四大项目知识库生成评论
- 诙谐幽默风格，有梗有料
- 包含历史、数据、传奇人物引用
- 自嘲式结尾，增加亲和力

**手动运行**:
```bash
cd /home/admin/.openclaw/skills/michael-commentator

python3 scripts/generate_comment.py \
  --input ../sports-daily-digest/selected_news.json \
  --output comments.json
```

## 🚀 一键运行

**推荐方式**: 使用启动脚本

```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

**输出**:
- `/home/admin/openclaw/workspace/my-sports-site/index.html` - 新闻页面
- `/home/admin/openclaw/workspace/my-sports-site/comments.html` - 评论页面

**本地预览**:
```bash
cd /home/admin/openclaw/workspace/my-sports-site
python3 -m http.server 8888
```

然后访问：http://localhost:8888/

## ⏰ 自动化

**Cron 任务已设置**:
- **时间**: 每天早上 7:00（Asia/Shanghai）
- **任务 ID**: `57eef27e-9ed2-4ee8-9096-cff710f249ba`
- **触发**: 系统事件提醒

**查看 cron 状态**:
```bash
openclaw cron list
```

**手动触发**:
```bash
openclaw cron run --id 57eef27e-9ed2-4ee8-9096-cff710f249ba
```

## 📊 数据源

| 项目 | RSS 源 | 说明 |
|------|-------|------|
| **IRONMAN** | Triathlete.com | 铁人三项新闻 |
| **UTMB** | iRunFar.com | 越野跑新闻 |
| **HYROX** | HYROX Official | 健身竞速新闻 |
| **Tennis** | WTA + Tennis.com | 网球新闻 |

## 🎨 页面特点

- **无图片**: 纯文本展示
- **全中文**: MyMemory API 翻译
- **24 小时限制**: 严格过滤过时新闻
- **每项目 1 条**: 优先级筛选
- **核心看点**: 新闻概述
- **Michael 评论**: 诙谐幽默风格

## 📝 待完善

- [ ] 优化 HYROX 数据源（目前多为导航链接）
- [ ] 优化网球数据源（目前多为导航链接）
- [ ] 将评论直接集成到主 HTML 页面
- [ ] 增加更多评论模板
- [ ] 更新知识库中的动态数据（排名、纪录等）

## 🛠️ 故障排除

### 翻译失败
- 检查网络连接
- MyMemory API 有调用限制，如失败会返回原文

### RSS 抓取失败
- 检查 RSS 源是否可用
- 检查网络连接

### HTML 生成失败
- 检查 selected_news.json 格式
- 检查 Python 依赖：`pip3 install feedparser beautifulsoup4 requests`

## 📞 支持

- 技能文档：`/home/admin/.openclaw/skills/*/SKILL.md`
- 知识库：`/home/admin/.openclaw/skills/michael-commentator/knowledge/`
- 脚本：`/home/admin/.openclaw/skills/*/scripts/`

---

**最后更新**: 2026-03-17
**版本**: v1.0
