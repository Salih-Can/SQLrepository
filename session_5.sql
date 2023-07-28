
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
/* Session-5 (28 July 2023) */
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

------------------------------------------
--FILTERING RECORDS
------------------------------------------
------------------------------------------
--Filtering Numbers
------------------------------------------
------------------------------------------
--Exercise (Using WHERE with numbers)
-----------------------------------------
--Filtering with WHERE allows you to analyze your data better. 
--You may have a dataset that includes a range of different movies, and you need to do a case study on the most notable films with the biggest budgets. 
--In this case, you'll want to filter your data to a specific budget range. 


--Now it's your turn to use the WHERE clause to filter numeric values!

-----------
--Instructions:

--1. Select the film_id and imdb_score from the reviews table and filter on scores higher than 7.0.

--2. Select the film_id and facebook_likes of the first ten records with less than 1000 likes from the reviews table.

--3. Count how many records have a num_votes of at least 100,000; use the alias films_over_100K_votes.

SELECT TOP 10 *
FROM reviews;
-----------
--Hints:

--1. You'll need to use the > operator here.
--2. You'll need to LIMIT the results here.
--3.1. This query should include records with exactly 100,000 votes.
--3.2. The syntax for counting all records is COUNT(*).

----------
--Solutions:








--1. Select film_ids and imdb_score with an imdb_score over 7.0:

SELECT film_id, imdb_score 
FROM reviews
WHERE imdb_score > 7.0;


--2. Select film_ids and facebook_likes for ten records with less than 1000 likes:

SELECT TOP 10 film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000;


--3. Count the records with at least 100,000 votes as films_over_100K_votes:
SELECT COUNT (*) AS films_over_100k
FROM reviews
WHERE num_votes >= 100000;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Exercise (Using WHERE with text)
-----------------------------------------
--WHERE can also filter string values. 
--Imagine you are part of an organization that gives cinematography awards, and you have several international categories. 
--Before you confirm an award for every language listed in your dataset, 
--It may be worth seeing if there are enough films of a specific language to make it a fair competition. 
--If there is only one movie or a significant skew, it may be worth considering a different way of giving international awards.

--Let's try this out!


-----------
--Instructions:

--1.1. Select and count the language field from films table, using the alias count_spanish.

--1.2. Apply a filter to select only Spanish from the language field.


-----------
--Hints:

--1.1. The equals operator can be used to filter text with WHERE.
--1.2. Single quotes are used in SQL to signify the start and end of a string.


----------
--Solutions:

SELECT TOP 10 *
FROM films;


--1. Count the Spanish-language films from films table as count_spanish:
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';


--Alternatively:


SELECT COUNT(*) AS count_spanish
FROM films
WHERE language = 'spanish';





--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

------------------------------------------
--Multiple Criteria
------------------------------------------
------------------------------------------
--Exercise (Using AND)
-----------------------------------------
--The following exercises combine AND and OR with the WHERE clause. 
--Using these operators together strengthens your queries and analyses of data.

--You will apply these new skills now on the films database.

-----------
--Instructions:

--1. Select the title and release_year for all German-language films released before 2000.

--2. Update the query from the previous step to show German-language films released after 2000 rather than before.

--3. Select all details for German-language films released after 2000 but before 2010 using only WHERE and AND.



-----------
--Hints:

--1.1. Remember, strings are enclosed in single quotes while numbers are not.
--1.2. You can combine two filter conditions using AND.
--2.   You'll need to use the > operator here.
--3.   * is a shortcut for selecting all fields.


----------
--Solutions:
SELECT TOP 10 *
FROM films;

--1. Select the title and release_year for all German-language films released before 2000:
SELECT title, release_year
FROM films
WHERE language = 'German' AND release_year < 2000;



--2. Update the query to see all German-language films released after 2000:
SELECT title, release_year
FROM films
WHERE language = 'German' AND release_year > 2000;


--3. Select all records for German-language films released after 2000 and before 2010 only with WHERE and AND keywords:
SELECT *
FROM films
WHERE language = 'German' AND (2010 > release_year AND release_year > 2000);


