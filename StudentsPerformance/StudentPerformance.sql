Select *
From StudentPerformance.dbo.StudentsPerformance$
------------------------------------------------------
--[1]------AVGs-------------------------------------

Select AVG([math score]) as AVGMath,AVG([writing score]) as AVGWriting,AVG([reading score])as AVGReading
From StudentPerformance.dbo.StudentsPerformance$

--[2]------Gender Pass/Fall Classes-------------------------------------

Select gender, [math score] ,
CASE When [math score] >= 65 Then 'Pass'
	 When [math score] < 65 Then 'Fail'
	 END as MathExams	 
From StudentPerformance.dbo.StudentsPerformance$

Select gender, [reading score] ,
CASE When [reading score] >= 65 Then 'Pass'
	 When [reading score] < 65 Then 'Fail'
	 END as ReadingExams	 
From StudentPerformance.dbo.StudentsPerformance$

Select gender, [writing score] ,
CASE When [writing score] >= 65 Then 'Pass'
	 When [writing score] < 65 Then 'Fail'
	 END as WritingExams	 
From StudentPerformance.dbo.StudentsPerformance$

---------------------------------------------------------------
--[3]------Pass per parental lvl education-----------------------

Select  Distinct [parental level of education],
		SUM(CASE When [math score] >= 65 Then 1
		Else 0
		END) as MathPassed,
		SUM(CASE When [reading score] >= 65 Then 1
		Else 0
		END) as ReadingPassed,
		SUM(CASE When [writing score] >= 65 Then 1
		Else 0
		END) as WritingPassed
From StudentPerformance.dbo.StudentsPerformance$
group by [parental level of education] 

---------------------------------------------------------------------------------------------
--[4]----test preparation course seccess----------------------------------------------------

Select [test preparation course], 
		SUM(CASE When [math score] >= 65 
		         and [reading score] >= 65 
				 and [writing score] >= 65 then 1
				 END) as Success,
		((SUM(convert(float,CASE When [math score] >= 65 
		         and [reading score] >= 65 
				 and [writing score] >= 65 then 1
				 END)))/Count(*))*100 as percentageSuccess
From StudentPerformance.dbo.StudentsPerformance$
group by [test preparation course]
order by 1

----------------------------------------------------------------------------------------------------