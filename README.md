# Google Merchandise Store Dashboard Project

This is a full-cycle business intelligence project simulating the role of a data analyst working with an e-commerce dataset. The project demonstrates the ability to process raw data, design data models, build KPIs, and deliver a meaningful Power BI dashboard.

---

## 🧠 Project Objectives

- Analyze user behavior across the shopping funnel (visit → add to cart → checkout → purchase)
- Identify top-performing products and countries
- Create interactive, business-ready dashboards with slicers, maps, and charts
- Simulate real-world BI workflow using PostgreSQL and Power BI

---

## ⚙️ Tech Stack

- **PostgreSQL**: Data modeling, transformation, dimension mapping (star schema)
- **Power BI**: Visualization, DAX metrics, dashboard layout
- **DAX**: KPI calculations (conversion rate, DAU, GMV)
- **SQL**: Data cleaning, aggregation, and country code normalization

---

## 📊 Dashboard Highlights

### ✅ KPI Indicators (Top Row)
- **访问量**: Total number of site visits from fact_events
- **活跃用户数 (DAU)**: Unique users per day
- **付费用户占比**: Purchase users / DAU
- **日期切片器**: Filter dashboard views by time

### 🔢 Trend Charts
- **日次访问量趋势**: User traffic trend over time
- **日次DAU趋势**: Daily active users (based on session activity)

### 🌏 Maps & Segments
- **国家活跃用户数**: Using corrected full country names
- **装置分布**: Bar chart by device type (desktop, mobile, tablet)

### 🌟 GMV Insights
- **商品GMV Top10**: Ranking products by purchase event GMV
- Calculation logic: filter `event_type = 'purchase'` and sum `price_in_usd`

### ⚡ Conversion Funnel
- **漏斗图**: Add to cart → Begin checkout → Purchase
- Calculated using event_type counts for each funnel stage
- Conversion rate computed as purchase / add to cart

---

## 🕊️ Key Learnings

- Independently built a BI dashboard from PostgreSQL raw data
- Learned how to model fact/dimension tables with star schema
- Practiced country code mapping and tooltip customization in Power BI
- Explored publishing challenges and registered a dev tenant for dashboard sharing

---

## 📚 Project Files

| Folder        | Contents                                                                 |
|---------------|--------------------------------------------------------------------------|
| `/data/`      | Sample data files for fact_events, items, and users                     |
| `/sql/`       | SQL scripts: schema creation, data cleaning, country mapping            |
| `/dashboard/` | Power BI .pbix file and dashboard screenshots                           |
| `/docs/`      | Markdown files explaining chart logic, KPIs, and business insights      |

---

## 🚀 Next Steps

- Add predictive forecasting module for GMV trend
- Enable RLS by user region
- Extend funnel with bounce or session durations
- Port dashboard to Tableau or Looker Studio for multi-platform comparison

---

## 🔗 GitHub Hosting Suggestions



