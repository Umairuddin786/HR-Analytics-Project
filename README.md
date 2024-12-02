# HR Analytics Project 🚀

## Overview
This project leverages **PostgreSQL** for database management and preprocessing, and **Power BI** for creating interactive dashboards to analyze workforce insights. The focus is on monitoring **employee demographics**, **performance trends**, and **retention & engagement patterns** to support data-driven HR decisions.

---

## Tools and Technologies 🛠️
- **PostgreSQL**: Database setup, data cleaning, and query handling.
- **Power BI**: Visualization of employee data through dashboards.
- **Languages**: SQL (PostgreSQL), DAX (Power BI measures).

---

## Objectives 🎯
1. Monitor employee demographics and diversity metrics.
2. Analyze performance trends across departments and roles.
3. Understand employee retention and engagement patterns.

---

## Data Pipeline 🔄
1. **Data Sources**:
   - Employee records
   - Performance metrics
   - Retention data
2. **Database Setup**:
   - Data stored in PostgreSQL with normalized schema.
3. **ETL Process**:
   - Data cleaned, transformed, and exported to Power BI for visualization.

---

## Dashboards 📊

### 1. Overview Dashboard
**Purpose**: Provide a summary of workforce statistics.

#### **Key Metrics**:
- Total Employees: 100K
- Gender Diversity: 48% Male, 48% Female
- Average Tenure: 4 Years
- Termination Rate: 10.01%
- Average Salary: $6.4K

#### **Visuals**:
- Gender Distribution (Donut Chart)
- Department-Wise Employee Count (TreeMap)
- Age Group Breakdown (Bar Chart)

---

### 2. Performance Dashboard
**Purpose**: Analyze employee performance across roles and departments.

#### **Key Metrics**:
- Average Performance Score: 3.00
- Total Projects Handled: 2M
- Training Hours: 75M
- Monthly Overtime Hours: 1M

#### **Visuals**:
- Department-Wise Performance (Clustered Bar Chart)
- Tenure vs. Performance (Scatter Plot)
- Monthly Overtime Trend (Line Chart)

---

### 3. Retention & Engagement Dashboard
**Purpose**: Monitor turnover rates and engagement trends.

#### **Key Metrics**:
- Retention Rate: 89.99%
- Engagement Rate: 50.04%
- Avg Tenure of Resigned Employees: 4.48 Years
- % of High Performers: 39.87%

#### **Visuals**:
- Monthly Turnover Rate (Line Chart)
- Remote Work Engagement (Stacked Bar Chart)
- Resignation by Age Group (Bar Chart)

---

## PostgreSQL Role 🗄️
- **Database Setup**:
  - Employee data stored in normalized tables: `employees`, `performance`, `retention`.
- **Sample Queries**:
  ```sql
  -- Gender Distribution
  SELECT gender, COUNT(*) AS count
  FROM employees
  GROUP BY gender;

  -- Average Performance by Department
  SELECT department, AVG(performance_score) AS avg_score
  FROM performance
  GROUP BY department;
