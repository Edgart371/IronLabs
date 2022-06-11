use publications;
select * from authors;
select * from publishers;
select * from employee;
select * from titles;
select * from titleauthor;
select * from sales;

#CHALLENGE 1

SELECT au_id,SUM(TOTAL) AS Soma
FROM
(SELECT au_id, (sales_total+Advance_total) AS Total
FROM (SELECT title_id,au_id,SUM(sales_royalty) AS sales_total, SUM(Advance) AS Advance_total
FROM (SELECT titles.title_id,titleauthor.au_id,(titles.advance * titleauthor.royaltyper / 100) AS Advance,
(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
FROM titles
JOIN sales
ON titles.title_id=sales.title_id
JOIN titleauthor
ON titles.title_id=titleauthor.title_id) nombre_query
GROUP BY titles.title_id,titleauthor.au_id) sub_query) sub_sub_query
GROUP BY au_id
ORDER BY Soma DESC
LIMIT 3;

#CHALLENGE 2
CREATE TEMPORARY TABLE uma
SELECT titles.title_id,titleauthor.au_id,(titles.advance * titleauthor.royaltyper / 100) AS Advance
FROM titles
JOIN sales
ON titles.title_id=sales.title_id
JOIN titleauthor
ON titles.title_id=titleauthor.title_id
GROUP BY title_id,au_id;

CREATE TEMPORARY TABLE duas
SELECT titles.title_id,(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) 
AS sales_royalty
FROM titles
JOIN sales
ON titles.title_id=sales.title_id
JOIN titleauthor
ON titles.title_id=titleauthor.title_id;

CREATE TEMPORARY TABLE tres
SELECT uma.au_id,(uma.Advance+duas.sales_royalty) AS Total
FROM  uma
JOIN duas
ON uma.title_id=duas.title_id;

CREATE TEMPORARY TABLE final
SELECT tres.au_id,SUM(Total) AS suma
FROM tres
GROUP BY tres.au_id
ORDER BY suma DESC
LIMIT 3;

#CHALLENGE 3

CREATE TABLE permanent
SELECT * FROM final

