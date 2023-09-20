# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
select * from city where name like "ping%" order by population asc; 
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
select * from city where name like "ran%" order by population desc;

#
# 3: Count all cities
#
select count(*) from city;
#
# 4: Get the average population of all cities
#
select avg(population) from city;
#
# 5: Get the biggest population found in any of the cities
#
select max(population) from city;

#
# 6: Get the smallest population found in any of the cities
#
select min(population) from city;
-- select * from city where population = 42;
#
# 7: Sum the population of all cities with a population below 10000
#
select sum(population) from city where population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
select count(*) from city where countrycode in("MOZ", "VNM");
-- select count(*) from city where countrycode = "MOZ" or countrycode = "VNM";

#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#

SELECT countrycode, COUNT(*) FROM city where countrycode in("MOZ", "VNM") GROUP BY countrycode;
#
# 10: Get average population of cities in MOZ and VNM
#
SELECT avg(population) from city where countrycode in("MOZ", "VNM");
#
# 11: Get the countrycodes with more than 200 cities
#
select countrycode as country, count(*) as amount_of_cities from city group by countrycode having count(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
select countrycode as country, count(*) as amount_of_cities from city group by countrycode having count(*) > 200 order by count(*);
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
select language as Language_spoken from countrylanguage inner join city on countrylanguage.countrycode = city.countrycode where city.population between 400 and 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
select name as City, language as Language_spoken from countrylanguage inner join city on countrylanguage.countrycode = city.countrycode where city.population between 500 and 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
select name from city where countrycode = (select countrycode from city where population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
select name from city where countrycode = (select countrycode from city where population = 122199) and population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#
select name, countrycode from city where countrycode = (select countrycode from city where name = "Luanda");

 
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
select * from city where id in
(select capital from country where region = 
(select region from country where capital = 
(select id from city where name = "Yaren")));
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
select distinct language from countrylanguage where countrycode in
(select code from country where region = 
(select region from country where capital = 
(select id from city where name = "Riga")));
#
# 20: Get the name of the most populous city
#
select name from city where population = (select max(population) from city);
