use sakila;
-- 1. List the number of films per category.
select name, count(*)
from category
inner join film_category
using (category_id)
inner join film
using (film_id)
group by name;

-- 2. Retrieve the store ID, city, and country for each store.
select store_id, city, country
from store
left join address
using (address_id)
left join city
using (city_id)
left join country
using (country_id);

-- 3. Calculate the total revenue generated by each store in dollars.
select store_id, sum(amount) as total_revenue
from store
left join customer
using (store_id)
left join payment
using (customer_id)
group by store_id;

-- Beata's query (different result - to investigate)
select s.store_id, sum(amount) as Total_revenue
from store as s
left join staff
	on s.store_id = staff.store_id
left join payment as p
	on staff.staff_id = p.staff_id
group by s.store_id;

select * from payment;

select * from staff;

-- 4. Determine the average running time of films for each category.
select name, round(avg(length),0)
from category
inner join film_category
using (category_id)
inner join film
using (film_id)
group by name;



-- Bonus

-- 5. Identify the film categories with the longest average running time.
select name, round(avg(length),0)
from category
inner join film_category
using (category_id)
inner join film
using (film_id)
group by name
order by avg(length) desc
limit 3;


-- 6. Display the top 10 most frequently rented movies in descending order.
select title, count(rental_id) as nb_of_rentals 
from film
join inventory
using (film_id)
join rental
using (inventory_id)
group by title 
order by count(rental_id) desc
limit 10;

-- 7. Determine if "Academy Dinosaur" can be rented from Store 1.

select title, count(inventory_id);

-- 8. Provide a list of all distinct film titles, along with their availability status in the inventory. 
-- Include a column indicating whether each title is 'Available' or 'NOT available.' 
-- Note that there are 42 titles that are not in the inventory, and this information can be obtained using a CASE statement combined with IFNULL."



SELECT VIEW_DEFINITION FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'sales_by_store';





