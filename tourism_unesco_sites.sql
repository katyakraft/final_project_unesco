CREATE DATABASE travel_data;
USE travel_data;

SELECT * FROM merged_tourism_data_2 LIMIT 10;

#	HYPOTHESIS 1: UNESCO Site Count and Tourism Correlation
#Countries with more UNESCO sites have higher tourism arrivals, and popular tourist destinations tend to have more UNESCO designations.

SELECT 
    country,
    site_count,
    (arrivals_2007 + arrivals_2008 + arrivals_2009 + arrivals_2010 +
     arrivals_2011 + arrivals_2012 + arrivals_2013 + arrivals_2014 +
     arrivals_2015 + arrivals_2016 + arrivals_2017 + arrivals_2018) AS total_arrivals
FROM 
    merged_tourism_data_2
ORDER BY 
	total_arrivals DESC,
    site_count DESC;

#While there certainly is overall a correlation bewteen the number of site counts and the arrivals, it diesn'r necessarily means that the most
#visited countries are te ones with more sites.For example, Malasyia, Austria and HongKong are in the top 10 without having most number of sites.alter

# Calculate Average Arrivals Based on Site Count
#To see if higher site_count correlates with higher average tourism, group by site_count to calculate the average arrivals across each level of site count.
#Top 10 most visisted countries

SELECT 
    country,
    site_count,
    SUM(arrivals_2007 + arrivals_2008 + arrivals_2009 + arrivals_2010 + arrivals_2011 + 
        arrivals_2012 + arrivals_2013 + arrivals_2014 + arrivals_2015 + 
        arrivals_2016 + arrivals_2017 + arrivals_2018) AS total_arrivals
FROM 
    merged_tourism_data_2
GROUP BY 
    country, site_count
ORDER BY 
    total_arrivals DESC
LIMIT 10; -- Adjust the limit as necessary

#------------------------------------------------------------

#Top 10 less visisted countries
#Hypothesis 2.	Low Tourism and Fewer UNESCO Sites
#Hypothesis: Countries with lower tourism arrivals tend to have fewer UNESCO World Heritage sites, suggesting a possible link between limited visitor interest and fewer heritage designations.

SELECT 
    country,
    site_count,
    SUM(arrivals_2007 + arrivals_2008 + arrivals_2009 + arrivals_2010 + arrivals_2011 + 
        arrivals_2012 + arrivals_2013 + arrivals_2014 + arrivals_2015 + 
        arrivals_2016 + arrivals_2017 + arrivals_2018) AS total_arrivals
FROM 
    merged_tourism_data_2
GROUP BY 
    country, site_count
HAVING 
    total_arrivals > 0 #Filter arrivals more than 0
ORDER BY 
    total_arrivals ASC
LIMIT 10; 

#Here we can see that the most visited countries have very few unesco sites: between 0-4.



#------------------------------------

#3.	Threshold Effect of Site Count
#Hypothesis 3: Countries with 10 or more UNESCO sites attract significantly higher tourism arrivals than those with fewer sites.

SELECT
  CASE WHEN site_count >= 10 THEN '10 or more UNESCO sites'
       ELSE 'Fewer than 10 UNESCO sites'
  END AS site_count_category,
 FLOOR(AVG(arrivals_2007 + arrivals_2008 + arrivals_2009 + arrivals_2010 + 
      arrivals_2011 + arrivals_2012 + arrivals_2013 + arrivals_2014 + 
      arrivals_2015 + arrivals_2016 + arrivals_2017 + arrivals_2018) )
      AS avg_annual_arrivals
FROM merged_tourism_data_2
GROUP BY site_count_category;

#The countries with fewer than 10 UNESCO sites become notoriable less visits. 

#-------------------------------------------

#4.	Impact of New UNESCO Site Inscriptions on Tourism Growth ### NOT A GOOD APPROACH TO ANALISE IN SQL.

#Hypothesis 4: The announcement of a new UNESCO World Heritage site is associated with an increase in tourism arrivals in the following year, reflecting heightened interest and visitor appeal driven by the site’s designation. This hypothesis tests whether a new UNESCO listing has a measurable, positive impact on tourism growth.

SELECT 
    country,
    SUM(CASE WHEN inscribed_2007 = 1 THEN 1 ELSE 0 END) AS sites_2007,
    SUM(CASE WHEN inscribed_2008 = 1 THEN 1 ELSE 0 END) AS sites_2008,
    SUM(CASE WHEN inscribed_2009 = 1 THEN 1 ELSE 0 END) AS sites_2009,
    SUM(CASE WHEN inscribed_2010 = 1 THEN 1 ELSE 0 END) AS sites_2010,
    SUM(CASE WHEN inscribed_2011 = 1 THEN 1 ELSE 0 END) AS sites_2011,
    SUM(CASE WHEN inscribed_2012 = 1 THEN 1 ELSE 0 END) AS sites_2012,
    SUM(CASE WHEN inscribed_2013 = 1 THEN 1 ELSE 0 END) AS sites_2013,
    SUM(CASE WHEN inscribed_2014 = 1 THEN 1 ELSE 0 END) AS sites_2014,
    SUM(CASE WHEN inscribed_2015 = 1 THEN 1 ELSE 0 END) AS sites_2015,
    SUM(CASE WHEN inscribed_2016 = 1 THEN 1 ELSE 0 END) AS sites_2016,
    SUM(CASE WHEN inscribed_2017 = 1 THEN 1 ELSE 0 END) AS sites_2017,
    SUM(CASE WHEN inscribed_2018 = 1 THEN 1 ELSE 0 END) AS sites_2018,
    SUM(arrivals_2007) AS arrivals_2007,
    SUM(arrivals_2008) AS arrivals_2008,
    SUM(arrivals_2009) AS arrivals_2009,
    SUM(arrivals_2010) AS arrivals_2010,
    SUM(arrivals_2011) AS arrivals_2011,
    SUM(arrivals_2012) AS arrivals_2012,
    SUM(arrivals_2013) AS arrivals_2013,
    SUM(arrivals_2014) AS arrivals_2014,
    SUM(arrivals_2015) AS arrivals_2015,
    SUM(arrivals_2016) AS arrivals_2016,
    SUM(arrivals_2017) AS arrivals_2017,
    SUM(arrivals_2018) AS arrivals_2018
FROM 
    merged_tourism_data_2
WHERE 
    (inscribed_2007 = 1 OR inscribed_2008 = 1 OR inscribed_2009 = 1 OR inscribed_2010 = 1 OR
     inscribed_2011 = 1 OR inscribed_2012 = 1 OR inscribed_2013 = 1 OR inscribed_2014 = 1 OR
     inscribed_2015 = 1 OR inscribed_2016 = 1 OR inscribed_2017 = 1 OR inscribed_2018 = 1)
GROUP BY 
    country
HAVING 
    arrivals_2007 IS NOT NULL OR arrivals_2008 IS NOT NULL OR arrivals_2009 IS NOT NULL OR 
    arrivals_2010 IS NOT NULL OR arrivals_2011 IS NOT NULL OR arrivals_2012 IS NOT NULL OR 
    arrivals_2013 IS NOT NULL OR arrivals_2014 IS NOT NULL OR arrivals_2015 IS NOT NULL OR 
    arrivals_2016 IS NOT NULL OR arrivals_2017 IS NOT NULL OR arrivals_2018 IS NOT NULL;