create database P3;
use P3;
create table p_table(
p_id int primary key auto_increment,
first_name varchar(100) not null,
last_name varchar(100) not null,
dob date,
gender varchar(10)not null,
phone_no decimal(10) not null,
address varchar(100) not null,
bloodgroup varchar(20) not null,
admission_date varchar(10) not null,
discharge_date varchar(100)not null
);
select*from patient;
insert into patient values(201,"John"," Doe","1985-03-15","Male",6231567890,"New York","A+","2024-03-12","2024-03-17");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("Jane"," Smith","1990-07-22","Female",6132567890,"LosAngeles","b+","2024-03-10","2024-03-15");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("Michael","Johnson","1978-09-30","Male",8233567890,"Chicago","a-","2024-03-12","2024-03-19");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("Emily","Davis","2000-05-11","Female",7224567890,"Houston","b-","2024-03-09","2024-03-15");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("Robert","	Brown","1965-12-02","Male",7224567876,"Phoenix","ab+","2024-03-18","2024-03-23");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("Linda","Williams","1982-11-19","Female",6382414512,"pairs","b-","2024-03-22","2024-03-28");
insert into patient(first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date) values("William","Jones","1973-06-25","Male",8765432901,"San Diego","a+","2024-03-10","2024-03-29");
alter table patient modify column phone_no decimal(10);
select*from patient;
insert into patient (first_name,last_name,dob,gender,phone_no,address,bloodgroup,admission_date,discharge_date)values("William","Jones","1973-06-25","Male",8765432901,"San Diego","a+","2024-03-10","2024-03-29");

update patient set admission_date="2024-10-01" where p_id=208;
alter table patient add column room_id int;
update patient set room_id=301 where p_id=101;
update patient set room_id=302 where p_id=102;
update patient set room_id=303 where p_id=103;
update patient set room_id=304 where p_id=104;
update patient set room_id=305 where p_id=105;
update patient set room_id=306 where p_id=106;
update patient set room_id=307 where p_id=107;
update patient set room_id=308 where p_id=108;
-------------------------------------------------------

create table doc_table(
doc_id int primary key,
first_name varchar(100) not null,
last_name varchar(100) not null,
specialization varchar(100)not null,
phone_number decimal(10) not null,
Email varchar(100) not null,
Consultation_Fee decimal(10,2)
);
insert into doc_table values
(101, 'John', 'Doe', 'Cardiologist', '5552341234', 'jdoe@hospital.com', 5100.00),
(102, 'Jane', 'Smith', 'Neurologist', '5555672345', 'jsmith@hospital.com',65000.00),
(103, 'Robert', 'Brown', 'Orthopedic Surgeon', '5550987345', 'rbrown@hospital.com', 78000.00),
(104, 'Emily', 'Davis', 'Pediatrician', '5551234567', 'edavis@hospital.com', 55000.00),
(105, 'Michael', 'Johnson', 'Dermatologist', '5553215678', 'mjohnson@hospital.com', 57000.00),
(106, 'Sarah', 'Wilson', 'Oncologist', '5556546789', 'swilson@hospital.com', 43000.00),
(107, 'David', 'Martinez', 'General Surgeon', '5558767890', 'dmartinez@hospital.com', 36500.00),
(108, 'Laura', 'Anderson', 'Anesthesiologist', '5550988901', 'landerson@hospital.com', 56789.00),
(109, 'Chris', 'Taylor', 'Urologist', '5557659012', 'ctaylor@hospital.com', 125000.00);
select*from doc_table;

-----------------------------------------------------------------------------------
create table appointment(
Ap_id int primary key not null auto_increment,
p_id int not null,
doc_id int not null,
a_date date,
a_time time,
status varchar(100)
);
select*from appointment;
insert into appointment values (1,101,201,"2024-10-01","09:00:00","Completed");
insert into appointment values
(2,102,202,"2024-10-01","11:00:00","Cancelled"),
(3,103,201	,"2024-10-02","10:30:00","scheduled"),
(4,104,203,"2024-10-02","01:00:00","Completed"),
(5,105,204,"2024-10-03","03:00:00","completed"),
(6,106,205,"2024-10-03","09:30:00","scheduled"),
(7,107,202,"2024-10-04","02:00:00","Complete"),
(8,108,201,"2024-10-04","11:00:00","Confirmed"),
(9,109,206,"2024-10-05","12:30:00","Cancelled");
alter table appointment add constraint fk_personapp foreign key(p_id) references p_table(p_id);
set foreign_key_checks=1;
alter table appointment add constraint fk_personappoint foreign key(doc_id) references doc_table(doc_id);

