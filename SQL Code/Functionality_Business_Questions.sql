# Which zip code and month had the highest number of total vaccinations(first and second doses) in the 18-64 age category? 
SELECT 
	fact_vaxchi.zipcode_id,
	fact_vaxchi.date_id, 
    dim_date.month,
    dim_date.year, 
    dim_zipcode.zipcode,
    (fact_vaxchi.sum_first_dose_18_64 + fact_vaxchi.sum_second_dose_18_64) as `18_64_Total`
FROM fact_vaxchi
	INNER JOIN dim_zipcode on dim_zipcode.zipcode_id=fact_vaxchi.zipcode_id
    INNER JOIN dim_date on dim_date.date_id=fact_vaxchi.date_id
GROUP BY fact_vaxchi.zipcode_id, fact_vaxchi.date_id
HAVING `18_64_Total`
ORDER BY `18_64_Total` DESC
LIMIT 1;

# During what month the lowest number of cases was recorded?
SELECT fact_vaxchi.date_id, dim_date.month,dim_date.year, SUM(fact_vaxchi.sum_covid_cases)
FROM fact_vaxchi
	INNER JOIN dim_date on dim_date.date_id=fact_vaxchi.date_id
GROUP BY fact_vaxchi.date_id
ORDER BY fact_vaxchi.sum_covid_cases ASC
LIMIT 1;

# What zipcodes have 5 or more vacination locations?
select dim_vax_loc.zipcode_id, dim_zipcode.zipcode, count(dim_vax_loc.facility_vax_name) as 'Number of Facilities'
FROM dim_vax_loc
	INNER JOIN dim_zipcode ON dim_vax_loc.zipcode_id=dim_zipcode.zipcode_id
GROUP BY dim_vax_loc.zipcode_id
HAVING count(dim_vax_loc.facility_vax_name)>=5
ORDER BY count(dim_vax_loc.facility_vax_name) DESC;

