-- 1. Employee Overview 

-- KPI's

-- Head Count
SELECT COUNT (DISTINCT Employee_id) AS Head_Count
FROM Employee;

-- Hires
SELECT COUNT(Employee_id) AS Hires
FROM Employee
WHERE hire_date >= DATE_TRUNC('year',CURRENT_DATE);

-- Terminations
SELECT Count(*) AS Terminations
FROM Employee
WHERE resigned = 'TRUE'

-- Avg Tenure
SELECT AVG(years_at_company) AS Avg_Tenure
FROM Employee;

-- Avg Age
SELECT AVG(age) AS Avg_Age
FROM Employee;

-- Avg Salary
SELECT AVG(monthly_Salary) AS Avg_Salary
FROM Employee;

-- Termination Rate
SELECT
     (SELECT COUNT(Employee_ID)
FROM Employee
WHERE Resigned = 'True')::decimal /
(SELECT COUNT(Employee_ID)
 FROM Employee) * 100 AS Termination_Rate;

-- Percentage of Male
SELECT 
  (SELECT COUNT(Employee_ID)
FROM Employee
WHERE Gender = 'Male') :: decimal /
(SELECT COUNT(Employee_ID)
  FROM Employee) * 100 AS Male

-- Percentage of Female
SELECT 
     (SELECT COUNT(Employee_id)
FROM Employee
WHERE Gender = 'Female') :: decimal /
(SELECT COUNT(Employee_id)
 FROM Employee) *100 AS Female;

-- Visuals

-- Gender 
SELECT Gender,
       (COUNT(Employee_ID)*100.0 / (SELECT COUNT(*) FROM Employee)) AS Gender_Percentage
FROM Employee
GROUP BY Gender;

-- Montly Hires
SELECT COUNT(Employee_ID) AS Total_New_Hires,TO_CHAR(Hire_Date,'Month') AS Month
FROM Employee
WHERE Hire_Date >= DATE_TRUNC('year',CURRENT_DATE)
GROUP BY Month
ORDER BY Month;

-- Montly Terminations 
SELECT 
	TO_CHAR(Hire_Date,'Month') AS Month,
	COUNT(Employee_ID) AS Total_Terminations  
FROM Employee
WHERE Resigned = 'True'
GROUP BY Month
ORDER BY Month DESC;

-- Job
SELECT 
      Job_Title AS Job,
      COUNT('Employee_ID') AS Total_Employees
FROM Employee
GROUP BY Job_Title
ORDER BY Total_Employees;

-- Avg Statisfaction Score
SELECT 
     AVG(performance_Score)
FROM Employee;

-- Employees by Department 
SELECT 
	 Department,
     COUNT(Employee_ID) AS Total_Employees
FROM Employee
GROUP BY Department
ORDER BY Total_Employees DESC;

-- Avg Salary by Department
SELECT 
      Department,
     AVG(Monthly_Salary) AS Salary
FROM Employee
GROUP BY Department
ORDER BY Salary DESC;

-- Employess by Age Group
SELECT 
	 age_group AS Age,
    COUNT(Employee_ID) AS Total_Employees
FROM Employee
GROUP BY Age_group
ORDER BY Total_Employees DESC;

-- Employees by Education
SELECT 
      Education_Level,
      COUNT(Employee_ID) AS Total_Employees
FROM Employee
GROUP BY Education_Level
ORDER BY Total_Employees DESC;

-- Employees by Performance Level
SELECT 
      Performance_level,
      COUNT(Employee_ID) AS Total_Employees
FROM Employee
GROUP BY Performance_Level
ORDER BY Total_Employees DESC;

-- Employees by Tenure
SELECT 
       Tenure_Category,
       COUNT(Employee_ID) AS Total_Employees
FROM Employee
GROUP BY Tenure_Category
ORDER BY Total_Employees DESC;

