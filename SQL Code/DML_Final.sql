######### dim_zipcode #########
SELECT * FROM raw_data.dim_zipcode;

INSERT INTO vaxchi.dim_zipcode (zipcode_id, zipcode, city, state, population)
SELECT zipcode_id, zipcode, city, state, population
FROM raw_data.dim_zipcode;

SELECT * FROM vaxchi.dim_zipcode;

######### dim_test_loc #########
SELECT * FROM raw_data.dim_test_loc;

INSERT INTO vaxchi.dim_test_loc(
    test_facility_id,
    zipcode_id,
    facility_test_name,
    phone_test,
    web_site_test,
    address_test,
    city,
    state
)
(SELECT
    test_facility_id,
    zipcode_id,
    facility_test_name,
    phone_test,
    web_site_test,
    address_test,
    city,
    state
FROM
    raw_data.dim_test_loc);
    
SELECT * FROM vaxchi.dim_test_loc;

######### dim_ccvi #########
INSERT INTO vaxchi.dim_ccvi(
    ccvi_id,
    zipcode_id,
    ccvi_score,
    ccvi_category
)
(SELECT
    ccvi_id,
    zipcode_id,
    ccvi_score,
    ccvi_category
FROM
    raw_data.dim_ccvi);
    
SELECT * FROM vaxchi.dim_ccvi;

######### dim_date #########
SELECT * FROM raw_data.dim_date;

#Date Conversion:
SELECT STR_TO_DATE(full_date, '%b-%y') as full_date FROM raw_data.dim_date;

INSERT INTO vaxchi.dim_date(
	date_id,
    full_date,
    month,
    year
)
(SELECT
	date_id,
    STR_TO_DATE(full_date, '%b-%y') as full_date,
    month,
    year
FROM
	raw_data.dim_date);
    
SELECT * FROM vaxchi.dim_date;

######### dim_vac_loc #########
SELECT * FROM raw_data.dim_vax_loc;

INSERT INTO vaxchi.dim_vax_loc(
	vax_facility_id,
    zipcode_id, 
    facility_vax_name, 
    website_vax, 
    phone_vax, 
    address_vax, 
    city, 
    state
)
(SELECT 
	vax_facility_id,
    zipcode_id, 
    facility_vax_name, 
    website_vax, 
    phone_vax, 
    address_vax, 
    city, 
    state
FROM
	raw_data.dim_vax_loc);

SELECT * FROM vaxchi.dim_vax_loc;

######### fact_vaxchi #########
SELECT * FROM raw_data.fact_vaxchi;

INSERT INTO vaxchi.fact_vaxchi(
    vaxchi_id,
    zipcode_id,
    date_id,
    sum_total_first_doses,
    sum_total_second_doses,
    sum_first_dose_5_11,
    sum_first_dose_12_17,
    sum_first_dose_18_64,
    sum_first_dose_65_plus,
    sum_second_dose_5_11,
    sum_second_dose_12_17,
    sum_second_dose_18_64,
    sum_second_dose_65_plus,
    sum_covid_cases,
    sum_covid_tests,
    sum_covid_deaths
)
(SELECT
    vaxchi_id,
    zipcode_id,
    date_id,
    sum_total_first_doses,
    sum_total_second_doses,
    sum_first_dose_5_11,
    sum_first_dose_12_17,
    sum_first_dose_18_64,
    sum_first_dose_65_plus,
    sum_second_dose_5_11,
    sum_second_dose_12_17,
    sum_second_dose_18_64,
    sum_second_dose_65_plus,
    sum_covid_cases,
    sum_covid_tests,
    sum_covid_deaths
FROM
    raw_data.fact_vaxchi);
    
SELECT * FROM vaxchi.fact_vaxchi;
