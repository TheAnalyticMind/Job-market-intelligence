# 🌍 job-market-intelligence

> Live API-powered pipeline tracking data analyst job markets 
> across Europe — Python → Adzuna API → SQLite → SQL → Tableau

---

## 🎯 Problem
Where should a data analyst look for work in Europe in 2026? 
Which skills are actually demanded? Which markets pay the most?
Which companies sponsor visas?

This pipeline answers those questions with live data — not assumptions.

---

## 💡 Key Findings
- **Germany highest avg salary** at €70,395 — HIGH VALUE MARKET
- **Austria second highest** at €62,477 — HIGH VALUE MARKET  
- **UK dominates volume** — 372 active postings, 29.6% remote friendly
- **Excel is #1 skill** (60 mentions), Power BI #2 (53), SQL #3 (35)
- **France has 0% remote** — entirely office based market
- **1,614 live job postings** collected across 5 European countries

---

## 🏗️ Architecture
Adzuna Jobs API → Python (requests, pandas) → SQLite → 
SQL Analysis → Tableau Dashboard

---

## 🛠️ Tech Stack
| Layer | Tool |
|-------|------|
| Data Collection | Python, Adzuna REST API |
| Processing | Pandas, NumPy |
| Storage | SQLite |
| Analysis | SQL |
| Visualization | Tableau Public |
| Version Control | Git, GitHub |

---

## 📊 Market Intelligence Summary
| Country | Jobs | Avg Salary | Remote % | Market Signal |
|---------|------|------------|----------|---------------|
| United Kingdom | 372 | £54,047 | 29.6% | 🟡 MID VALUE |
| Netherlands | 76 | €55,493 | 3.9% | 🟡 MID VALUE |
| France | 64 | €45,578 | 0% | 🟡 MID VALUE |
| Germany | 21 | €70,395 | 4.8% | 🟢 HIGH VALUE |
| Austria | 17 | €62,477 | 17.6% | 🟢 HIGH VALUE |

---

## 🏢 Top Hiring Companies
| Company | Country | Open Roles |
|---------|---------|------------|
| ITOL Recruit | United Kingdom | 65 |
| KIND GmbH & Co. KG | Germany | 29 |
| Smart Future Campus GmbH | Germany | 21 |
| CGI Nederland | Netherlands | 13 |
| House of Bèta | Netherlands | 12 |

---

## 🚀 How to Run
1. Clone: `git clone https://github.com/TheAnalyticMind/job-market-intelligence`
2. Install: `pip3 install requests pandas numpy jupyter`
3. Get free API key: https://developer.adzuna.com
4. Add your credentials to `notebooks/01_Data_Collection.ipynb`
5. Run notebook end to end
6. View live dashboard: (https://public.tableau.com/app/profile/soumya.tripathy/viz/JobMarketIntelligenceDashboard_17743213185600/EuropianJobMarketIntelligenceDashboard?publish=yes)

---

## 📸 Live Dashboard
👉 [European Job Market Intelligence Dashboard](https://public.tableau.com/app/profile/soumya.tripathy/viz/JobMarketIntelligenceDashboard_17743213185600/EuropianJobMarketIntelligenceDashboard?publish=yes)

---

## 📋 Key Insights for Job Seekers
1. Germany and Austria are HIGH VALUE markets — avg salaries above €60k
2. UK offers most volume with 372 roles and highest remote flexibility at 29.6%
3. Excel and Power BI dominate European job descriptions — not just SQL
4. France is fully office-based — factor this into relocation decisions
5. Randstad Professional in Netherlands offers €69,600 avg — worth targeting