SELECT
ID,
Name,
CASE
	WHEN Sex = 'M' THEN 'Male'
	ELSE 'Female'
END as Gender,
Age,
CASE
	WHEN Age < 18 THEN 'Under 18'
	WHEN Age BETWEEN 18 AND 25 THEN '18-25'
	WHEN Age BETWEEN 25 AND 30 THEN '25-30'
	WHEN Age BETWEEN 30 AND 35 THEN '30-35'
	WHEN Age > 35 THEN 'Over 35'
END as AgeGroup,
Height,
Weight,
ar.NOC,
nr.region AS Country,
PARSENAME(REPLACE(Games, ' ', '.'), 2) as Year,
PARSENAME(REPLACE(Games, ' ', '.'), 1) as Season,
City,
Sport,
Event,
CASE WHEN Medal = 'NA' THEN 'No Medal' ELSE Medal END as Medal
FROM athletes_event_results ar
JOIN noc_regions nr ON ar.NOC = nr.NOC
WHERE PARSENAME(REPLACE(Games, ' ', '.'), 1) = 'Summer'