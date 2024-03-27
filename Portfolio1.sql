

---Create Database Portfolio_Project

Create Database Portfolio_Project

Use Portfolio_Project


--Importing the Excel dataset

--Select statement

Select* from Portfolio_Project.dbo.Covid_Death order by 3,4
Select * from Portfolio_Project.dbo.Covid_vaccination order by 3,4

---- percentage deaths

Select location,date,total_cases,total_deaths from Portfolio_Project.dbo.Covid_Death order by 1,2


---Percentage of death in America

Select location,date,total_cases,total_deaths,(total_deaths *1.0/total_cases)*100 as Percentage_of_Death from Portfolio_Project.dbo.Covid_Death where location like '%states%' order by 1,2

--Maximum Cases by location

Select location,Max(total_cases) AS maximum_cases_by_location from Portfolio_Project.dbo.Covid_death Group by location  order by location


-----percentage of people got covid affected

Select location,date,total_cases,population,(total_cases/population )*100 as Percentage_of_cases from Portfolio_Project.dbo.Covid_Death  order by 1,2

--Minimum Cases by location

SELECT Location, MAX(total_cases) AS Minimum_cases_by_location
FROM Portfolio_Project.dbo.Covid_death
GROUP BY Location
ORDER BY minimum_cases_by_Location ASC;

---From date and end date of Report 

Select Min(date) AS Start_Date,Max(date)As End_date from Portfolio_Project.dbo.Covid_death 

--Total continent involed in report

Select Count(DISTINCT continent)AS Number_of_Continent from Portfolio_Project.dbo.Covid_death 

--Number of location involved in the report

Select  continent,count(distinct location)AS number_of_location from Portfolio_Project.dbo.Covid_death group by continent

--people not vaccinated 


Select location,population,total_vaccinations, (population-total_vaccinations)People_Not_Vaccinated from Portfolio_Project.dbo.Covid_vaccination 

---------------------Total case by age catagory

Select Portfolio_Project.dbo.Covid_death.population,total_cases,median_age,aged_65_older,aged_70_older from Portfolio_Project.dbo.Covid_death JOIN Portfolio_Project.dbo.Covid_vaccination 
ON Portfolio_Project.dbo.Covid_death.iso_code = Portfolio_Project.dbo.Covid_vaccination.iso_code