--w/ BETWEEN AND:

SELECT *
FROM films
WHERE language = 'German' AND release_year BETWEEN 2001 AND 2009;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

------------------------------------------
--Exercise (Using OR)
-----------------------------------------
--This time you'll write a query to get the title and release_year of films released in 1990 or 1999, 
--which were in English or Spanish and took in more than $2,000,000 gross. 

--It looks like a lot, but you can build the query up one step at a time to get comfortable with the underlying concept in each step. 
--Let's go!

-----------
--Instructions:

--1. Select the title and release_year for films released in 1990 or 1999 using only WHERE and OR.

--2. Filter the records to only include English or Spanish-language films.

--3. Finally, restrict the query to only return films worth more than $2,000,000 gross.



-----------
--Hints:

--1.   You'll need to specify the field for each year you filter.
--2.   The WHERE clause will have one AND and two ORs, and you'll need to use parentheses.
--3.1. One more AND to go!
--3.2. The dollar symbol and commas should not be included when filtering numerical fields.

SELECT TOP 10 *
FROM films;


----------
--Solutions:

--1. Find the title and year of films from the 1990 or 1999:

SELECT title, release_year
FROM films
WHERE release_year = 1990
	OR release_year = 1999;



--2. Add a filter into code above to see only English or Spanish-language films:

SELECT *
FROM films
WHERE language IN ('English','Spanish')

--to see all fields:




--3. Filter result set above with more than $2,000,000 gross:
SELECT *
FROM films
WHERE gross > 2000000;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Exercise (Using BETWEEN)
-----------------------------------------
--Let's use BETWEEN with AND on the films database to get the title and release_year of all Spanish-language films released 
--between 1990 and 2000 (inclusive) with budgets over $100 million. 

--We have broken the problem into smaller steps so that you can build the query as you go along! 

-----------
--Instructions:

--1. Select the title and release_year of all films released between 1990 and 2000 (inclusive) using BETWEEN.

--2. Build on your previous query to select only films with a budget over $100 million.

--3. Now, restrict the query to only return Spanish-language films.

--4. Finally, amend the query to include all Spanish-language or French-language films with the same criteria.



-----------
--Hints:

--1. When using BETWEEN you can use AND instead of comparison operators.
--2. Remember, you can chain several ANDs together.
--3. "AND theeen?" - Dude, Where's My Car? (2000)
--4. With so many criteria, you'll need to add parentheses around the final filter.





----------
--Solutions:

--1. Select the title and release_year for films released between 1990 and 2000:

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000

--2. Narrow down your query to films with budgets > $100 million:

SELECT title, release_year, budget
FROM films
WHERE release_year BETWEEN 1990 AND 2000 AND budget > 100000000





--3. Restrict the query above to only Spanish-language films:


SELECT title, release_year, budget
FROM films
WHERE release_year BETWEEN 1990 AND 2000 
	AND budget > 100000000
	AND language = 'Spanish';


--4. Amend the query to include Spanish or French-language films:
SELECT title, release_year, budget
FROM films
WHERE release_year BETWEEN 1990 AND 2000 
	AND budget > 100000000
	AND (language = 'Spanish' OR language = 'French');


------------------------------------------
--Filtering Text
------------------------------------------
------------------------------------------
--Exercise (LIKE and NOT LIKE)
-----------------------------------------
--The LIKE and NOT LIKE operators can be used to find records that either match or do not match a specified pattern, respectively. 
--They can be coupled with the wildcards % and _. 
--The % will match zero or many characters, and _ will match a single character.

--This is useful when you want to filter text, but not to an exact word.

--Do the following exercises to gain some practice with these keywords.

-----------
--Instructions:

--1. Select the names of all people whose names begin with 'B'.

--2. Select the names of people whose names have 'r' as the second letter.

--3. Select the names of people whose names don't start with 'A'.



-----------
--Hints:

--1. The wildcard you'll need is % as it matches zero, one, or many characters in the text.
--2. You'll need to combine both the % and _ wildcards here.
--2.   You'll need to use the > operator here.
--3.   * is a shortcut for selecting all fields.





