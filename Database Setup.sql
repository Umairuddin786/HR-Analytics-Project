CREATE TABLE Employee (
    Employee_ID SERIAL PRIMARY KEY,
    Department VARCHAR(500),
    Gender VARCHAR(10),
    Age INT,
    Job_Title VARCHAR(500),
    Hire_Date DATE,
    Years_At_Company int,
    Education_Level VARCHAR(500),
    Performance_Score INT,
    Monthly_Salary INT,
    Work_Hours_Per_Week INT,
    Projects_Handled INT,
    Overtime_Hours INT,
    Sick_Days INT,
    Remote_Work_Frequency INT,
    Team_Size INT,
    Training_Hours INT,
    Promotions INT,
    Employee_Satisfaction_Score NUMERIC(3, 2),
    Resigned BOOLEAN
);
SELECT * FROM employee;


-- Check for Null Values
SELECT 
	  Employee_ID, 
	  Department, 
	  Gender, 
	  Age, 
	  Job_Title, 
	  Hire_Date, 
	  Years_At_Company, 
	  Education_Level, 
	  Performance_Score, 
	  Monthly_Salary,
	  Work_Hours_Per_Week,
	  Projects_Handled, 
	  Overtime_Hours, 
	  Sick_Days, 
	  Remote_Work_Frequency, 
	  Team_Size, 
	  Training_Hours, 
	  Promotions, 
	  Employee_Satisfaction_Score,
      Resigned
FROM 
    Employee
WHERE 
    Employee_ID IS NULL OR
    Department IS NULL OR 
	Gender IS NULL OR 
	Age IS NULL OR 
	Job_Title IS NULL OR 
	Hire_Date IS NULL OR 
	Years_At_Company IS NULL OR 
	Education_Level IS NULL OR 
	Performance_Score IS NULL OR 
	Monthly_Salary IS NULL OR 
	Work_Hours_Per_Week IS NULL OR 
	Projects_Handled IS NULL OR 
	Overtime_Hours IS NULL OR 
	Sick_Days IS NULL OR 
	Remote_Work_Frequency IS NULL OR 
	Team_Size IS NULL OR 
	Training_Hours IS NULL OR 
	Promotions IS NULL OR 
	Employee_Satisfaction_Score IS NULL OR 
	Resigned IS NULL;

-- Check for Duplicate Values
SELECT
     Employee_ID,
     COUNT(*)
FROM
    Employee
GROUP BY 
      Employee_ID
HAVING 
     COUNT(*) > 1;

-- Preprocessing -Creating New Columns

-- Age Group 
ALTER TABLE Employee
ADD COLUMN Age_Group VARCHAR(50);

UPDATE Employee
SET Age_Group = CASE
    WHEN Age <35 THEN 'Young'
    WHEN Age BETWEEN 35 AND 45 THEN 'Mid-Age'
    ELSE 'Senior'
END;

-- Adding Tenure Category
ALTER TABLE Employee
ADD COLUMN Tenure_Category VARCHAR(50);

UPDATE Employee
SET Tenure_Category = CASE
	WHEN Years_At_Company <1 THEN 'Newbie'
	WHEN Years_At_Company BETWEEN 1 AND 5 THEN 'Intermediate'
	ELSE 'Veteran'

END;

SELECT * FROM Employee;

-- Adding Performance Level
ALTER TABLE Employee
ADD COLUMN Performance_Level VARCHAR(50);

UPDATE Employee
SET Performance_Level = CASE
    WHEN performance_score <3 THEN 'Low'
    WHEN performance_score BETWEEN 3 AND 4 THEN 'Medium'
    ELSE 'High'
END;
   
-- Adding Salary Bands

ALTER TABLE Employee
ADD COLUMN Salary_Band VARCHAR(50)

UPDATE Employee
SET Salary_Band = CASE
    WHEN monthly_salary <4500 THEN 'Low'
    WHEN monthly_salary BETWEEN 4500 AND 6500 THEN 'Medium'
    ELSE 'High'
END;

-- Adding Workload Classification
ALTER TABLE Employee
ADD COLUMN Workload_Class VARCHAR(50)

UPDATE Employee
SET Workload_Class = CASE
    WHEN  work_hours_Per_Week <40 THEN 'Part-Time'
	WHEN  work_hours_Per_Week BETWEEN 40 AND 50 THEN 'Full-Time'
	ELSE 'Over-Time'
END;

-- Adding Overtime Classification
ALTER TABLE Employee
ADD COLUMN Overtime_Class VARCHAR(50);

UPDATE Employee
SET Overtime_Class = CASE
	WHEN Overtime_Hours = 0 THEN 'NO Overtime'
	WHEN Overtime_Hours BETWEEN 1 AND 18 THEN 'Low Overtime'
	ELSE 'High Overtime'
END;

-- Adding Sick Days Classification
ALTER TABLE Employee
ADD COLUMN Sick_Days_Class VARCHAR(50);

UPDATE Employee
SET Sick_Days_Class = CASE
	WHEN Sick_Days = 0 THEN 'No Sick Days'
	WHEN Sick_Days  BETWEEN 1 AND 8 THEN 'Few Sick Days'
	ELSE 'Many Sick Days'
END;


-- Adding Remote Work Classification
ALTER TABLE Employee
ADD COLUMN Remote_Work_Class VARCHAR(50);

UPDATE Employee
SET Remote_Work_Class = CASE
    WHEN Remote_Work_Frequency = 0 THEN 'No Remote Work'
	WHEN Remote_Work_frequency BETWEEN 1 AND 25 THEN 'Occasional Remote Level'
	ELSE 'Frequent Remote Work'
END;

-- Adding Training Intensity
ALTER TABLE Employee
ADD COLUMN Training_Intensity VARCHAR(50);

UPDATE Employee
SET Training_Intensity = CASE
    WHEN Training_Hours = 0 THEN 'No Training'
	WHEN Training_Hours BETWEEN 1 AND 30 THEN 'Low Training'
	WHEN Training_Hours BETWEEN 31 AND 60 THEN 'Moderate Training'
	ELSE 'High Training'
END;

SELECT 
    Employee_ID,
    Monthly_Salary,
    Salary_Band,
    Work_Hours_Per_Week,
    Workload_Class,
    Overtime_Hours,
    Overtime_Class,
    Sick_Days,
    Sick_Days_Class,
    Remote_Work_Frequency,
    Remote_Work_Class,
    Training_Hours,
    Training_Intensity
FROM 
    Employee;

	
select distinct Training_Hours from employee 
order by  Training_Hours;
