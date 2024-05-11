/*
PROJECT TITLE: "HR Analysis"
Analyzing to determine the Rate of Attrition among Staffs considering employee details, workflow and respective departments.
*/

/*
Summarizing to determine the Attrition Rate among employees:
*/
-- Total Employees
SELECT
     COUNT(employeecount) AS Total_Employee
FROM hr_analysis;
/*
	Total_Employee
	          1470
*/


-- Total Employees by Attrition
SELECT
     CASE 
       WHEN Attrition = 'yes' THEN 'Attrition'
       WHEN Attrition = 'no' THEN 'No_Attrition'
     END AS Status,
     COUNT(EmployeeCount) Rate
FROM hr_analysis
GROUP BY 1;
/*
    Status	          Rate
    Attrition	           237
    No_Attrition	  1233
*/


/*
Delving to determine the ranges and the determinants of the Attrition by:
i. EMPLOYEE DEMOGRAPHY
*/
-- Attrition summary by Gender
SELECT
     Gender AS Gender_segment,
     COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1;
/*
	Gender_segment	   Attrition_rate
	Female	                       87
	Male	                      150
*/


-- Attrition summary by Marital_Status and Gender
SELECT
     MaritalStatus AS Marital_Status,
     Gender,
     COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1, 2;
/*
	Marital_Status	      Gender	    Attrition_rate
	Single	              Female	                47
	Single	              Male	                73
	Married	              Male	                53
	Married	              Female	                31
	Divorced	      Male	                24
	Divorced	      Female	                 9
*/


-- Attrition summary by Age
SELECT
     CASE
       WHEN age BETWEEN 18 AND 30 THEN '18-30'
       WHEN age BETWEEN 31 AND 45 THEN '31-45'
       WHEN age BETWEEN 46 AND 60 THEN '46-60'
	 END AS Age_Category,
     COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Age_Category	   Attrition_rate
	       18-30	              100
	       31-45	              103
	       46-60	               34
*/


-- Attrition summary by Education_Field
SELECT
      Educationfield AS Education_Field,
      COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 2 DESC;
/*
	Education_Field	       Attrition_rate
	Life Sciences	                   89
	Medical	                           63
	Marketing	                   35
	Technical Degree	           32
	Other	                           11
	Human Resources	                    7
*/




/*
ii. JOB DUTY
*/
-- Attrition summary by Department
SELECT
	 Department,
     COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 2 DESC;
/*
	Department	                 Attrition_rate
	Research & Development	                    133
	Sales	                                     92
	Human Resources	                             12
*/


-- Attrition summary by Job_Role
SELECT
     JobRole AS Job_Role,
     COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 2 DESC;
/*
	Job_Role	                Attrition_rate
	Laboratory Technician	                    62
	Sales Executive	                            57
	Research Scientist	                    47
	Sales Representative	                    33
	Human Resources	                            12
	Manufacturing Director	                    10
	Healthcare Representative	             9
	Manager	                                     5
	Research Director	                     2
*/


-- Attrition summary by Job_Level
SELECT
     CASE 
       WHEN JobLevel = 1 THEN 'Entry Level'
       WHEN joblevel = 2 THEN 'Junior or Associate'
       WHEN joblevel = 3 THEN 'Mid level Specialist'
       WHEN JobLevel = 4 THEN 'Senior'
       WHEN JobLevel = 5 THEN 'Executive'
	 END AS Job_Level,
	 COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Job_Level	       Attrition_rate
	Entry Level	                  143
	Executive	                    5
	Junior or Associate	           52
	Mid level Specialist	           32
	Senior	                            5
*/

-- Attrition summary by Year_in_Current_Role and Department
SELECT
     YearsInCurrentRole AS Years_In_Current_Role,
     Department,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1, 2
ORDER BY 1;
/*
	Years_In_Current_Role	        Department	             Attrition_Rate
	                    0	        Human Resources	                         4
	                    0	        Research & Development	                45
	                    0	        Sales	                                24
	                    1	        Human Resources	                         1
	                    1	        Research & Development	                 7
	                    1	        Sales	                                 3
			    2	        Human Resources	                         5
	                    2	        Research & Development	                39
	                    2	        Sales	                                24
	                    3	        Research & Development	                 6
			    3	        Sales	                                10
	                    4	        Research & Development	                 9
			    4	        Sales	                                 6
	                    5	        Sales	                                 1
	                    6	        Human Resources	                         1
	                    6	        Research & Development	                 1
	                    7	        Human Resources	                         1
	                    7	        Research & Development	                17
			    7	        Sales	                                13
	                    8	        Research & Development	                 2
	                    8	        Sales	                                 5 
	                    9	        Research & Development	                 3
			    9	        Sales	                                 3
	                   10	        Research & Development	                 1
	                   10	        Sales	                                 1
	                   12	        Sales	                                 1
			   13	        Research & Development	                 1
	                   14	        Sales	                                 1
			   15	        Research & Development	                 2
*/