----------
--Solutions:
SELECT TOP 10 *
FROM people;
--1. Select the names that start with B: 
SELECT name
FROM people
WHERE name LIKE 'B%';


--2. Select the names that have r as the second letter:
SELECT name
FROM people
WHERE name LIKE '_r%'


--3. Select names that don't start with A:

SELECT name
FROM people
WHERE name NOT LIKE 'A%'



--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
------------------------------------------
--Exercise (WHERE IN)
-----------------------------------------
--You now know you can query multiple conditions using the IN operator and a set of parentheses. 
--It is a valuable piece of code that helps us keep our queries clean and concise. 

--Try using the IN operator yourself! 

-----------
--Instructions:

--1. Select the title and release_year of all films released in 1990 or 2000 that were longer than two hours.

--2. Select the title and language of all films in English, Spanish, or French using IN.

--3. Select the title, certification and language of all films certified NC-17 or R that are in English, Italian, or Greek.



-----------
--Hints:

--1.1. duration is in minutes!
--1.2. The filter for the years should be written using IN.
--2.   When filtering text or a string using IN, you need to put the values in single quotes and also parentheses.
--3.   You can chain multiple IN criteria using AND.

SELECT TOP 10 *
FROM films;


----------
--Solutions:



--1. Find the title and release_year for all films over two hours in length released in 1990 or 2000:
SELECT title, release_year, duration
FROM films
WHERE duration > 120
	AND release_year IN (1990, 2000);
--w/ IN:


--2. Find the title and language of all films in English, Spanish, and French:
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish','French');

--3. Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek:
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
	AND language IN ('English','Italian','Greek');

	--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
------------------------------------------
--Exercise (Combining filtering and selecting)
-----------------------------------------
--Time for a little challenge. 
--So far, your SQL vocabulary up to now includes COUNT(), DISTINCT, LIMIT, WHERE, OR, AND, BETWEEN, LIKE, NOT LIKE, and IN. 
--In this exercise, you will try to use some of these together. 
--Writing more complex queries will be standard for you as you become a qualified SQL programmer.

--As this query will be a little more complicated than what you've seen so far, 
--We've included a bit of code to get you started. 
--You will be using DISTINCT here too because, surprise, there are two movies named 'Hamlet' in this dataset! 

--Follow the instructions to find out what 90's films we have in our dataset that would be suitable for English-speaking teens.



-----------
--Instructions:

--1. Count the unique titles from the films database and use the alias provided.

--2. Filter to include only movies with a release_year from 1990 to 1999, inclusive.

--3. Add another filter narrowing your query down to English-language films.

--4. Add a final filter to select only films with 'G', 'PG', 'PG-13' certifications.



-----------
--Hints:

--1. The syntax for counting unique values is COUNT(DISTINCT field_name).
--2. Use BETWEEN for an inclusive filter.
--4. Use IN followed by the set of criteria enclosed in parentheses when applying the certification filter.


----------
--Solutions:

--1. Count the unique titles as nineties_english_films_for_teens:
SELECT 
	COUNT (DISTINCT title) AS nineties_english_films_for_teens
FROM films;

--2. Filter the query above to release_years to between 1990 and 1999:

