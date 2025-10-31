-- SELECT queries for the two tables

SELECT * 
FROM [dbo].[dim_location]

SELECT * 
FROM [dbo].[fact_properties]

-- Add the concatenated values into the SuburbPostcode column

--UPDATE dim_location
--SET suburbpostcode = CONCAT (suburb, ' - ', postcode)

--UPDATE fact_properties
--SET suburbpostcode = CONCAT (suburb, ' - ', postcode)

-- Question 3

-- 3(a)

SELECT state,
	   COUNT(city) AS numberofcities
FROM [dbo].[dim_location]
GROUP BY state
ORDER BY state

-- With trim
/*SELECT LTRIM(RIGHT(state, 28)) AS state,
	   COUNT(city) AS numberofcities
FROM [dbo].[dim_location]
GROUP BY state
ORDER BY state*/

-- 3(b)

SELECT city,
	   COUNT(postcode) AS countpostcodes, 
	   COUNT(suburb) AS countsuburbs
FROM [dbo].[dim_location]
GROUP BY city
ORDER BY city

-- 3(c)

-- 3(c) i. By suburb
SELECT suburb, 
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
GROUP BY suburb
ORDER BY suburb

-- 3(c) ii. By postcode
SELECT postcode, 
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
GROUP BY postcode
ORDER BY postcode

-- 3(c) iii. By suburb and postcode

-- Suburb and postcode seperately
/*SELECT suburb, 
	   postcode,
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
GROUP BY suburb, postcode
ORDER BY suburb, postcode*/

-- Concatenated column
SELECT suburbpostcode, 
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
GROUP BY suburbpostcode
ORDER BY suburbpostcode

-- 3(c) iv. By suburb and postcode with WHERE condition to remove NULL values

-- Suburb and postcode seperately
/*SELECT suburb, 
	   postcode,
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
WHERE property_median_value IS NOT NULL
GROUP BY suburb, postcode
ORDER BY suburb, postcode*/

-- Concatenated column
SELECT suburbpostcode, 
	   AVG(property_median_value) AS average_property_median_value
FROM [dbo].[fact_properties]
WHERE property_median_value IS NOT NULL
GROUP BY suburbpostcode
ORDER BY suburbpostcode










































