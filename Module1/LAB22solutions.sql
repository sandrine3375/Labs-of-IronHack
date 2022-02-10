use publications;

-- sales : title_id; qty
-- titleauthor: au_id; title_id
-- titles: titles_id; advance; royalty

-- 1. Calculate the royalty of each sale for each author 
-- and the advance for each author and publication.

-- Step1 
select titleauthor.au_id, titles.title_id, (titles.advance * titleauthor.royaltyper/100) as total_advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty from titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN sales ON titles.title_id = sales.title_id
group by titleauthor.au_id  ;

-- step2
select new_table.au_id, new_table.title_id, 
SUM(sales_royalty)  
from  (select titleauthor.au_id, titles.title_id, (titles.advance * titleauthor.royaltyper/100) as total_advance, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty from titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN sales ON titles.title_id = sales.title_id group by titleauthor.au_id) as new_table 
group by new_table.title_id ;

-- step3
select new_table.au_id, new_table.title_id, 
(SUM(sales_royalty)+ SUM(total_advance)) as profit  
from  (select titleauthor.au_id, titles.title_id, (titles.advance * titleauthor.royaltyper/100) as total_advance, (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty from titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN sales ON titles.title_id = sales.title_id group by titleauthor.au_id) as new_table 
group by new_table.title_id
order by profit desc
limit 3 ;

-- Challenge 2
-- step1
CREATE TEMPORARY TABLE new_table2
select titleauthor.au_id, titles.title_id, (titles.advance * titleauthor.royaltyper/100) as total_advance, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty from titles
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN sales ON titles.title_id = sales.title_id
group by titleauthor.au_id  ;

-- step2
select new_table2.au_id, new_table2.title_id, 
SUM(sales_royalty)  
from  new_table2 
group by new_table2.title_id ;

-- step3
select new_table2.au_id, new_table2.title_id, 
(SUM(sales_royalty)+ SUM(total_advance)) as profit  
from  new_table2
group by new_table2.title_id
order by profit desc
limit 3 ;