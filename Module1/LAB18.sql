-- create database l13;
-- **1. What are the different genres?**
SELECT * FROM l13.applestore;
SELECT prime_genre FROM L13.`applestore`
GROUP BY prime_genre;
-- **2. Which is the genre with the most apps rated?**
SELECT prime_genre, avg(user_rating) as bestrating FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY bestrating DESC ;
-- **3. Which is the genre with most apps?**
SELECT prime_genre, sum(track_name) as mostapps FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY mostapps DESC ;
-- **4. Which is the one with least?**
SELECT prime_genre, sum(track_name) as mostapps FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY mostapps ASC ;
-- **5. Find the top 10 apps most rated.**
SELECT track_name, rating_count_tot FROM L13.`applestore`
order by rating_count_tot DESC
limit 10;
-- **6. Find the top 10 apps best rated by users.**
SELECT track_name, user_rating FROM L13.`applestore` 
ORDER BY user_rating desc
limit 10;
-- **11. Do people care about the price of an app?** 
SELECT track_name,  user_rating, rating_count_tot, price FROM L13.`applestore` 
ORDER by user_rating desc;
SELECT track_name,  user_rating, rating_count_tot, price FROM L13.`applestore` 
ORDER by rating_count_tot desc;
SELECT prime_genre,  user_rating, rating_count_tot, price FROM L13.`applestore` 
group by prime_genre
ORDER by rating_count_tot desc;
SELECT prime_genre,  user_rating, rating_count_tot, price FROM L13.`applestore` 
group by prime_genre
ORDER by user_rating desc;