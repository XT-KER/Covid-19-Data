#Question1
select sum(population) as total_population_in_Asia from (
select distinct(location), population from covid19data
where continent = "Asia") as t1;

#Question2
select sum(population) as total_population_in_ASEAN from (
select distinct(location), population from covid19data
where location in ("Brunei", "Cambodia", "Indonesia", "Laos", "Malaysia", "Myanmar", "Philippines","Singapore", "Thailand", "Vietnam")) as t2;

#Question3
select distinct(source_name) from country_vaccinations;

#Question4
select str_to_date(date,'%m/%d/%Y') AS date, total_vaccinations
from country_vaccinations
where country = 'Singapore'
having month(date) >= 3 and month(date) <= 5;

#Question5
select min(date) from country_vaccinations
where country = "Singapore" and daily_vaccinations > 0;

#Question6
select sum(new_cases) from covid19data
where location = "Singapore" and date >= (select min(str_to_date(date,'%m/%d/%Y')) as Date from country_vaccinations
where country = "Singapore" and daily_vaccinations > 0);

#Question7
select sum(new_cases) from covid19data
where location = "Singapore" and date < (select min(str_to_date(date,'%m/%d/%Y')) as Date from country_vaccinations
where country = "Singapore" and daily_vaccinations > 0);

#Question8
