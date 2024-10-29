SELECT * FROM patients

select first_name, last_name ,gender from patients
where gender = 'M'

select first_name,last_name from patients 
where allergies is NULL;

select first_name FROM patients
WHERE first_name LIKE 'C%';

select first_name,last_name from patients
where weight between 100 AND 120;

update patients
SET allergies ='NKA'
where allergies is NULL







select first_name || ' ' || last_name from patients;
select 
  concat(first_name, ' ' ,last_name) 
from patients;



select count(patient_id) from patients
where birth_date like ('2010-%');


select first_name, last_name, MAX(height) 
 from patients;
 
select count(patient_id) from admissions;

select * from admissions
where admission_date = discharge_date;

select patient_id, count(diagnosis) from admissions
where patient_id = 579;


select distinct(city) from patients
where province_id in ('NS');

select first_name,last_name,birth_date from patients
where height > 160 AND weight > 70;

select first_name,last_name,allergies from patients
where allergies is not NULL and city in ('Hamilton');




--- MEDIUM STARTS HERE---- 






















/*
  Start by selecting a question by pressing 'Start' or 'View All Questions'.
  Use the resources and information about the database from the left panel to help.
  Press the run button to execute the query.
  Question is automatically validated every time you execute the query.
  Make your output match the expected output.
 
 
  Keybinds:
    [ctrl + enter]: Execute the SQL
    [ctrl + q]: Auto-format the SQL
*/
