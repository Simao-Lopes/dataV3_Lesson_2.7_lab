use sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
select c.name as category, count(*) as number_movies
from category c
join film_category f
on c.category_id = f.category_id
group by c.name;

-- 2.Display the total amount rung up by each staff 
-- member in August of 2005.
select first_name, last_name, sum(p.amount) as total_amount
from payment p
join staff s
on p.staff_id = s.staff_id
where year(payment_date) = 2005 and month(payment_date) = 8
group by first_name;

-- 3.Which actor has appeared in the most films?
select first_name, last_name, count(first_name) as 'number of movies'
from film_actor
join actor using(actor_id)
group by film_actor.actor_id
order by count(first_name) desc
limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)

select concat(c.first_name,' ', c.last_name) as 'Most active customer', count(r.customer_id) as 'Rented Movies'
from customer c
join rental r using(customer_id)
group by r.customer_id
order by count(r.customer_id) desc
limit 1;


-- 5. Display the first and last names, as well as the address, of each staff member.
select concat(first_name, ' ', last_name) as Name , address
from address
join staff using (address_id);

-- 6. List each film and the number of actors who are listed for that film.

select title as movie, count(film_actor.actor_id) as 'number of actors'
from film
join film_actor using (film_id)
group by title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select concat(first_name,' ', last_name) as 'Client name', sum(amount) as 'Total amount'
from customer
join payment using(customer_id)
group by customer.customer_id
order by sum(amount) desc;

-- 8.List number of films per category.

select c.name as category, count(*) as number_movies
from category c
join film_category f
on c.category_id = f.category_id
group by c.name;