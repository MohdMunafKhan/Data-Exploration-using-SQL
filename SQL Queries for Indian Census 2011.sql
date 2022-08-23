
-- ----------------------------------------Analyzing Indian Census 2011----------------------------------------------

-- Total number of record in a dataset
select * from census;

-- Distinct State that is present in our data
select distinct state_name from census;

-- Count the number of district present in each state
select state_name,count(district_name) as 'Total no of district' from census
group by state_name;

-- Total population in 2011
select sum(Population) as Total_Pop_2011 from census;

-- Average population in each state
select state_name,avg(Population) as Avg_Pop from census
group by state_name;

-- Alternate way of finding top 3 highest populated state 
select state_name,population from census
order by population desc limit 3;

-- State that have population more than average population
select state_name,population, (select avg(Population) as avg_pop from census) as avg_pop from census 
where population > (select avg(Population) as avg_pop from census);

-- literate percentage of each states
select state_name,round((literate/sum(population)*100),2) as 'Literate_Percentage' from census
group by state_name;

-- Top and bottom 3 state in literacy rate
select * from (select state_name,avg(literate) as literacy_rate from census
group by state_name order by literacy_rate desc limit 3) as a
union
select * from (select state_name,avg(literate) as literacy_rate from census
group by state_name order by literacy_rate asc limit 3) as b;

-- percentage of male literate in each state
select state_name,male,round((literate/sum(population)*100),2) as literate_per from census
group by state_name;

-- percentage of female of literate in each state
select state_name,female,round((literate/sum(population)*100),2) as literate_per from census
group by state_name;

-- Top 5 state that have highest male_workers
select state_name,sum(male_workers) as tot_male_workers from census group by state_name 
order by tot_male_workers desc limit 5;

-- top 5 states where female worker are maximum
select state_name,sum(female_workers) as tot_female_workers from census group by state_name 
order by tot_female_workers desc limit 5;

-- Top 3 hindus dominant states according to census 2011
select state_name,sum(hindus) as No_of_Hindus from census
group by state_name order by No_of_Hindus desc limit 3;

-- Top 3 muslims dominant states 
select state_name,sum(muslims) as No_of_Muslims from census
group by state_name order by No_of_Muslims desc limit 3;

-- Check percentage of people available in each state according to age group
select state_name,round((Age_Group_0_29/sum(population)*100),2) as Age_Group_1,
round((Age_Group_30_49/sum(population)*100),2) as Age_Group_2,
round((Age_Group_50/sum(population)*100),2) as Age_Group_3 from census group by state_name;

-- regional diversity percentage of each state 
select state_name,round((Hindus/sum(population)*100),2) as Hindu_per,
round((Muslims/sum(population)*100),2) as Muslim_per,
round((Christians/sum(population)*100),2) as Christian_per,
round((Sikhs/sum(population)*100),2) as Sikh_per,
round((Buddhists/sum(population)*100),2) as Buddhist_per,
round((Jains/sum(population)*100),2) as Jain_per
from census group by state_name;

-- top 3 states consisting of highest graduate
select state_name,sum(Graduate_Education) as Graduate from census
group by state_name
order by Graduate desc limit 3;

-- state that have highest males
select state_name,sum(male) as males from census
group by state_name
order by males desc limit 1;

-- state that have highest females
select state_name,sum(female) as females from census
group by state_name
order by females desc limit 1;