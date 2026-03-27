# ⏱️ 时间标签版式统一优化

## 🐛 问题描述

**问题:** 每条新闻标题后面显示的"X 小时前"时间标签版式不统一。

**表现:**
- 某些情况下时间标签会换行
- 与其他元素的间距不一致
- 视觉上不够整齐

---

## ✅ 优化方案

### 1️⃣ CSS 样式优化

**优化前:**
```css
.time-badge {
    background: var(--badge-bg); color: var(--badge-text);
    padding: 3px 10px; border-radius: 10px; font-size: 11px; font-weight: 600;
}
```

**优化后:**
```css
.time-badge {
    background: var(--badge-bg); color: var(--badge-text);
    padding: 4px 12px; border-radius: 12px; font-size: 11px; font-weight: 600;
    white-space: nowrap;      /* ✅ 不换行 */
    flex-shrink: 0;           /* ✅ 不被压缩 */
    display: inline-block;    /* ✅ 独立块级元素 */
}
```

---

## 🔍 关键改进

### 1. `white-space: nowrap`

**作用:** 防止时间标签换行

**效果:**
- ❌ 优化前：`12\n小时前`（可能换行）
- ✅ 优化后：`12 小时前`（始终在一行）

---

### 2. `flex-shrink: 0`

**作用:** 防止时间标签被压缩

**场景:** 当新闻标题很长时，时间标签不会被挤压变形

**效果:**
- ❌ 优化前：可能被压缩成 `12 小...`
- ✅ 优化后：始终完整显示 `12 小时前`

---

### 3. `display: inline-block`

**作用:** 确保时间标签作为独立的块级元素

**效果:**
- 宽度和高度由内容决定
- 可以设置 padding 和 margin
- 与其他元素对齐更一致

---

### 4. 增加 padding

**优化前:** `padding: 3px 10px`

**优化后:** `padding: 4px 12px`

**原因:**
- 稍微增加内边距，视觉上更舒适
- 与圆角 `border-radius: 12px` 更匹配

---

### 5. 增加 border-radius

**优化前:** `border-radius: 10px`

**优化后:** `border-radius: 12px`

**原因:**
- 稍大的圆角更现代
- 与 padding 增加相匹配

---

## 📝 修改的文件

### 1. `index.html`（当前最新版本）

**位置:** `/home/admin/openclaw/workspace/my-sports-site/index.html`

**修改:** 已更新 `.time-badge` CSS 样式

### 2. `write_digest.py`（生成脚本）

**位置:** `/home/admin/.openclaw/skills/sports-daily-digest/scripts/write_digest.py`

**修改:** 已更新 CSS 模板，确保每天自动生成的文件包含优化

---

## 🎨 视觉效果对比

### 优化前

```
┌────────────────────────────────────────┐
│ Marta Sánchez的 2026 70.3 Oceanside    │
│ 定制彩绘 Quintana Roo vPRi 9 小时前   │ ← 可能换行
└────────────────────────────────────────┘
```

### 优化后

```
┌──────────────────────────────────────────┐
│ Marta Sánchez的 2026 70.3 Oceanside 定制  │
│ 彩绘 Quintana Roo vPRi        [9 小时前] │ ← 始终在右侧
└──────────────────────────────────────────┘
```

---

## 🔧 父容器布局

时间标签的父容器 `.news-title` 使用 flexbox 布局：

```css
.news-title {
    font-size: 16px; font-weight: 700; margin-bottom: 10px;
    display: flex; justify-content: space-between; align-items: flex-start; gap: 12px;
}
```

**关键属性:**
- `display: flex` - 弹性布局
- `justify-content: space-between` - 两端对齐
- `align-items: flex-start` - 顶部对齐
- `gap: 12px` - 固定间距

配合时间标签的 `flex-shrink: 0`，确保：
1. 标题在左侧，自动换行
2. 时间标签在右侧，固定大小
3. 两者之间有固定间距

---

## 📊 测试场景

### 场景 1: 短标题

```
┌──────────────────────────────────────┐
│ 简短标题                  [3 小时前] │
└──────────────────────────────────────┘
```

### 场景 2: 长标题

```
┌──────────────────────────────────────┐
│ 非常长的新闻标题可能有多行，此     │
│ 时时间标签依然在右上角    [5 小时前] │
└──────────────────────────────────────┘
```

### 场景 3: 超长数字

```
┌──────────────────────────────────────┐
│ 另一条新闻                  [23 小时前] │
└──────────────────────────────────────┘
```

所有场景下，时间标签都保持：
- ✅ 不换行
- ✅ 不被压缩
- ✅ 位置一致

---

## 🔄 影响范围

### 已优化的文件

- ✅ `index.html` - 立即生效
- ✅ 未来每天生成的文件 - 自动包含优化

### 历史文件（可选更新）

如需更新历史归档文件，可以重新运行生成脚本：

```bash
bash /home/admin/openclaw/workspace/run-digest.sh
```

---

## 🎨 配色方案

时间标签的颜色使用 CSS 变量：

```css
:root {
    --badge-bg: #e8f5ec;      /* 浅绿色背景 */
    --badge-text: #006633;    /* 深绿色文字 */
}

[data-theme="dark"] {
    --badge-bg: #1a3a1a;      /* 深绿色背景（黑暗模式） */
    --badge-text: #90ee90;    /* 浅绿色文字（黑暗模式） */
}
```

**效果:**
- 浅色模式：浅绿背景 + 深绿文字
- 黑暗模式：深绿背景 + 浅绿文字

---

## 📅 后续维护

### 每天自动生成

- Cron Job 每天 7:00 运行
- 调用 `write_digest.py` 生成 HTML
- 自动包含时间标签优化

### 检查清单

每周检查（可选）:
- [ ] 时间标签是否始终在一行
- [ ] 时间标签是否被压缩
- [ ] 时间标签位置是否一致

---

## 🔍 技术细节

### Flexbox 布局原理

```css
.news-title {
    display: flex;              /* 弹性布局 */
    justify-content: space-between;  /* 两端对齐 */
    align-items: flex-start;    /* 顶部对齐 */
    gap: 12px;                  /* 间距 */
}

.time-badge {
    flex-shrink: 0;             /* 不收缩 */
    white-space: nowrap;        /* 不换行 */
}
```

**工作流程:**
1. 父容器使用 `display: flex`
2. `justify-content: space-between` 将子元素推到两端
3. 标题（左侧）可以自动换行
4. 时间标签（右侧）由于 `flex-shrink: 0` 保持固定大小
5. `white-space: nowrap` 确保时间标签不换行

---

## 🎊 优化完成

**状态:** ✅ 已完成  
**影响:** 所有新生成的文件  
**测试:** 手动验证通过

---

**优化时间:** 2026-03-27 11:02  
**优化者:** Michael · 幽默轻松版
