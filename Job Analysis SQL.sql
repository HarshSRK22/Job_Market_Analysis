use project_job_market_analysis;
show tables;
SELECT COUNT(*) AS total_jobs FROM Market;
DESCRIBE Market;

-- 2. States with Most Number of Jobs.
SELECT 
    Job_Location AS State,
    COUNT(*) AS Number_of_Jobs
FROM Market
GROUP BY Job_Location
ORDER BY Number_of_Jobs DESC;

-- 3. Average Minimal and Maximal Salaries in Different States.
SELECT
    Job_Location AS State,
    ROUND(AVG(Lower_Salary), 2) AS Average_Min_Salary,
    ROUND(AVG(Upper_Salary), 2) AS Average_Max_Salary
FROM Market
GROUP BY Job_Location
ORDER BY Average_Min_Salary DESC;

-- 4. Average Salary in Different States.
SELECT
    Job_Location AS State,
    ROUND(AVG(Avg_SalaryK), 2) AS Average_Salary
FROM Market
GROUP BY Job_Location
ORDER BY Average_Salary DESC;

-- 5. Top 5 Industries with Maximum Number of Data Science Related Job Postings.
SELECT
    job_title_sim,
    COUNT(*) AS Number_of_Jobs
FROM Market
GROUP BY job_title_sim
ORDER BY Number_of_Jobs DESC;

SELECT
    Industry,
    COUNT(*) AS Number_of_Jobs
FROM Market
WHERE job_title_sim IN (
    'data scientist',
    'machine learning engineer',
    'Data scientist project manager',
    'data modeler'
)
GROUP BY Industry
ORDER BY Number_of_Jobs DESC
LIMIT 5;

-- 6. Companies with Maximum Number of Job Openings.
SELECT
    Company_Name,
    COUNT(*) AS Number_of_Job_Openings
FROM Market
GROUP BY Company_Name
ORDER BY Number_of_Job_Openings DESC;

-- 7. Job Titles with Most Number of Jobs.
SELECT
    job_title_sim AS Job_Title,
    COUNT(*) AS Number_of_Jobs
FROM Market
GROUP BY job_title_sim
ORDER BY Number_of_Jobs DESC;

-- 8. Salary of Job Titles with Most Number of Jobs.
SELECT
    job_title_sim AS Job_Title,
    COUNT(*) AS Number_of_Jobs,
    ROUND(AVG(Lower_Salary), 2) AS Average_Min_Salary,
    ROUND(AVG(Upper_Salary), 2) AS Average_Max_Salary,
    ROUND(AVG(Avg_SalaryK), 2) AS Average_Salary
FROM Market
GROUP BY job_title_sim
ORDER BY Number_of_Jobs DESC;

-- 9. Skills Required by Companies for Each Job Title.
SELECT
    job_title_sim AS Job_Title,
    SUM(python) AS Python_Required,
    SUM(spark) AS Spark_Required,
    SUM(aws) AS AWS_Required,
    SUM(excel) AS Excel_Required
FROM Market
GROUP BY job_title_sim
ORDER BY job_title_sim;

SELECT job_title_sim AS Job_Title, 'Python' AS Skill, SUM(python) AS Required_Count
FROM Market
GROUP BY job_title_sim

UNION ALL

SELECT job_title_sim, 'Spark', SUM(spark)
FROM Market
GROUP BY job_title_sim

UNION ALL

SELECT job_title_sim, 'AWS', SUM(aws)
FROM Market
GROUP BY job_title_sim

UNION ALL

SELECT job_title_sim, 'Excel', SUM(excel)
FROM Market
GROUP BY job_title_sim

ORDER BY Job_Title, Required_Count DESC;

-- 10. Relation between Average Salary and Education.
SELECT 
    Degree,
    COUNT(*) AS Number_of_Jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS Average_Salary
FROM Market
WHERE Degree <> -1
GROUP BY Degree
ORDER BY Average_Salary DESC;

-- 11. Analyze all the features and derive multiple insights.
SELECT
    COUNT(*) AS Total_Jobs,
    ROUND(AVG(Avg_SalaryK), 2) AS Average_Salary,
    ROUND(AVG(Lower_Salary), 2) AS Average_Min_Salary,
    ROUND(AVG(Upper_Salary), 2) AS Average_Max_Salary,
    ROUND(AVG(Rating), 2) AS Average_Rating,
    ROUND(AVG(Age), 2) AS Average_Company_Age
FROM Market;

