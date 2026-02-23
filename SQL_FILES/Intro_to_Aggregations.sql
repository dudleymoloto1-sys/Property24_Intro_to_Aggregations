
--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)

--SECTION 1 – COUNT Aggregations (10 Questions)
select * from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--1. How many total properties are in the database?
select count (*) as total_properties from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--2. How many properties are listed in each province?
select ([PROVINCE]), count (PROVINCE) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by PROVINCE

--3. How many properties are listed in each city?
select ([CITY]), count (CITY) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by CITY

--4. How many properties have more than 2 bedrooms?
select count (PROPERTY_ID) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where BEDROOMS>=2

--5. How many properties have 2 or more bathrooms?
select count (PROPERTY_ID) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where BATHROOMS>=2

--6. How many properties have parking for at least 2 cars?
select count (PROPERTY_ID) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PARKING>=2

--7. How many properties are priced above R3,000,000?
select count (PROPERTY_ID) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PROPERTY_PRICE>=3000000

--8. How many properties are in Gauteng?
select count (PROPERTY_ID) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PROVINCE='Gauteng'

--9. How many properties per province have floor size greater than 200?
select ([PROVINCE]), count (PROVINCE) as number_of_properties 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where FLOOR_SIZE>200
Group by [PROVINCE]

--10. How many distinct provinces are in the table?
select count (DISTINCT PROVINCE) as number_of_provinces 
from [Property24_SQL_PRACTICE].[dbo].[Property_list]


--SECTION 2 – SUM Aggregations (10 Questions)
select * from [Property24_SQL_PRACTICE].[dbo].[Property_list]
--11. What is the total value of all properties combined?

select count (*) as total, sum(convert(bigint, PROPERTY_PRICE)) as sum_total
from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--12. What is the total property value per province?
select count (*) as total, sum(convert(bigint,PROPERTY_PRICE)) as total_value
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
Group by PROVINCE

--13. What is the total property value per city?
select (CITY) as City, sum(convert(bigint,PROPERTY_PRICE)) as total_value
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
Group by CITY

--14. What is the total monthly repayment for all properties?
select sum(convert(bigint,Monthly_Repayment)) as total_monthly_repayment
from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--15. What is the total monthly repayment per province?
select (PROVINCE) as Province, sum(convert(bigint,Monthly_Repayment)) as total_monthly_repayment
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
Group by PROVINCE

--16. What is the total once-off cost for all properties?
select sum(convert(bigint,Total_Once_off_Costs)) as total_once_off_cost
from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--17. What is the total once-off cost per province?
select (PROVINCE) as Province, sum(convert(bigint,Total_Once_off_Costs)) as total_once_off_cost
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
Group by PROVINCE

--18. What is the total property value for Gauteng?
select (PROVINCE) as Province, sum(convert(bigint,Total_Once_off_Costs)) as total_once_off_cost
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PROVINCE='Gauteng'
Group by PROVINCE

--19. What is the total property value for properties priced above R4,000,000?
select count (*) as total, sum(convert(bigint,PROPERTY_PRICE)) as total_value
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PROPERTY_PRICE>4000000 

--20. What is the total minimum gross monthly income required per province?
select (PROVINCE) as Province, sum(convert(bigint,Min_Gross_Monthly_Income)) as min_gross
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
Group by PROVINCE

--SECTION 3 – AVG Aggregations (10 Questions)
select * from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--21. What is the average property price overall?
select AVG(convert(bigint,PROPERTY_PRICE)) as average_overall_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--22. What is the average property price per province?
select PROVINCE as Province, AVG(convert(bigint,PROPERTY_PRICE)) as average_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by PROVINCE

--23. What is the average property price per city?
select CITY as City, AVG(convert(bigint,PROPERTY_PRICE)) as average_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by CITY

--24. What is the average number of bedrooms per province?
select province as Province, avg(convert(bigint,bedrooms)) as average_bedrooms
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--25. What is the average number of bathrooms per province?
select province as Province, avg(convert(bigint,bathrooms)) as average_bathrooms
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--26. What is the average floor size per province?
select province as Province, avg(convert(bigint,floor_size)) as average_floor_size
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--27. What is the average monthly repayment per province?
select province as Province, avg(convert(bigint,Monthly_Repayment)) as average_Monthly_Repayment
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--28. What is the average once-off cost per province?
select province as Province, avg(convert(bigint,Total_Once_off_Costs)) as average_once_off_cost
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--29. What is the average minimum gross monthly income per province?
select province as Province, avg(convert(bigint,Min_Gross_Monthly_Income)) as average_Min_Gross_Monthly_Income
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province

--30. What is the average property price for properties above R3,000,000?
select AVG(convert(bigint,PROPERTY_PRICE)) as average_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where PROPERTY_PRICE>3000000

--SECTION 4 – GROUP BY + Filtering (10 Questions)
select * from [Property24_SQL_PRACTICE].[dbo].[Property_list]

--31. Which province has the highest average property price?
select top 1 Province, avg(convert(bigint,property_price)) as average_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province
order by province desc

--32. Which province has the lowest average property price?
select top 1 Province, avg(convert(bigint,property_price)) as average_price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by province
order by province asc

--33. Which city has the highest total property value?
select top 1 City, sum(convert(bigint,property_price)) as Price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by city
order by city desc

--34. Which city has the lowest average property price?
select top 1 City, avg(convert(bigint,property_price)) as Price
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
group by city
order by city asc

--35. How many properties per province are priced above R2,000,000?
select province, COUNT(property_id) as Number_of_properties
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where property_price>2000000
group by province

--36. What is the average floor size per province for properties above R3,000,000?
select province, avg(floor_size) as average_floor_size
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where property_price>3000000
group by province

--37. What is the total property value per province for properties with 3 or more bedrooms?
select province, sum(convert(bigint,property_price)) as Total_value
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where bedrooms>=3
group by province
order by province desc

--38. What is the average monthly repayment per province for properties above R4,000,000?
select province, avg(Monthly_Repayment) as average_monthly_repayment
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where property_price>4000000
group by province

--39. How many properties per city have parking for 2 or more cars?
select city, count(PROPERTY_ID) as number_of_properties
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where parking>=2
group by city

--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
select province, avg(Min_Gross_Monthly_Income) as average_min_gross_monthly_income
from [Property24_SQL_PRACTICE].[dbo].[Property_list]
where property_price>5000000
group by province