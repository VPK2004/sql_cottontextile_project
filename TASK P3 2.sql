
use p3;

#Query to Get Patients Treated by a Specific Doctor Along with the Total Amount Spent#
select*from patient;
select*from doctor;

alter table doctor rename column last_name to last_names;
select concat(first_name,' ',last_name) as patient_name,
concat(first_names,' ',last_names) as doctor_name,doctor.specialization,doctor.consultation_fee from 
patient join doctor on doctor.pat_id=patient.p_id where p_id=103;

#Query to Get Doctors with More Than 10 Appointments in a Month#
select*from appointment;
select*from doctor;

select d.doc_id,concat(first_names,' ',last_names) as doctor_name,count(a.ap_id) as appointment
from doctor d join appointment a on a.docu_id=d.doc_id where doc_id=201;

#Query to Calculate Total Room Charges for Patients Currently Admitted#
select*from rooms;

select r.room_type,r.room_status,sum(room_charge_perday) as Total_Charge
from rooms as r join patient on r.pat_id=patient.p_id where r.room_status="occupied" group by 
r.room_type,r.room_status having sum(room_charge_perday);

#Query to List Patients with Multiple Diagnoses#
select*from patient;
select*from doctor;

select concat(first_name,' ',last_name) as Patients_Name,
concat(first_names,' ',last_names) as Doctor_Name,d.Specialization from patient p join 
doctor d on d.pat_id=p.p_id where specialization='Cardiologist';

#Query to Find the Doctor Who Generated the Highest Revenue from Consultations#
select*from doctor;

select concat(first_names,' ',last_names) as Doctor_Name,sum(Consultation_Fee) from doctor
 group by  doctor_name having max(Consultation_Fee) order by sum(Consultation_Fee) desc; 
 
 select max(Consultation_Fee) from doctor order by Consultation_Fee;
 
 # Query to List All Patients Who Were Admitted to ICU for More Than 7 Days#
 select*from patient;
 select concat(first_name,last_name) as Patient_Name,p.dob,p.gender,p.phone_no,p.admission_date,p.ward from patient p
 group by Patient_Name,p.dob,p.gender,p.phone_no,p.admission_date,p.ward having ward="ICU";
 
 #Query to Get Average Length of Stay for Each Room Type#
 select*from rooms;
 select r.room_type,avg(datediff(admission_date,discharge_date)) from patient p join rooms r on r.pat_id=p.p_id group by r.room_type having 
 avg(datediff(p.admission_date,p.discharge_date));