# sql_dashboard_project

Here's a description you can use for a Hospital Management System (HMS) project in SQL for your GitHub repository:

Hospital Management System in SQL

This project is a **Hospital Management System** (HMS) built using SQL for efficient database management. The system provides comprehensive functionalities to manage patients, doctors, staff, appointments, medical records, billing, and more, ensuring smooth and streamlined hospital operations.

## Features:
**Patient Management**: Store and manage patient details, including personal information, medical history, and current health status.
**Doctor Management**   : Maintain a directory of doctors with their specializations, availability, and assigned patients.
**Appointments**        : Schedule, update, and track patient appointments with doctors.
**Medical Records**     : Manage patient diagnosis, treatment plans, prescriptions, and lab reports.
**Staff Management**    : Record staff details, including their roles, departments, and working hours.
**Billing System**      : Handle patient billing, payments, and insurance claims.
**Rooms & Wards**       : Keep track of room availability, assignments, and ward management.
**Inventory Management**: Manage hospital supplies such as medicines and equipment.

## Database Structure:

The system is built using the following key tables:
Patients       : Stores patient information (ID, name, contact, address, medical history).
Doctors        : Stores doctor details (ID, name, specialty, contact).
Appointments   : Manages appointment schedules (appointment ID, patient ID, doctor ID, date, time).
Medical_Records: Stores diagnosis and treatment data for each patient (record ID, patient ID, doctor ID, diagnosis, prescription).
Billing        : Handles payment information (billing ID, patient ID, amount, payment status).
Rooms          : Manages hospital rooms and ward assignments (room ID, patient ID, doctor ID, room status).
Staff          : Stores staff information (staff ID, name, department, role, shift timing).

## Technologies Used:

**MySQL/SQL Server**: Compatible with major SQL database systems.
