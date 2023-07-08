Select *
From Data.dbo.diamonds
-----------------------------
Select clarity, price
From Data.dbo.diamonds

Select cut, price
From Data.dbo.diamonds

Select color, price
From Data.dbo.diamonds
-----------------------------------------
Select distinct cut
From Data.dbo.diamonds

Select Distinct color, AVG(Price) as AVGPrice
From Data.dbo.diamonds
where cut = 'Good' 
group by color

Select Distinct color, AVG(Price) as AVGPrice
From Data.dbo.diamonds
where cut = 'Ideal' 
group by color

Select Distinct color, AVG(Price) as AVGPrice
From Data.dbo.diamonds
where cut = 'Fair' 
group by color

Select Distinct color, AVG(Price) as AVGPrice
From Data.dbo.diamonds
where cut = 'Premium' 
group by color

Select Distinct color, AVG(Price) as AVGPrice
From Data.dbo.diamonds
where cut = 'Very Good' 
group by color

