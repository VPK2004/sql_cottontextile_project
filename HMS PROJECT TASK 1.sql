use p3;
select* from patient;
select*from doctor;
select*from appointment;
select*from medicine_report;
select*from rooms;
select*from billing;

#Task 1 Get all patients currently admitted #
select p_id,first_name,last_name,dob,gender,admission_date from patient where admission_date="2024-10-01";
set foreign_key_checks=1;

#Task 2 List all appointment details for specific doctor#
select Ap_id,p_id,doc_id,a_date,a_time,doctor.doc_id,doctor.first_name,
doctor.last_name,doctor.specialization from appointment inner join doctor
on appointment.docu_id=doctor.doc_id;

#Task 3 Update the room status after a patient is discharged#
select*from rooms;
update rooms set room_status="discharged" where room_status="available"; 

#4 Get a summary of billing for a specific patient#

select * from billing where p_id=102;

select billing.bill_id,billing.total_amount,patient.first_name,patient.last_name,
patient.address,patient.phone_no,billing.pay_status
from billing join patient on billing.pa_id=patient.p_id where p_id=102;

alter table billing rename column p_id to pa_id;

#Task 4 List patients and their assigned doctors#
#doctor ooda name doctor_name nu varanum#
#patient ooda name pat_name nu varanum#
#first and last name ooda varanum#

select*from patient;
select*from doctor;


select p_id,concat(first_name,last_name) as Patient_Name,
doc_id,concat(first_names,last_names) as doctor_name from doctor left 
join patient on patient.p_id=doctor.pat_id;

SELECT 
    CONCAT(pat.first_name, pat.last_name) AS patient_name,
    pat.p_id,
    doc.doc_id,
    CONCAT(doc.first_name, doc.last_name) AS doctor_name
FROM 
    doctor as doc
LEFT JOIN 
    patient as pat ON doc.pat_id = pat.p_id;
    
update patient set first_name="Michael",last_name="Marsh" where p_id=107;  
alter table doctor rename column first_names to first_name;


#Task 6 Query to get doctors with more than 10 appointments in a month#
select*from doctor;
select*from appointment;

select*from appointment where docu_id>(select doc_id from doctor where first_name="John");

select doctor.first_name,appointment.Ap_id 
from doctor left join appointment
on doctor.doc_id=appointment.docu_id 
where doctor.first_name="john";

select*from doctor where first_name="john";


#Task 7 Get the total number of appointments for each doctor#
select docu_id,count(ap_id) as Appointment from appointment group by docu_id;

#Task 8 Find patients who have unpaid bills#
select*from billing;
select*from patient;

select patient.p_id,patient.first_name,billing.bill_id,billing.total_amount
from patient left join billing on billing.pa_id=patient.p_id where pay_status="unpaid";

#Task 9 Find the details of patients who have an appointment scheduled after a specific date (e.g., '2024-10-01')#
select*from appointment;
select patient.p_id,patient.first_name,appointment.a_time
from patient join appointment on appointment.p_id=patient.p_id where a_date="2024-10-04";
desc patient;
desc appointment;

#Task 10 Update the address of a patient (e.g., patient_id = 107)#
update patient set address="Berlin" where p_id=102;

#Task 11 Delete a billing record where the payment status is 'Paid' (e.g., billing_id = 501)#
delete from billing where bill_id=501;

#Task 12 Query to List All Patients Who Were Admitted to ICU for More Than 7 Days#
select first_name,max(ward) as Ward from patient group by first_name
having ward="ICU" ; 

SELECT roomtype.roomtype,AVG(DATEDIFF(patient.discharge_date, patient.admission_date)) AS AvgLengthOfStay 
FROM patient JOIN roomtype ON roomtype.p_id = patient.p_id WHERE 
patient.discharge_Date="2024-03-27" IS NOT NULL GROUP BY roomtype.roomtype;

select*from doctor;
alter table patient add column Ward varchar(100);
update patient set ward="Acute care" where p_id=106;

select*from patient;
select*from doctor;
select*from billing;

# Task 13 Query to Get Patients Treated by a Specific Doctor Along with the Total Amount Spent#
select 
	patient.p_id,CONCAT(patient.first_name, ' ',patient.last_name) as Patient_name,
	CONCAT(doctor.first_name, ' ',doctor.last_name) as Doctor_name,billing.total_amount from 
	patient,doctor,billing where p_id=108;


# Task 14 Query to Calculate Total Room Charges for Patients Currently Admitted #
select*from rooms;
select*from patient;

select patient.first_name,rooms.room_charge_perday as
Room_Charge from rooms left join patient on rooms.pat_id=patient.p_id 
where p_id=107 and room_status="Occupied";

alter table rooms rename column p_id to pat_id; 


#Task 15 Query to List Patients with Multiple Diagnoses#
select*from patient;
select*from doctor;

select patient.p_id,patient.first_name as patient_name,doctor.specialization 
from patient left join doctor on doctor.pat_id=patient.p_id where 
specialization="Cardiologist"; 


#Task 16 Query to Find the Doctor Who Generated the Highest Revenue from Consultations#
select first_name,max(consultation_fee) as Highest from doctor 
group by first_name order by max(consultation_fee) desc; 


#Task 17 Query to Get Average Length of Stay for Each Room Type#
select*from roomtype;
SELECT 
    r.room_type,
    AVG(DATEDIFF(p.discharge_date, p.admission_date)) AS AvgLengthOfStay
FROM 
    Patient as p
JOIN 
    Rooms as r ON p.p_id = r.pat_id
WHERE 
    p.discharge_date IS NOT NULL
GROUP BY 
    r.room_type; 

alter table roomtype rename column roomtype to roomtypes;

#Task 18 Query to Calculate Total Revenue for the Hospital in a Given Time Period#
select*from billing;

SELECT 
    SUM(b.Total_Amount) AS TotalRevenue
FROM 
    Billing b
WHERE 
    b.Pay_Date BETWEEN '2024-09-15' AND '2024-09-25';


#Task 19 Query to Find the Most Common Diagnosis in the Hospital#
select patient.p_id,concat(patient.first_name,' ',patient.last_name)as patient_name,doctor.doc_id,
concat(doctor.first_name,' ',doctor.last_name) as doctor_name,doctor.specialization from patient join 
doctor on doctor.pat_id=patient.p_id where specialization="Cardiologist";


#Task 20 Query to List Patients Who Haven't Paid Their Bills#
select*from billing;

select*from billing where pay_status="Unpaid" order by bill_id asc;
