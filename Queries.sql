-- TOTAL COST PER DEPARTMENT
create view Cost_per_dept as
select d.Department_name, sum(v.cost) as total_cost
from Department d
join Doctors doc on d.DepartmentID=doc.DepartmentID
join Visits v on doc.doctor_id=v.doctor_id
group by Department_name;
select*from Cost_per_dept;

-- TOP EARNING DEPARTMENT
select d.Department_name,sum(v.cost) as total_cost
from Department d
join Doctors doc on d.DepartmentID=doc.DepartmentID
join Visits v on doc.doctor_id=v.doctor_id
group by Department_name
order by total_cost desc
limit 3;

-- NUMBER OF PATIENT PER DEPARTMENT
create view No_of_patient as
select d.Department_name,count(distinct v.patient_id) as total_patients
from Department d
join Doctors doc on d.DepartmentID= doc.DepartmentID
JOIN Visits v on doc.doctor_id=v.doctor_id
group by Department_name;
select * from No_of_patient;

-- DOCTOR WITH HIGH PATIENT COUNT
select doc.First_name, doc.Last_name, count(v.doctor_id) as total_visits
from Doctors doc
join Visits v on doc.doctor_id=v.doctor_id
group by doc.doctor_id
order by total_visits desc;

-- FREQUENTLY PRESCRIBED MEDICINE
select drug_name, count(*) as times_prescribed
from Medications
group by drug_name
order by times_prescribed desc;

-- PATIENT VISIT HISTORY
select p.First_name,p.last_name, v.admission_date, v.discharge_date,v.cost,doc.First_name,doc.Last_name
from Patients p
join Visits v on p.patient_id=v.patient_id
join Doctors doc on v.doctor_id=doc.doctor_id;

-- DOCTORS WITH HIGH REVENUE
Select doc.doctor_id,concat(doc.First_name,' ',doc.Last_name) as Doctors_name,count(visit_id) as Doctors_visits,sum(cost)as total
from Visits v
join Doctors doc on doc.doctor_id=v.doctor_id
group by doc.doctor_id
order by total desc;
select*from visitors;

-- Top 3 prescribed drugs
select drug_name,count(*)
from Medications
group by drug_name
order by count(*) desc
limit 3;

-- MOST FREQUENT DIAGNOSIS
Select v.diagnosis, count(v.diagnosis) as Number_of_diagnosis
from Visits v
group by v.diagnosis
order by Number_of_diagnosis desc
limit 1;