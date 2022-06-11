create database if not exists applestore;
use applestore;

# 1. Gives all the different genres.alter.
select * from sample_apple;
select distinct prime_genre from sample_apple;

#2. Gives all the genre with most apps rated.
select distinct prime_genre, rating_count_tot from sample_apple
order by rating_count_tot desc;

#3. The genre with most apps is Games
select prime_genre, count(track_name) as 'Number of apps' from sample_apple
group by prime_genre
order by count(track_name) desc; 

#4. The genre with less apps is Productivity
select prime_genre, count(track_name) as 'Number of apps' from sample_apple
group by prime_genre
order by count(track_name) asc;

#5. The top 10 apps most rated
select track_name, rating_count_tot from sample_apple
order by rating_count_tot desc
limit 10;

#6. The top 10 apps most rated by users
select track_name, user_rating from sample_apple
order by user_rating desc
limit 10;

#7. The most rated app is in the category of Socail Networking, that is Facebook. It misses the download data, to compared if the rating is in the same order of number of dowanload and compared with other genres and apps.
select track_name, rating_count_tot, prime_genre from sample_apple
order by rating_count_tot desc
limit 10; 

#8. The most rated app is a game Sudoku
select track_name, user_rating from sample_apple
order by user_rating desc
limit 10;


#9. The app with the bigger number of rates is not the most rated, maybe becausse the most rated is 
#the most downloaded and for that the user rating is a most bigger sample that can gives diferent rates. 
#And the game Sudoku, that is not the most rated, we consider that is not the most download and for that 
#are less rates and average of rates are bigger.
select track_name, user_rating, rating_count_tot from sample_apple
order by user_rating desc, rating_count_tot desc
limit 3; 

#10. Can analyse that the most rated app dont have the most rated counts. Top 3 regarding both user 
#ratings and number of votes
select track_name, price, user_rating, rating_count_tot from sample_apple
order by price desc, user_rating desc, rating_count_tot desc;
select track_name, price, user_rating, rating_count_tot from sample_apple
order by price desc, user_rating desc;

#11. The most rated and with a user rating above 3.5 are the apps with price zero, as can ben seen on 
#the order enqueries the rates are good even if the price is heigh, but for the zero price apps they are 
#moor downlaod if we consider the rating count as a parameter.
select track_name, price, user_rating, rating_count_tot from sample_apple
order by rating_count_tot desc; 