/*
iii. EMPLOYEE ENGAGEMENT
*/
-- Attrition summary by Performance_Rating
SELECT
     CASE
       WHEN PerformanceRating = 3 THEN 'Low'
       WHEN PerformanceRating = 4 THEN 'High'
	 END AS Performance_rating,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1;
/*
	Performance_rating	      Attrition_Rate
	Low	                                 200
	High	                                  37
*/


-- Attrition summary by Work_life_Balance
SELECT 
     CASE
       WHEN WorkLifeBalance = 1 THEN '1..Bad'
       WHEN WorkLifeBalance = 2 THEN '2..Average'
       WHEN WorkLifeBalance = 3 THEN '3..Good'
       WHEN WorkLifeBalance = 4 THEN '4..Excellent'
	 END AS Work_Life_Balance,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Work_Life_Balance	   Attrition_Rate
	1..Bad	                               25
	2..Average	                       58
	3..Good	                              127
	4..Excellent	                       27
*/


-- Attrition summary by Overtime
SELECT 
     Overtime,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1;
/*
	Overtime	   Attrition_Rate
	Yes	                      127
	No	                      110
*/


-- Attrition summary by Job_Involvement
SELECT
     CASE 
       WHEN JobInvolvement = 1 THEN '1..Very_Low'
       WHEN JobInvolvement = 2 THEN '2..Low'
       WHEN JobInvolvement = 3 THEN '3..Moderate'
       WHEN JobInvolvement = 4 THEN '4..High'
	 END AS Job_Involvement_Rank,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Job_Involvement_Rank	   Attrition_Rate
	1..Very_Low	                       28
	2..Low	                               71
	3..Moderate	                      125
	4..High	                               13 
*/    


-- Attrition summary by Distance_From_Home
SELECT
     CASE
       WHEN DistanceFromHome BETWEEN 1 AND 10 THEN 'Near'
       WHEN DistanceFromHome BETWEEN 10 AND 20 THEN 'Far'
       WHEN DistanceFromHome BETWEEN 20 AND 30 THEN 'Very_Far'
	 END AS Distance_From_Home,
     COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 2 DESC;
/*
	Distance_From_Home	   Attrition_Rate
	Near	                              144
	Far	                               48
	Very_Far	                       45
*/    





/*
iv. ORGANIZATION FACTORS
*/
-- Attrition summary by Job_Satisfaction
SELECT
     CASE
       WHEN JobSatisfaction = 1 THEN '1..Very_Dissatisfied'
       WHEN JobSatisfaction = 2 THEN '2..Dissatisfied'
       WHEN JobSatisfaction = 3 THEN '3..Satisfied'
       WHEN JobSatisfaction = 4 THEN '4..Very_Satisfied'
	 END AS Job_Satisfaction_Rank,
     COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Job_Satisfaction_Rank	   Attrition_rate
	1..Very_Dissatisfied	               66
	2..Dissatisfied	                       46
	3..Satisfied	                       73
	4..Very_Satisfied	               52
*/


-- Attrition summary by Environmental_Satisfaction
SELECT
     CASE
       WHEN EnvironmentSatisfaction = 1 THEN '1..Very_Dissatisfied'
       WHEN EnvironmentSatisfaction = 2 THEN '2..Dissatisfied'
       WHEN EnvironmentSatisfaction = 3 THEN '3..Satisfied'
       WHEN EnvironmentSatisfaction = 4 THEN '4..Very_Satisfied'
	 END AS Enbironmental_Satisfaction_Rank,
     COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Enbironmental_Satisfaction_Rank	   Attrition_rate
	1..Very_Dissatisfied	                       72
	2..Dissatisfied	                               43
	3..Satisfied	                               62
	4..Very_Satisfied	                       60
*/


-- Attrition summary by Relationship_Satisfaction
SELECT
     CASE 
	   WHEN RelationshipSatisfaction = 1 THEN '1..Very_Dissatisfied'
       WHEN RelationshipSatisfaction = 2 THEN '2..Dissatisfied'
       WHEN RelationshipSatisfaction = 3 THEN '3..Satisfied'
       WHEN RelationshipSatisfaction = 4 THEN '4..Very_Satisfied'
	 END AS Relationship_Satisfaction_Rank,
     COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY 1
ORDER BY 1;
/*
	Relationship_Satisfaction_Rank	   Attrition_rate
	1..Very_Dissatisfied	                       57
	2..Dissatisfied	                               45
	3..Satisfied	                               71
	4..Very_Satisfied	                       64
*/
