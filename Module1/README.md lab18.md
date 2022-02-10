![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | My first queries

Please, connect to the Data Bootcamp Google Database using the credentials provided in class. Choose the database called *appleStore*. Use the *data* table to query the data about Apple Store Apps and answer the following questions: 

create database l13;

**1. What are the different genres?**
SELECT * FROM l13.applestore;
SELECT prime_genre FROM L13.`applestore`
GROUP BY prime_genre;

**2. Which is the genre with the most apps rated?**
SELECT prime_genre, avg(user_rating) as bestrating FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY bestrating DESC ;

**3. Which is the genre with most apps?**
SELECT prime_genre, sum(track_name) as mostapps FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY mostapps DESC ;

**4. Which is the one with least?**
SELECT prime_genre, sum(track_name) as mostapps FROM L13.`applestore`
GROUP BY prime_genre
ORDER BY mostapps ASC

**5. Find the top 10 apps most rated.**
SELECT track_name, rating_count_tot FROM L13.`applestore`
order by rating_count_tot DESC
limit 10;

**6. Find the top 10 apps best rated by users.**
SELECT track_name, user_rating FROM L13.`applestore` 
ORDER BY user_rating desc
limit 10;
**7. Take a look at the data you retrieved in question 5. Give some insights.**
Facebook is far most rated by users

**8. Take a look at the data you retrieved in question 6. Give some insights.**
10 apps at least have the best rating
There are very different
One one bible as the same rate as one on zombies
Pizza have the same rate as the apps on learning english
**9. Now compare the data from questions 5 and 6. What do you see?**
The one which are the most often rated is not the one which are best rated


**10. How could you take the top 3 regarding both user ratings and number of votes?**
SELECT track_name,  user_rating, rating_count_tot, (rating_count_tot * user_rating) as produit  
FROM L13.`applestore` 
ORDER by produit desc;

the best apps are the one which the more number of votes - the total of value is higher

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name,  user_rating, rating_count_tot, price,   
FROM L13.`applestore` 
ORDER by user_rating desc;
SELECT track_name,  user_rating, rating_count_tot, price FROM L13.`applestore` 
ORDER by rating_count_tot desc;

The best rated are paying
The most rated are free

By genre
SELECT prime_genre,  user_rating, rating_count_tot, price FROM L13.`applestore` 
ORDER by rating_count_tot desc;
The most rated are free

People prefer to use free-app


## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
