select * from employee 

--.1 Who is the senior most employee based on job title?  

select employee_id , concat (first_name , '', last_name),
levels  from employee
order by levels desc 
limit 1 ;

--2. Which countries have the most Invoices? 

select * from invoice ;

select billing_country , count (invoice_id) as total_invoices
from invoice 
group by billing_country 
order by total_invoices desc ;

-- 3. What are top 3 values of total invoice? 

select * from invoice

select  total from 
invoice 
order by total desc 
limit 3

/* 4. Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals */

select * from invoice 
select billing_city , sum (total) as total_invoice
from invoice 
group by billing_city 
order by total_invoice desc
limit 1;

/*5. Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money */ 
select * from customer
select * from invoice 

select a.* ,
b.first_name  ||' '|| b.last_name as customer_name
from (
select customer_id ,  sum (total) as total
from invoice
group by customer_id
order by  total desc
limit 1) as a
join 
customer as b
on 
a.customer_id = b.customer_id ;





