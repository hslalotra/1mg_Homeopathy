CREATE DATABASE project_1mg;

USE project_1mg


SELECT * from table1;
SELECT * from table2b;

SELECT A.Name,A.Rating,A.Num_rating,B.benefit_area FROM table2_rating as A
INNER JOIN table2_benefit as B
ON A.Name = B.Name


--Number of medicine available of different benefit area

select Benefit_area,count(Name) As num_of_medicine
from table2b
Group by Benefit_area;


--Price range of medicine for each benefit area.

select B.Benefit_area,Avg(A.price) Avg_price,Min(A.price)Min_price,Max(A.price)Max_price
from Table1 A
INNER JOIN Table2b B
ON A.Name=B.Name
group by B.Benefit_area;

--Brand specialization(Key Benefits) of each area.

select Brand_name,Benefit_area
from Table2b
group by Brand_name,Benefit_area;

--Average price, min price , max price and number of products for each brand.

select B.Brand_Name,Avg(A.price) Avg_price,Min(A.price)Min_price,Max(A.price)Max_price
from Table1 A
INNER JOIN Table2b B
ON A.Name=B.Name
group by B.Brand_Name;

--Average number of rating for each brand in their specialization products where  the number of rating is not NULL.

select Brand_Name,Benefit_area,Avg(Num_rating) Avg_no_rating
from table2b
where Rating>0
group by Benefit_area,Brand_Name
order by Avg_no_rating DESC;

--Which brand has most greater than 4 point review medicine?

select TOP 1 Brand_Name,count(Rating)No_Rating from table2b
where Rating>4
group by Brand_Name
order by No_Rating DESC;