SELECT 
	COUNT (DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999;


--3. Filter the query above to English-language films: 

SELECT
	COUNT (DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English';

--4. Narrow it down to G, PG, and PG-13 certifications:

SELECT 
	COUNT (DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English'
	AND certification IN ('G','PG','PG-13');


SELECT
	COUNT (DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English'
	AND (certification = 'G' OR certification = 'PG'OR certification = 'PG-13');


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
------------------------------------------
--Exercise (Practice with NULLs)
-----------------------------------------
--Now that you know what NULL means and what it's used for, it's time for some more practice! 

--Let's explore the films table again to better understand what data you have. 




-----------
--Instructions:

--1. Select the title of every film that doesn't have a budget associated with it and use the alias no_budget_info.

--2. Count the number of films with a language associated with them and use the alias count_language_known.



-----------
--Hints:

--1. No associated budget means that value IS NULL.
--2. If the films have a language, then the value is not missing, so it IS NOT NULL.


----------
--Solutions:

--1. List all film titles with missing budgets as no_budget_info:


SELECT title, budget AS no_budget_info
FROM films
WHERE budget IS NULL;

--2. Count the number of films we have language data for as count_language_known:
SELECT COUNT(*) AS count_language_known
FROM films
WHERE language IS NOT NULL;

-- ALTERNATIVELY
SELECT COUNT(language) AS count_language_known
FROM films
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

------------------------------------------
--AGGREGATE FUNCTIONS
------------------------------------------
------------------------------------------
--Summarizing Data
------------------------------------------
------------------------------------------
--Exercise (Practice with aggregate functions)
-----------------------------------------
--Now let's try extracting summary information from a table using these new aggregate functions. 
--Summarizing is helpful in real life when extracting top-line details from your dataset. 
--Perhaps you'd like to know how old the oldest film in the films table is, what the most expensive film is, or how many films you have listed. 

--Now it's your turn to get more insights about the films table!

-----------
--Instructions:

--1. Use the SUM() function to calculate the total duration of all films and alias with total_duration.

--2. Calculate the average duration of all films and alias with average_duration.

--3. Find the most recent release_year in the films table, aliasing as latest_year.

--4. Find the duration of the shortest film and use the alias shortest_film.



-----------
--Hints:

--1. First, SUM() the duration field, then create the alias.
--2. You'll need to select AVG(duration) and use the alias in the instructions.
--3. MAX(release_year) will give you the most recent release year.
--4. MIN() can also mean shortest!


----------
--Solutions:
SELECT TOP 10 *
FROM films;


--1. Query the sum of film durations as total_duration:

SELECT SUM(duration) AS total_duration
FROM films;

--2. Calculate the average duration of all films as average_duration:

SELECT AVG(duration) AS average_duration
FROM films;

--3. Find the latest release_year as latest_year:

SELECT MAX(release_year) AS latest_year
FROM films;



--4. Find the duration of the shortest film as shortest_film:

SELECT MIN(duration) AS shortest_film
FROM films;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Summarizing Subsets
------------------------------------------
------------------------------------------
--Exercise (Combining aggregate functions with WHERE)
-----------------------------------------
--When combining aggregate functions with WHERE, 
--you get a powerful tool that allows you to get more granular with your insights, 
--for example, to get the total budget of movies made from the year 2010 onwards. 

--This combination is useful when you only want to summarize a subset of your data. 
--In your film-industry role, as an example, you may like to summarize each certification category to compare how they each perform 
--or if one certification has a higher average budget than another. 

--Let's see what insights you can gain about the financials in the dataset.

-----------
--Instructions:

--1. Use SUM() to calculate the total gross for all films made in the year 2000 or later, and use the alias total_gross.

--2. Calculate the average amount grossed by all films whose titles start with the letter 'A' and alias with avg_gross_A.

--3. Calculate the lowest gross film in 1994 and use the alias lowest_gross.

--4. Calculate the highest gross film between 2000 and 2012, inclusive, and use the alias highest_gross.



-----------
--Hints:

--1.   SUM(gross) will be in the first line of the query next to SELECT.
--2.1. You can filter text by using the LIKE operator and the % wildcard.
--2.2. Strings will need to be enclosed in single quotes.
--3.   The lowest gross will have the MIN() gross.
--4.1. If lowest is MIN(), then highest is MAX().
--4.2. Don't forget to use BETWEEN as we have inclusive search criteria.


----------
--Solutions:

SELECT TOP 10 *
FROM films;

--1. Calculate the sum of gross from the year 2000 or later as total_gross:
SELECT SUM(gross) AS total_gross
FROM films
WHERE release_year >= 2000;


EXEC sp_help films;

ALTER TABLE films
ALTER COLUMN gross BIGINT; 




SELECT TOP 10 *
FROM films;

--Alternatively


--2. Calculate the average gross of films that start with A as avg_gross_A:
SELECT AVG(gross) AS avg_gross_A
FROM films 
WHERE title LIKE 'A%';

--3. Calculate the lowest gross film in 1994 as lowest_gross:
SELECT MIN(gross) AS lowest_gross
FROM films
WHERE release_year = 1994;

--4. Calculate the highest gross film released between 2000-2012 (inclusive)  as highest_gross:
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Exercise (Using ROUND())
-----------------------------------------
--Aggregate functions work great with numerical values; 
--however, these results can sometimes get unwieldy when dealing with long decimal values. 
--Luckily, SQL provides you with the ROUND() function to tame these long decimals.


--If asked to give the average budget of your films, 
--ten decimal places is not necessary. 
--Instead, you can round to two decimal places to create results that make more sense for currency.


-----------
--Instructions:

--1. Calculate the average facebook_likes to one decimal place and assign to the alias, avg_facebook_likes.



-----------
--Hints:

--1.1.   Start by writing a query that only gets the AVG() of the field.
--1.2.   The ROUND() function should be wrapped around AVG(), and don't forget to include the second argument.

----------
--Solutions:


--1. Round the average number of facebook_likes to one decimal place as avg_facebook_likes:


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Exercise (ROUND() with a negative parameter)
-----------------------------------------
--A useful thing you can do with ROUND() is have a negative number as the decimal place parameter. 
--This can come in handy if your manager only needs to know the average number of facebook_likes to the hundreds 
--since granularity below one hundred likes won't impact decision making.


--Social media plays a significant role in determining success. 
--If a movie trailer is posted and barely gets any likes, 
--the movie itself may not be successful. 
--Remember how 2020's "Sonic the Hedgehog" movie got a revamp after the public saw the trailer?

--Let's apply this to other parts of the dataset and see what the benchmark is for movie budgets so, in the future, 
--it's clear whether the film is above or below budget.


-----------
--Instructions:

--1. Calculate the average budget from the films table, aliased as avg_budget_thousands, and round to the nearest thousand.



-----------
--Hints:

--1.1.   First, calculate the AVG(budget).
--1.2.   Then round to the nearest thousands; that'll mean an argument of -3.
--1.3.   Don't forget to alias!

----------
--Solutions:



--1. Calculate the average budget rounded to the thousands as avg_budget_thousands:
SELECT ROUND(AVG(budget), 3
FROM films


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--Exercise (Aliasing with functions)
-----------------------------------------
--Aliasing can be a lifesaver, especially as we start to do more complex SQL queries with multiple criteria. 
--Aliases help you keep your code clean and readable. 
--For example, if you want to find the MAX() value of several fields without aliasing, 
--you'll end up with the result with several columns called max and no idea which is which. 
--You can fix this with aliasing.

--Now, it's over to you to clean up the following queries.

-----------
--Instructions:

--1. Select the title and duration in hours for all films and alias as duration_hours; since the current durations are in minutes, you'll need to divide duration by 60.0.

--2. Calculate the percentage of people who are no longer alive and alias the result as percentage_dead.

--3. Find how many decades the films table covers by using MIN() and MAX() and alias as number_of_decades.



-----------
--Hints:

--1.   Divide duration, then alias.
--2. Multiply COUNT(deathdate) by 100.0, then divide by COUNT(*).
--3.1. The first part of your fraction should be enclosed in parentheses.
--3.2. You can get the number of decades by subtracting the MIN(release_year) from the MAX().


----------
--Solutions:
SELECT *
FROM people;

--1. Calculate the title and duration in hours for all films as duration_hours from films:
SELECT title, (duration / 60.0) AS duration_hours
FROM films;

--2. Calculate the percentage of people who are no longer alive as percentage_dead: 
SELECT (COUNT (deathdate) * 100.0 / COUNT (*)) AS percentage_dead
FROM people;

SELECT COUNT (deathdate)
from people;

SELECT COUNT (*)
FROM people;

--3. Find the number of decades in the films table as number_of_decades:
SELECT *
FROM films;

SELECT (MAX(release_year) - MIN(release_year)) / 10 AS number_of_decades
FROM films;


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


------------------------------------------
--SORTING AND GROUPING
------------------------------------------
------------------------------------------
--Sorting Results
------------------------------------------
------------------------------------------
--Exercise (Sorting single fields)
-----------------------------------------
--Now that you understand how ORDER BY works, you'll put it into practice. 
--In this exercise, you'll work on sorting single fields only. 
--This can be helpful to extract quick insights such as the top-grossing or top-scoring film. 

--The following exercises will help you gain further insights into the film database.

-----------
--Instructions:

--1. Select the name of each person in the people table, sorted alphabetically.

--2. Select the title and duration for every film, from longest duration to shortest.



-----------
--Hints:

--1. Alphabetical, or ascending order, is the default, so you won't need to add any additional keywords.
--2. Use DESC to list from longest to shortest duration.


----------
--Solutions:
SELECT TOP 10 *
FROM people;

--1. Select name from people and sort alphabetically:
SELECT name
FROM people
ORDER BY name;



--2. Select the title and duration from longest to shortest film:
SELECT title, duration
FROM films
ORDER BY duration DESC;

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  


------------------------------------------
--Exercise (Sorting multiple fields)
-----------------------------------------
--ORDER BY can also be used to sort on multiple fields. 
--It will sort by the first field specified, then sort by the next, and so on. 
--As an example, you may want to sort the people data by age and keep the names in alphabetical order. 

--Try using ORDER BY to sort multiple columns.

-----------
--Instructions:

--1. Select the release_year, duration, and title of films ordered by their release year and duration, in that order.

--2. Select the certification, release_year, and title from films ordered first by certification 
--(alphabetically) and second by release year, starting with the most recent year.



-----------
--Hints:

--1. You don't have to order all of the fields that have been selected; only list the two you want to sort.
--2. certification is sorted alphabetically by default, but we'll need to add a keyword to release_year.


----------
--Solutions:

--1. Select the release year, duration, and title sorted by release year and duration:
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;

--without NULLS
SELECT release_year, duration, title
FROM films
WHERE release_year IS NOT NULL
ORDER BY release_year, duration;

--2. Select the certification, release year, and title sorted by certification and release year:
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year DESC;


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- Which 
SELECT TOP 1 *, COUNT (DISTINCT language) AS number_of_languages
FROM films
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY number_of_languages DESC;	


------------------------------------------
--Grouping Data
------------------------------------------
------------------------------------------
--Exercise (GROUP BY single fields)
-----------------------------------------
--GROUP BY is a SQL keyword that allows you to group and summarize results with the additional use of aggregate functions. 
--For example, films can be grouped by the certification and language before counting the film titles in each group. 
--This allows you to see how many films had a particular certification and language grouping.

--In the following steps, you'll summarize other groups of films to learn more about the films in your database.

-----------
--Instructions:

--1. Select the release_year and count of films released in each year aliased as film_count.

--2. Select the release_year and average duration aliased as avg_duration of all films, grouped by release_year.



-----------
--Hints:

--1. Use COUNT(*) to count the films released in each year and GROUP BY release_year.
--2. avg_duration is the alias for AVG(duration).


----------
--Solutions:


--1. Find the release_year and film_count of each year as film_count:

SELECT release_year, COUNT (*) AS film_count
FROM films
GROUP BY release_year;

-- with sorting
SELECT release_year, COUNT (*) AS film_count
FROM films
GROUP BY release_year
ORDER BY film_count DESC, release_year;



--2. Find the release_year and average duration of films for each year as avg_duration:

SELECT release_year,
	AVG(duration) AS avg_duration
FROM films
GROUP BY release_year
ORDER BY release_year DESC;


--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  


------------------------------------------
--Exercise (GROUP BY multiple fields)
-----------------------------------------
--GROUP BY becomes more powerful when used across multiple fields or combined with ORDER BY and LIMIT.

--Perhaps you're interested in learning about budget changes throughout the years in individual countries. 
--You'll use grouping in this exercise to look at the maximum budget for each country in each year there is data available.

-----------
--Instructions:

--1. Select the release_year, country, and the maximum budget aliased as max_budget for each year and each country; 
--sort your results by release_year and country.

--2. Select the release_year and average duration aliased as avg_duration of all films, grouped by release_year.



-----------
--Hints:

--1. GROUP BY should be written after FROM and before ORDER BY as max_budget.
--2. avg_duration is the alias for AVG(duration).


----------
--Solutions:


--1. Find the release_year, country, and maximum budget as max_budget, then group and order by release_year and country:
SELECT release_year, country, MAX (budget) AS max_budget
FROM films
WHERE release_year IS NOT NULL
GROUP BY release_year, country
ORDER BY release_year, country;



--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----------------------------------------
--Filtering Grouped Data
------------------------------------------
------------------------------------------
--Exercise (Filter with HAVING)
-----------------------------------------
--Your final keyword is HAVING. 
--It works similarly to WHERE in that it is a filtering clause, with the difference that HAVING filters grouped data. 


--Filtering grouped data can be especially handy when working with a large dataset. 
--When working with thousands or even millions of rows, 
--HAVING will allow you to filter for just the group of data you want, such as films over two hours in length!

--Practice using HAVING to find out which countries (or country) have the most varied film certifications.


-----------
--Instructions:

--1.1. Select country from the films table, and get the distinct count of certification aliased as certification_count.

--1.2. Group the results by country.

--1.3. Filter the unique count of certifications to only results greater than 10.



-----------
--Hints:

--1. You'll want to use HAVING with COUNT(DISTINCT certification) and add a comparison operator.



----------
--Solutions:



--1.1. Select the country and distinct count of certification as certification_count:
--1.2. Group by country:



--1.3. Filter results to countries with more than 10 different certifications:




------------------------------------------
--Exercise (HAVING and sorting)
-----------------------------------------
--Filtering and sorting go hand in hand and gives you greater interpretability by ordering our results. 


--Let's see this magic at work by writing a query showing what countries have the highest average film budgets. 



-----------
--Instructions:

--1.1. Select the country and the average budget as average_budget, rounded to two decimal, from films.

--1.2. Group the results by country.

--1.3. Filter the results to countries with an average budget of more than one billion (1000000000).

--1.4. Sort by descending order of the average_budget.



-----------
--Hints:

--1.1. The syntax for rounding is ROUND(field name, decimal place).
--1.2. You'll need to use AVG(budget) with HAVING.
--1.3. ORDER BY can accept the aliased field name.



----------
--Solutions:



--1.1. Select the country and average_budget from films:
--1.2. Group by country:


FROM books

--1.3. Filter to countries with an average_budget of more than one billion:


--1.4. Order by descending order of the aggregated budget:




--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 



------------------------------------------
--Exercise (All together now)
-----------------------------------------
--It's time to use much of what you've learned in one query! 
--This is good preparation for using SQL in the real world 
--where you'll often be asked to write more complex queries since some of the basic queries can be answered by playing around in spreadsheet applications. 


--In this exercise, 
--you'll write a query that returns the average budget and gross earnings for films each year after 1990 if the average budget is greater than 60 million. 

--This will be a big query, but you can handle it!



-----------
--Instructions:

--1. Select the release_year for each film in the films table, filter for records released after 1990, and group by release_year.

--2. Modify the query to include the average budget aliased as avg_budget and average gross aliased as avg_gross for the results we have so far.

--3. Modify the query once more so that only years with an average budget of greater than 60 million are included.

--4. Finally, order the results from the highest average gross and limit to one.



-----------
--Hints:

--1. Use WHERE and > to filter films released after 1990.
--2. You'll do these calculations using AVG().
--3. This modification will require the HAVING filter that works with aggregate functions.
--4. You can order with avg_gross and will need to reverse the default order.



----------
--Solutions:


--1. Select the release_year for films released after 1990 grouped by year:


--2. Modify the query to also list the average budget and average gross:


--3. Modify the query to see only years with an avg_budget of more than 60 million:


--4. Order the results from highest to lowest average gross and limit to one:



--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx