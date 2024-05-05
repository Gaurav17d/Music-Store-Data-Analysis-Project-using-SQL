--Question Set 2 – Moderate 

/*1. Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A */

select * from media_type
select * from genre 
select * from customer
select * from playlist
select * from track 
select * from playlist_track 
select * from album 
select * from artist 
select * from employee
select * from invoice
select * from invoice_line

-- customer --> first name , lastname , email 
select email , first_name , last_name from customer 
join invoice 
on customer.customer_id = invoice.customer_id 
join 
invoice_line 
on 
invoice.invoice_id = invoice_line.invoice_id 
where track_id in (
select track_id from track 
	join 
	genre 
	on 
	track.genre_id = genre.genre_id  
)
order by email ;

/*  2. Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands */


select a.name , count (b.title) as rock_music from 
artist as a 
join (
select album.artist_id , album.title 
from album 
join 
track
on 
album.album_id = track.album_id 
where album.album_id in (
select album_id from track  
where genre_id = '1') )
as b 
on 
a.artist_id = b.artist_id
group by a.name
order by rock_music desc
limit 10 ;


/* 3. Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first */ 

select * from track 

select name , milliseconds as song_length from track 
where milliseconds > (
select  avg (milliseconds ) from track )
order by song_length desc ;


