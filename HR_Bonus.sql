-- Sergio Zapico 09/11/2023

--Create a Join Table 
Select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;

---Find the healthiest employees for the bonus
Select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index <25 and 
absenteeism_time_in_hours < (Select Avg(absenteeism_time_in_hours) from Absenteeism_at_work)

---Compensation rate increase for non-smokers/ budget $983,221 so .68 increase per hour/ $1,414.4 per year
Select Count(*) as NonSmokers from Absenteeism_at_work
Where Social_smoker=0

--Optimize this query
Select  
a.id,
r.reason,
month_of_absence,
Body_mass_index,
Case When Body_mass_index <18.5 then 'Underweight'
When Body_mass_index between 18.5 and 25 then 'Healthy Weight'
When Body_mass_index between 25 and 30 then 'Overweight'
When Body_mass_index >30 then 'Obese'
Else 'Unknown' end as BMI_Category, 
Case When Month_of_absence IN (12,1,2) Then 'Winter'
When Month_of_absence IN (3,4,5) Then 'Spring'
When Month_of_absence IN (6,7,8) Then 'Summer'
When Month_of_absence IN (9,10,11) Then 'Fall'
Else 'Unknown' End as Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;
