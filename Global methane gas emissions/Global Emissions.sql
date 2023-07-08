Select *
From [dbo].[Methane_final]
--------------------------------------------------
------Data Cleaning---------------------------------
----------------Distinct -----------------------

Select Distinct region
From [dbo].[Methane_final]

Select Distinct country
From [dbo].[Methane_final]

Select Distinct type
From [dbo].[Methane_final]

Select Distinct segment
From [dbo].[Methane_final]

Select Distinct reason
From [dbo].[Methane_final]

Select Distinct baseYear
From [dbo].[Methane_final]

-----------------------------------------------------------
-------Check for NULL---------------------------------------

Select * --No NULL
From [dbo].[Methane_final]
where region is NULL

Select * --No NULL
From [dbo].[Methane_final]
where country is NULL

Select * --No NULL
From [dbo].[Methane_final]
where emissions is NULL

Select * --No NULL
From [dbo].[Methane_final]
where type is NULL

Select * --No NULL
From [dbo].[Methane_final]
where segment is NULL

Select * --No NULL
From [dbo].[Methane_final]
where reason is NULL

Select * --No NULL
From [dbo].[Methane_final]
where baseYear is NULL

-------------------------------------
-----Droping column1 and motes------------- 

ALTER TABLE [dbo].[Methane_final]
DROP COLUMN column1

ALTER TABLE [dbo].[Methane_final]
DROP COLUMN notes

---------------------------------------
-------Checking for Duplicates------------

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER(
	Partition by region,
				 country,
				 emissions,
				 type,
				 segment,
				 reason,
				 baseYear
				 ORDER BY 
					region
					) row_num
From [dbo].[Methane_final]

)

Select *
From RowNumCTE
Where row_num > 1
order by region

-------------------------------------------------
--[1]---------------------------------------

Select region, segment, emissions 
From [dbo].[Methane_final]
where region not like 'World' and segment not like 'Total'

--[2]---------------------------------------------

Select emissions,type
From [dbo].[Methane_final]

--[3]-----------------------------------

Select emissions,segment,reason
From [dbo].[Methane_final]
where segment not like 'Total'
