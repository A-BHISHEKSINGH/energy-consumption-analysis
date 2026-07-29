# ⚡ Energy Consumption & Revenue Leakage Analytics

An end-to-end data analytics project combining **SQL**, **Power BI**, and **Excel** to analyze grid supply efficiency, electricity consumption patterns, Transmission & Distribution (T&D) losses, and financial revenue leakages across regional facilities.

---

## 📊 Dashboard Preview

<img width="1236" height="740" alt="Screenshot 2026-07-29 183551" src="https://github.com/user-attachments/assets/d78747b0-eb09-4f43-a58e-ff16cd996c7f" />


---

## 📌 Project Overview

Energy distribution networks frequently incur significant financial losses due to unbilled grid supply and high Transmission & Distribution (T&D) losses. 

This project processes multi-year energy consumption metrics across major Indian metropolitan hubs (Delhi, Mumbai, Bangalore, Kanpur, Lucknow) to:
* Track total grid supply vs. actual metered consumption.
* Quantify annual T&D loss percentages across facilities.
* Calculate total monetary **Revenue Leakage (in INR)** based on yearly tariff rates.

---

## 🛢️ SQL Data Extraction & Analytics

To support downstream visualization and validate financial metrics, custom SQL queries were authored (`sql/analysis_queries.sql`) using standard relational database syntax:

* **Multi-Table JOINs:** Combined `Energy_Consumptions`, `Building_Master`, and `Rates` tables to map geographic revenue leakages.
* **Aggregations & Grouping:** Calculated T&D loss percentages and identified top-performing vs. loss-heavy facilities.

---

## 📈 Key Metrics & Features

* **Total Grid Supply:** Overall energy (kWh) supplied to the grid network.
* **Total Consumption:** Total energy (kWh) recorded and billed to end-user facilities.
* **T&D Loss (%):** Percentage of grid energy lost during transmission and distribution.
* **Revenue Leakage (INR):** Financial loss calculated using dynamic annual price-per-unit rates.
* **Interactive Slicers:** Filter data dynamically by year (2016–2020) and location (Bangalore, Delhi, Kanpur, Lucknow, Mumbai).

---

## 🛠️ Tech Stack & Tools

* **Database / Querying:** SQL (JOINs, Aggregations, Window Functions)
* **Data Source:** Microsoft Excel (`Energy Consumptions Dataset_EXCEL.xlsx`)
  * `Energy Consumptions`: Monthly grid supply, consumption, and losses.
  * `Rates`: Annual tariff structure (Price Per Unit in ₹).
  * `Building Master`: Building ID to City mapping.
* **Business Intelligence:** Power BI Desktop (Power Query, DAX, Custom Visualizations)

---

## 📁 Repository Structure

```text
energy-consumption-analysis/
│
├── data/
│   └── Energy Consumptions Dataset_EXCEL.xlsx   # Source dataset
│
├── sql/
│   └── Electricity_sql.sql                     # Analytical SQL queries
│
├── dashboard/
│   └── PROJECT_ELECTRICITY_DASHBOARD.pbix         # Power BI report file
│
├── screenshots/                                     # Dashboard screenshot
│
└── README.md                                     # Documentation
