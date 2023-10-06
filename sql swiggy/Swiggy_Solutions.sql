use swiggy_analysis;
-- QUESTION 1.
SELECT 
    COUNT(DISTINCT restaurant_name) AS high_rated_restaurents
FROM
    swiggy
WHERE
    rating > 4.5;
    
-- Question 2 
select city , count(distinct restaurant_no) as no_of_restaurants from swiggy
group by city
order by count(restaurant_no) desc
limit 1;

-- Question 3

select count(distinct restaurant_name) from swiggy
where restaurant_name like '%PIZZA%';

-- Question4 

select cuisine , count(cuisine) from swiggy
group by cuisine
order by count(cuisine) desc
limit 1;

-- Question 5

select city , avg(rating) from swiggy
group by city;

-- Question 6

select distinct restaurant_name,menu_category,max(price) from swiggy
where menu_category like 'Recommended'
group by restaurant_name,menu_category;

select distinct restaurant_name,
menu_category,max(price) as highestprice
from swiggy where menu_category='Recommended'
group by restaurant_name,menu_category;

-- Question 7 

select restaurant_name,cost_per_person from swiggy
where cuisine not like '%Indian%'
group by restaurant_name,cost_per_person
order by cost_per_person desc
limit 5;

select distinct restaurant_name,cost_per_person
from swiggy where cuisine<>'Indian'
order by cost_per_person desc
limit 5;

-- Question 8

select round(avg(cost_per_person),2) from swiggy;

select distinct restaurant_name,cost_per_person from swiggy
where cost_per_person > 376;

select distinct restaurant_name,avg(cost_per_person)from swiggy
where cost_per_person > (select avg(cost_per_person) from swiggy)
group by restaurant_name;


-- Question 9

SELECT 
    distinct t1.restaurant_name ,t1.city
FROM
    swiggy t1
        JOIN
    swiggy t2 ON t1.restaurant_name = t2.restaurant_name
WHERE
    t1.city <> t2.city
    order by restaurant_name;


 -- Question 10
 
 select restaurant_name,menu_category,count(item) from swiggy
 where menu_category like 'Main Course'
 group by menu_category,restaurant_name
 order by count(item) desc
 limit 1;
 
 -- Question 11
 
 select distinct restaurant_name from swiggy
 where veg_or_nonveg <> 'Non-Veg'
 order by restaurant_name;
 
 
 select distinct restaurant_name,
(count(case when veg_or_nonveg='Veg' then 1 end)*100/
count(*)) as vegetarian_percetage
from swiggy
group by restaurant_name
having vegetarian_percetage=100.00
order by restaurant_name;


-- Q12
select distinct restaurant_name,
avg(price) as average_price
from swiggy group by restaurant_name
order by average_price limit 1;

-- Q13
select distinct restaurant_name,
count(distinct menu_category) as no_of_categories
from swiggy
group by restaurant_name
order by no_of_categories desc limit 5;

-- Q14
select distinct restaurant_name,
(count(case when veg_or_nonveg='Non-veg' then 1 end)*100
/count(*)) as nonvegetarian_percentage
from swiggy
group by restaurant_name
order by nonvegetarian_percentage desc limit 1;

