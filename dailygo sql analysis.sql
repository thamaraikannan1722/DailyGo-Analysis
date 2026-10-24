
select * from DailyGo_Data

select COUNT(*) from DailyGo_Data

update DailyGo_Data
set Item_Fat_Content =
case 
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content =  ' REGULAR' then 'Regular'
ELSE Item_Fat_Content
END

select distinct(Item_Fat_Content)
from DailyGo_Data

key performance required
-------------------------

select cast (sum(Total_Sales)/1000000 as decimal (10,2))
as Total_Sales_Millions from DailyGo_Data
where Item_Fat_Content= 'Low Fat'

select cast (sum(Total_Sales)/1000000 as decimal (10,2))
as Total_Sales_Millions from DailyGo_Data
where Outlet_Establishment_Year=2022

select cast (AVG(total_sales)as decimal (10,1))
as Avg_Sales from DailyGo_Data

select cast (AVG(total_sales)as decimal (10,1))
as Avg_Sales from DailyGo_Data
where Outlet_Establishment_Year=2022

select COUNT (*) as No_of_Items from DailyGo_Data

select COUNT (*) as No_of_Items from DailyGo_Data
where Outlet_Establishment_Year=2022

select cast (AVG (rating) as decimal (10,2))
as Avg_Rating from DailyGo_Data

select cast (AVG (rating) as decimal (10,2))
as Avg_Rating from DailyGo_Data
where Outlet_Establishment_Year=2022

select item_fat_content ,
           cast ( sum (total_sales)/1000 as decimal(10,2)) as Total_Sales_Thousand ,
		   cast (AVG(total_sales)as decimal (10,1))as Avg_Sale,
		   COUNT (*) as No_of_Items,
		   cast (AVG (rating) as decimal (10,2))as Avg_Rating
		   from DailyGo_Data 
group by Item_Fat_Content
order by Total_Sales_Thousand desc

select top 5 item_type ,
           cast ( sum (total_sales)as decimal(10,2)) as Total_Sales ,
		   cast (AVG(total_sales)as decimal (10,1))as Avg_Sale,
		   COUNT (*) as No_of_Items,
		   cast (AVG (rating) as decimal (10,2))as Avg_Rating
		   from DailyGo_Data 
group by Item_type     
order by Total_Sales asc

select * from DailyGo_Data

select outlet_location_type , item_fat_content ,
           cast ( sum (total_sales)as decimal(10,2)) as Total_Sales ,
		   cast (AVG (total_sales)as decimal (10,1))as Avg_Sale,
		   COUNT (*) as No_of_Items,
		   cast (AVG (rating) as decimal (10,2))as Avg_Rating
		   from DailyGo_Data 
group by outlet_location_type , item_fat_content
order by Total_Sales asc

select outlet_location_type,
       ISNULL([Low Fat],0) as Low_Fat,
	   ISNULL([Regular],0) as Regular

from(
select outlet_location_type,item_fat_content,
        cast (sum(total_sales) as decimal (10,2))as Total_Sales 
		from DailyGo_Data
group by outlet_location_type,item_fat_content)
as sourcetable 
pivot (
        sum (total_sales) for item_fat_content in ([low fat],[regular])
		) as pivottable 
order by Outlet_Location_Type

select Outlet_Establishment_Year,
        cast (sum(total_sales) as decimal (10,2))as Total_Sales 
		from DailyGo_Data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc

select outlet_establishment_year,
        cast (sum(total_sales) as decimal (10,2))as Total_Sales,
		cast (avg(total_sales) as decimal (10,2))as Avg_Sales,
		count (*)as No_of_Items,
		cast (avg(rating) as decimal (10,2))as Avg_Rating
from DailyGo_Data 
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year desc

select
       outlet_size,
	   cast(sum(total_sales) as decimal(10,2)) as Total_Sales,
	   cast ((sum(total_sales) *100.0/sum (sum(total_sales))over()) as decimal(10,2))as Sales_Percentage
	   from  DailyGo_Data
group by outlet_size
order By total_sales asc

select Outlet_Location_Type,
        cast (sum(total_sales) as decimal (10,2))as Total_Sales,
		cast ((sum(total_sales) *100.0/sum (sum(total_sales))over()) as decimal(10,2))as Sales_Percentage,
		cast (avg(total_sales) as decimal (10,2))as Avg_Sales,
		count (*)as No_of_Items,
		cast (avg(rating) as decimal (10,2))as Avg_Rating
from DailyGo_Data where Outlet_Establishment_Year=2020
group by Outlet_Location_Type
order by Total_Sales asc

select Outlet_Type,
        cast (sum(total_sales) as decimal (10,2))as Total_Sales,
		cast ((sum(total_sales) *100.0/sum (sum(total_sales))over()) as decimal(10,2))as Sales_Percentage,
		cast (avg(total_sales) as decimal (10,2))as Avg_Sales,
		count (*)as No_of_Items,
		cast (avg(rating) as decimal (10,2))as Avg_Rating
from DailyGo_Data 
group by Outlet_Type
order by Total_Sales asc




