desc appointment;
desc p_table;

---------------------------------------------------------------------------------
create table m_report(
record_id int primary key auto_increment,
p_id  int not null,
doc_id int not null,
diagnosis text,
prescription text,
visit_date date
);
insert into m_report values
(01,101,201,"Hypertension","Lisinopril 10mg","2024-09-15"),
(02,102,202,"TypeDiabetes","Metformin500mg","2024-09-20"),
(03,103,203,"Asthma Albuterol","Inhaler","2024-09-25"),
(04,104,204,"Migraine","Sumatriptan 50mg","2024-09-26"),
(05,105,201,"Allergies","Cetirizine 10mg","2024-09-28"),
(06,106,202,"High Cholesterol","Atorvastatin 20mg","2024-09-30"),
(07,107,203,"Anxiety Disorder","Escitalopram 10mg","2024-10-01"),
(08,108,204,"Chronic Back Pain","Ibuprofen 800mg","2024-10-03"),
(09,109,201,"GERD","Omeprazole 20mg"	,"2024-10-05");
select*from m_report;

alter table m_report add constraint fk_personmr foreign key(p_id) references p_table(p_id);
alter table m_report add constraint fk_personmreport foreign key(doc_id) references doc_table(doc_id);

desc m_report;

------------------------------------------------------------------------
create table rooms(
room_id int primary key auto_increment,
room_type varchar(100),
room_status varchar(100),
room_charge_perday decimal(10,2)
);
insert into rooms values (301,'Single Room', 'Available', 75.00);

INSERT INTO rooms (room_type, room_status, room_charge_perday)
VALUES
('Single Room', 'Available', 75.00),
('Double Room', 'Occupied', 120.00),
('Deluxe Room', 'Available', 150.00),
('Suite', 'Cleaning', 250.00),
('Family Room', 'Available', 200.00),
('Single Room', 'Occupied', 75.00),
('Executive Suite', 'Available', 300.00),
('Standard Room', 'Occupied', 90.00),
('Luxury Suite', 'Available', 400.00),
('Accessible Room', 'Available', 85.00);
select*from rooms;
alter table rooms add column p_id int;
update rooms set p_id=101 where room_id=301;
update rooms set p_id=102 where room_id=302;
update rooms set p_id=103 where room_id=303;
update rooms set p_id=104 where room_id=304;
update rooms set p_id=105 where room_id=305;
update rooms set p_id=106 where room_id=306;
update rooms set p_id=107 where room_id=307;
update rooms set p_id=108 where room_id=308;
update rooms set p_id=109 where room_id=309;
update rooms set p_id=110 where room_id=310;
update rooms set p_id=111 where room_id=311;


------------------------------------------------------
create table billing(
bill_id int primary key auto_increment,
p_id int not null,
total_amount decimal(10,2),
pay_date date,
pay_status varchar(100)
);
insert into billing values(501,200,350.00,'2024-10-23','Paid');
INSERT INTO billing (p_id, total_amount, pay_date, pay_status)
VALUES
(201, 250.00, '2024-09-15', 'Paid'),
(202, 350.00, '2024-09-20', 'Unpaid'),
(203, 200.00, '2024-09-25', 'Paid'),
(204, 150.00, '2024-09-26', 'Paid'),
(205, 300.00, '2024-09-28', 'Unpaid'),
(206, 400.00, '2024-09-30', 'Paid'),
(207, 180.00, '2024-10-01', 'Paid'),
(208, 220.00, '2024-10-03', 'Unpaid'),
(209, 500.00, '2024-10-05', 'Paid'),
(210, 100.00, '2024-10-06', 'Unpaid');
select*from billing;

alter table billing add constraint fk_personbil foreign key(pa_id) references patient(p_id);
desc billing;
desc patient;
-------------------------------------------------------------------------------
create table roomtype(p_id int ,doc_id int,roomtype varchar(100));
insert into roomtype values(1,201,"ICU"),(2,202,"General"),(3,203,"ICU"),(4,204,"Acute Care"),(5,205,"A&E"),(6,206,"General");
alter table roomtype add constraint fk_personrt foreign key(p_id) references patient(p_id);
desc roomtype;

