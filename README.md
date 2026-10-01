# 國際扶輪 3522 地區 萬聖節嘉年華會 官方網站

> **扶輪大手牽小手，龍來搞怪樂翻天！**  
> 國際扶輪 3522 地區 2026 年度服務計畫・台北市昌隆 198 公園

---

## 專案簡介

本網站依據 `PROJECT_MASTER_DOCUMENT.md` 與 `halloween_web_builder` 技能規格建置，專為推廣「2026 國際扶輪 3522 地區 萬聖節嘉年華會・扶輪大手牽小手」而設計。以萬聖節慶典為載體，結合教育公益、扶輪社會服務、跨域協作（台北市政府社會局、家扶中心、在地團體），實踐關懷弱勢兒少，打造充滿歡樂、特技表演、小鬼市集與走秀伸展台的年度盛會。

### 活動四大主軸
1. **🤝 活動緣起**：全額贊助近百位受輔助與弱勢學童量身訂製萬聖變裝服飾與園遊券，社友一對一牽手溫暖同行。
2. **🎭 鬼靈精怪伸展台**：星級街頭特技（小冰特技秀、馬拉將魔幻氣球、賴彥璋扯鈴彩虹龍、金氏紀錄溜溜球楊元慶、遨兒音樂）、蔣市長啟動儀式、高額獎金裝扮大賽（冠軍 $5,000）、雙場次幸運大摸彩。
3. **🎪 小鬼市集與闖關**：小小老闆生活體驗擺攤、萬聖無毒人體彩繪、5 大勇者闖關集章、14 家特色市集攤位導覽。
4. **👑 贊助夥伴與榮譽芳名錄**：聯合主辦/合辦/21 所協辦扶輪社、鬼王級/鬼怪級/小惡魔級贊助企業形象牆與榮譽榜。

---

## 技術架構

- **靜態生成引擎**：Jekyll 4.4 + Liquid + SCSS。
- **色彩系統**：取樣自大會主視覺橫幅 (`image40-1-mainbanner.jpeg`) 與 `Color-code.png`（基底深紫 `#3c2166`、紫梅夜色 `#634566`、南瓜橘 `#ff7518`、璀璨金黃 `#fca311`）。
- **Sponsors 專屬底色**：
  - `Sponsor-00.png` 容器採用 `linear-gradient(135deg, #634566 0%, #392860 100%)` 漸層，圖片完美貼合。
  - `Sponsor-01.png` 容器採用純白 `#ffffff`，企業標誌清晰呈現。
- **首頁即時倒數計時**：動態倒數至 **2026 年 10 月 24 日（六）11:00**（天、時、分、秒即時刷新）。
- **資料驅動 (`_data/`)**：贊助清冊、舞台節目時程、設攤廠商名冊全面以結構化 JSON 驅動。
- **全站 Footer 整合**：完整內嵌昌隆 198 公園交通指南（捷運、公車、停車場）、全區平面配置地圖與 Google Map。
- **SEO & AEO 最佳化**：內建 Schema.org `Event` JSON-LD 結構化資料，圖片 Alt 100% 覆蓋。

---

## 本機預覽指引

1. **一鍵啟動（最簡單）**：
   在專案資料夾直接雙擊 **`preview.bat`**，會自動開啟瀏覽器前往 [http://localhost:4000/](http://localhost:4000/)。

2. **終端機指令啟動**：
   ```bash
   bundle exec jekyll serve --baseurl "/"
   ```

---

## 專案目錄結構

```
Happy-Halloween/
├── _data/
│   ├── market_booths.json        # 14 家設攤廠商與大地闖關資料
│   ├── organizers.json           # 主辦社、合辦單位、21 家協辦社
│   ├── sponsors.json             # 鬼王級/鬼怪級/小惡魔級贊助商名錄
│   └── timeline.json             # 舞台節目時刻表、五大藝人、摸彩獎品
├── _includes/
│   ├── footer.html               # 全站頁尾（內嵌昌隆198公園交通與地圖）
│   └── nav.html                  # 導覽列（5大動線 + 🎃 裝扮秀 CTA）
├── _layouts/
│   └── default.html              # 基底 HTML 版型（含 Schema.org 與 OG）
├── assets/
│   ├── css/
│   │   └── style.scss            # 全站 SCSS 樣式系統（契合 Banner 色碼）
│   └── images/                   # 活動主視覺、海報、表演藝人照片與地圖
├── pages/
│   ├── charity-impact.html       # 活動緣起
│   ├── market-games.html         # 小鬼市集與闖關
│   ├── sponsors.html             # 贊助芳名錄
│   └── stage-program.html        # 鬼靈精怪伸展台
├── _config.yml                   # 全站設定檔
├── Gemfile                       # Ruby 相依套件
├── index.html                    # 網站首頁（Banner、倒數計時、Sponsors大圖）
├── MAINTENANCE_REPORT.md         # 資源巡檢通過報告 (All Passed)
├── SEO_REPORT.md                 # SEO/AEO 檢核通過報告
└── README.md                     # 專案說明文件
```

---

## 版權宣告
© 2026 國際扶輪 3522 地區 版權所有。
