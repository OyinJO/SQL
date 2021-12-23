
/*
Table name: salary_range_by_job_classification
Table columns: SetID, Job_Code, Eff_Date, Sal_End_Date, Salary_setID, Sal_Plan, Grade, Step, 
				Biweekly_High_Rate, Biweekly_Low_Rate, Union_Code, Extended_Step, Pay_Type
*/

-- 1) Find the distinct values for the extended step
SELECT 
	DISTINCT Extended_Step
FROM 
	salary_range_by_job_classification
	
-- 2) Excluding $0.00, what is the minimum bi-weekly high rate of pay 
SELECT
	MIN(Biweekly_high_Rate) AS min_biweekly_high_rate
FROM
	salary_range_by_job_classification
WHERE 	
	not Biweekly_high_Rate = '$0.00'

-- 3) What is the maximum biweekly high rate of pay
SELECT 
	MAX(Biweekly_high_Rate) as max_biweekly_high_rate
FROM 
	salary_range_by_job_classification

--4) What is the pay type for all the job codes that start with '03'?
SELECT
	job_code,
	pay_type
FROM 
	salary_range_by_job_classification
WHERE 
	Job_Code like'03%'
	
--5) Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0?
SELECT
	grade,
	eff_date,
	sal_end_date
FROM 
	salary_range_by_job_classification
WHERE
	grade = "Q90H0"
	
-- 6) Sort the Biweekly low rate in ascending order.
SELECT
	Biweekly_Low_Rate 
FROM 
	salary_range_by_job_classification
ORDER BY
	Biweekly_Low_Rate asc

--7) Find the step with Job Codes 0110-0400? 
SELECT 	
	step,
	job_code
FROM 
	salary_range_by_job_classification
WHERE
	job_code between 0110 and 0400
	
--8) What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
SELECT
	biweekly_high_rate,
	Biweekly_low_rate,
	(biweekly_high_rate - Biweekly_low_rate ) as diff_rates
FROM 
	salary_range_by_job_classification
WHERE 
	job_code = 0170

--9) What is the Extended Step for Pay Types M, H, and D? 
SELECT
	pay_type
	extended_step,
FROM 
	salary_range_by_job_classification
WHERE 
	pay_type in('M','H','D')
	
--10) What is the step for Union Code 990 and a Set ID of SFMTA or COMMN? 
SELECT 
	union_code,
	setid,
	step
FROM 
	salary_range_by_job_classification
WHERE
	(setid = 'SFMTA' or setid = 'COMMN') and union_code ='990'