# 🛍️ E-Commerce Internet Sales — Deep Analysis & Dashboard Project

## 📘 Project Overview  
This project focuses on analyzing **E-Commerce Internet Sales** using SQL and Python to generate data-driven insights, build key performance indicators (KPIs), and support Power BI dashboard creation for different business roles such as Sales Managers and Sales Representatives.

The end goal is to provide **actionable insights**, **interactive dashboards**, and **automated analytics workflows** for improving sales reporting and strategic decisions.

---

## 🎯 Business Context  
The **Customer Analytics team** at an E-Commerce company has been tasked to build dashboards and insights to improve sales reporting.  
This project aligns with user stories defined in the **Business Demand Overview**, focusing on:  
- Internet Sales overview  
- Product-wise and customer-wise sales breakdown  
- Performance tracking against budgets  
- Monthly and quarterly sales trends  

---

## 💼 User Stories (Business Demand Overview)

| # | Role | Requirement | Value | Acceptance Criteria |
|---|------|--------------|--------|----------------------|
| 1 | Sales Manager | Dashboard overview of Internet Sales | Track top customers & products | Power BI dashboard auto-refreshing daily |
| 2 | Sales Representative | Customer-level Internet Sales view | Follow up high-value customers | Filterable dashboard by customer |
| 3 | Sales Representative | Product-level Internet Sales view | Identify top-performing products | Filterable dashboard by product |
| 4 | Sales Manager | Internet Sales vs Budget | Monitor sales vs targets | KPI-based dashboard comparing with budget |

---

## 🧱 Data Architecture & Technology Stack  

### 🧰 Tools Used  
| Category | Tool |
|-----------|------|
| Database | **Microsoft SQL Server** |
| Visualization | **Power BI** |
| Analysis & Automation | **Python (Jupyter Notebook)** |
| Documentation | **Markdown, PDF Reports** |

### 📂 Database Schema  

- **DIM_Customer** – Customer demographics and region  
- **DIM_Product** – Product details, category, subcategory  
- **DIM_Calendar** – Calendar dimension for time-series analysis  
- **FACT_InternetSales** – Core sales transaction fact table  
- **SalesBudget** – Budget reference for performance comparison  

---

## 🧠 SQL Analysis Summary (`deep_analysis.sql`)  

The SQL script performs:  

### 1️⃣ **Exploratory Data Analysis (EDA)**  
- Table record counts  
- Data previews  
- Null and invalid data checks  

### 2️⃣ **Data Quality Checks**  
- Missing customer or product keys  
- Zero or negative sales detection  

### 3️⃣ **Transformations & Views**  
- Created enriched sales view `vw_FactSalesEnriched` joining all dimensions  

### 4️⃣ **Customer Insights**  
- Top customers by sales  
- Gender-based spending trends  
- City-wise contribution  

### 5️⃣ **Product Insights**  
- Top 10 products  
- Category and subcategory performance  

### 6️⃣ **Time-Series Analysis**  
- Monthly trend analysis  
- Sales vs budget comparison  

### 7️⃣ **Deep Segmentation (RFM Analysis)**  
- Recency, Frequency, Monetary metrics to identify VIP and at-risk customers  

---

## 📊 Python Visualization Notebook (`ecommerce_sales_visual_analysis.ipynb`)  

The Jupyter notebook complements the SQL work by performing:  
- Data loading from SQL views  
- KPI trend visualizations using **Matplotlib** and **Seaborn**  
- Heatmaps and category-based performance charts  
- Time-series trend visualizations  
- Export of visual insights for Power BI alignment  

---

## 📈 Insights & Storytelling (`Insights_and_Storytelling.md`)

### 🔍 Customer Insights  
- Top 20% customers drive 80% of revenue (Pareto principle).  
- Male customers slightly outspend female customers.  
- Sales concentrated in major urban cities.  

### 📦 Product Insights  
- Accessories and Bikes dominate revenue.  
- Strong Q2 and Q4 seasonal trends.  

### 📉 Time-Series  
- Sales underperform in Q1 and Q3 but exceed budgets in Q4.  
- Rolling averages show strong year-end sales momentum.  

### 🎯 RFM Segmentation  
- ~15% VIP customers drive majority of sales.  
- At-risk customers show no purchase in 180+ days.  

### 🚀 Recommendations  
1. Launch **Loyalty Programs** for top-tier customers.  
2. Target **re-engagement campaigns** for at-risk users.  
3. Align **budget planning** with seasonal performance peaks.  

---

## 📁 Repository Structure  

```
📦 E-Commerce_Internet_Sales_Analysis
│
├── 📄 README.md                            # Project Overview
├── 📘 Business Demand Overview - User Stories1.pdf  # Business requirements
├── 🧠 deep_analysis.sql                    # SQL EDA & KPIs
├── 📊 ecommerce_sales_visual_analysis.ipynb # Python visual analysis
├── 📝 Insights_and_Storytelling.md          # Business insights summary
└── 📂 data/
    ├── DIM_Customer.csv
    ├── DIM_Product.csv
    ├── DIM_Calendar.csv
    ├── FACT_InternetSales.csv
    └── SalesBudget.csv
```

---

## 📏 Deliverables  

1. **SQL Deep Analysis File (`deep_analysis.sql`)**  
   - EDA, data cleaning, KPI creation, RFM segmentation  

2. **Python Visualization Notebook**  
   - Trend analysis, KPI comparison, storytelling visuals  

3. **Power BI Dashboard (Planned)**  
   - Real-time interactive dashboards for business roles  

4. **Insights Report**  
   - Strategic storytelling for leadership and marketing  

---

## 🧩 Future Enhancements  
- Automate SQL refresh pipelines for Power BI  
- Integrate ML model for future sales forecasting  
- Build dynamic customer segmentation dashboards  

---

## 👤 Author  
**Sri Sai Chowadry Thati**  
*Certified Data Analyst | Power BI & SQL Developer*  
📧 srisaichowdary1210@gmail.com 
📍 India  
