use publications;
select * from authors;
select * from publishers;
select * from employee;
select * from titles;
select * from titleauthor;
#CHALLENGE 1

CREATE TEMPORARY TABLE new_tb1
SELECT authors.au_id,
authors.au_lname,
authors.au_fname,
titleauthor.title_id
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id=authors.au_id;

SELECT *
FROM new_tb1;

CREATE TEMPORARY TABLE new_tb2
SELECT new_tb1.au_id,
new_tb1.au_lname,
new_tb1.au_fname,
titles.title,
titles.pub_id
FROM new_tb1
INNER JOIN titles ON titles.title_id=new_tb1.title_id;

SELECT *
FROM new_tb2;


CREATE TEMPORARY TABLE new_tb3
SELECT new_tb2.au_id,
new_tb2.au_lname,
new_tb2.au_fname,
new_tb2.title,
publishers.pub_name
FROM new_tb2
INNER JOIN publishers ON publishers.pub_id=new_tb2.pub_id;

SELECT *
FROM new_tb3;

#CHALLENGE 2

SELECT new_tb3.au_id,new_tb3.pub_name,count(new_tb3.title) as COUNT
FROM new_tb3
GROUP BY new_tb3.au_id,new_tb3.pub_name;

#CHALLENGE 3

CREATE TEMPORARY TABLE new_tb4
SELECT authors.au_id,authors.au_lname,authors.au_fname,titleauthor.title_id
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id;

SELECT *
FROM new_tb4;

SELECT new_tb4.au_id,new_tb4.au_lname,new_tb4.au_fname,SUM(sales.qty)
FROM new_tb4
INNER JOIN sales ON new_tb4.title_id=sales.title_id
GROUP BY new_tb4.au_id,new_tb4.au_lname,new_tb4.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;

#Challenge 4
CREATE TEMPORARY TABLE new_tb5
SELECT new_tb4.au_id,new_tb4.au_lname,new_tb4.au_fname,SUM(sales.qty) AS TOTAL
FROM new_tb4
LEFT JOIN sales ON sales.title_id=new_tb4.title_id
GROUP BY new_tb4.au_id,new_tb4.au_lname,new_tb4.au_fname
ORDER BY TOTAL DESC;

UPDATE new_tb5
SET new_tb5.TOTAL= '0'
WHERE new_tb5.TOTAL is NULL;

SELECT *
FROM new_tb5