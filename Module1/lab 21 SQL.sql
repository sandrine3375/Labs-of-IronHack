
-- Authors: au_id, au_lname, au_fname,
-- titleauthor: au_id, title_id
-- titles: title_id, title, pub_id
-- publishers: pub_id, pub_name

Use publications; 
Select * From authors;
Select * From titleauthor;

-- Challenge 1
CREATE temporary Table summary
SELECT authors.au_id, authors.au_lname, authors.au_fname, 
titleauthor.title_id, titles.title, titles.pub_id, publishers.pub_name
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on titles.pub_id=publishers.pub_id
where titles.title_id is not null;

-- challenge 2
select* from summary;
select  au_id, au_lname, pub_name, count(title) as tit
from summary
group by au_id, summary.pub_name 
order by tit desc;

-- challenge 3
-- Authors: au_id, au_lname, au_fname,
-- titleauthor: au_id, title_id
-- titles: title_id, title, pub_id
-- publishers: pub_id, pub_name
-- sales: title_id, qty
select * from sales;
SELECT authors.au_id, authors.au_lname, authors.au_fname, 
titleauthor.title_id, titles.title, titles.pub_id, publishers.pub_name
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on titles.pub_id=publishers.pub_id
where titles.title_id is not null;

-- challenge 2
select* from summary;
SELECT authors.au_id, authors.au_lname, authors.au_fname, 
titleauthor.title_id, titles.title, titles.pub_id, publishers.pub_name
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join titles
on titles.title_id=titleauthor.title_id
left join publishers
on titles.pub_id=publishers.pub_id
where titles.title_id is not null;

-- challenge 2
select* from summary;
-- Authors: au_id, au_lname, au_fname,
-- titleauthor: au_id, title_id
-- sales: title_id, qty

ALTER TABLE sales
MODIFY COLUMN qty numeric;

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, 
sales.qty as total
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join sales
on sales.title_id=titleauthor.title_id
group by last_name
Order by total desc
limit 3;

-- challenge 4
SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, 
IF( sales.qty IS NOT NULL, sales.qty,'0') as total
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join sales
on sales.title_id=titleauthor.title_id
group by last_name
order by total desc;

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, 
coalesce( sales.qty, '0') as total
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join sales
on sales.title_id=titleauthor.title_id
group by last_name
order by total desc;

SELECT authors.au_id, authors.au_lname as last_name, authors.au_fname as first_name, 
IFNULL( sales.qty, '0') as total
FROM authors
left join titleauthor
on titleauthor.au_id=authors.au_id
left join sales
on sales.title_id=titleauthor.title_id
group by last_name
order by total desc;