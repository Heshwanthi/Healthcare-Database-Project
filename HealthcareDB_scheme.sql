-- CREATE DATABASE
create database Healthcare_db;
use Healthcare_db;

-- CREATE TABLE Department
create table Department(
DepartmentID INT auto_increment primary key,
Department_name varchar(50) not null
);
insert into Department(Department_name)values
('Cardiology'),
('Orthopedics'),
('Neurology'),
('Pediatric'),
('General Medicine');
SELECT * FROM Department;

-- CREATE TABLE Doctors
create table Doctors(
doctor_id int auto_increment primary key,
First_name varchar(50),
Last_name varchar(50),
Speciality varchar(50),
DepartmentID INT,
foreign key (DepartmentID) referenceS Department(DepartmentID)
);
insert into Doctors(First_name,Last_name,Speciality,DepartmentID)values
('Kevin','Henry','Cardiologist','1'),
('Daniel','Robert','Orthopedic surgeon','2'),
('Louis','Ferb','Neurologist','3'),
('Martha','Albert','Pediatrition','4'),
('Lusia','Melin','General physician','5');

-- CREATE TABLE PATIENTS
Create table Patients(
patient_id int auto_increment primary key,
First_name varchar(50),
Last_name varchar(50),
Gender varchar(10),
D_o_b date,
Address varchar(100),
Phone_number varchar(12) not null
);
insert into Patients (First_name,Last_name,Gender,D_o_b,Address,Phone_number) values
('Emily','John','F','1994-08-05','8th new st','9653822330'),
('Jane','Dwel','F','1977-02-12','11th main ave','9586421555'),
('Ragav','Rish','M','1989-09-13','66 ELM road','6585458330'),
('Nikitha','Vaishu','M','1999-05-07','48 ptp st','9561423058'),
('Sharik','Khan','M', '2019-12-19','4th uturn ave','6251252149');
INSERT INTO patients (first_name, last_name, gender, dob, address, phone)
VALUES
('Sanjay', 'Iyer', 'M', '1985-06-15', '21 Lake View Rd', '9876543210'),
('Anjali', 'Rao', 'F', '1992-11-23', '42 Rosewood Ave', '9867123456'),
('Vikram', 'Singh', 'M', '1978-03-02', '15 Green Park St', '9123456789'),
('Meera', 'Sharma', 'F', '2001-07-19', '78 Hilltop Lane', '9988776655'),
('Rahul', 'Mehta', 'M', '1995-10-10', '34 Palm Grove Rd', '9765432109'),
('Fatima', 'Sheikh', 'F', '1988-04-28', '5 Maple Blvd', '9898123456'),
('Karthik', 'Reddy', 'M', '1982-12-05', '19 Lotus Colony', '9345678901'),
('Divya', 'Kapoor', 'F', '1990-09-14', '50 Riverfront Dr', '9456123789'),
('Mohammed', 'Ali', 'M', '1986-08-30', '7 Sunrise St', '9321457890'),
('Priya', 'Menon', 'F', '1993-01-25', '88 Garden View', '9845123789');
select * from patients;

-- CREATE TABLE VISITS
create table Visits(
visit_id int auto_increment primary key,
patient_id int ,
doctor_id int,
admission_date date,
discharge_date date,
diagnosis varchar(20),
cost int,
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Visits (patient_id, doctor_id, admission_date, discharge_date,cost, diagnosis)
VALUES
(1, 1, '2025-08-01', '2025-08-03', 5000, 'Heart Disease'),
(1, 2, '2025-09-01', '2025-09-02', 3000, 'Hypertension'),
(2, 3, '2025-08-04', '2025-08-04', 2000, 'Migraine'),
(3, 5, '2025-08-07', '2025-08-08', 4000, 'Flu'),
(3, 4, '2025-09-05', '2025-09-06', 3500, 'Fever'),
(4, 1, '2025-08-10', '2025-08-11', 4500, 'Diabetes'),
(4, 3, '2025-09-07', '2025-09-08', 2200, 'Check-up'),
(4, 5, '2025-09-15', '2025-09-16', 6000, 'Heart Disease'),
(5, 2, '2025-08-15', '2025-08-16', 2800, 'Infection'),
(6, 4, '2025-08-18', '2025-08-19', 3000, 'Asthma'),
(7, 5, '2025-08-20', '2025-08-21', 5000, 'Cancer'),
(8, 1, '2025-08-23', '2025-08-24', 3200, 'Allergy'),
(9, 3, '2025-08-25', '2025-08-26', 1500, 'Cold'),
(10, 2, '2025-08-28', '2025-08-29', 7000, 'Kidney Stone'),
(11, 4, '2025-08-30', '2025-08-31', 4500, 'Fracture'),
(12, 5, '2025-09-02', '2025-09-03', 3500, 'Heart Disease'),
(13, 1, '2025-09-04', '2025-09-05', 2700, 'Arthritis'),
(14, 2, '2025-09-06', '2025-09-07', 3900, 'Gastritis'),
(15, 3, '2025-09-08', '2025-09-09', 2100, 'Anemia');

ALTER TABLE Visits
ADD CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);

-- CREATE TABLE MEDICATIONS
Create table Medications(
visit_id int,
drug_name varchar(20),
dosage char(20),
prescribed_date date);
insert INTO medications (visit_id, drug_name, dosage, prescribed_date)
VALUES
(1, 'Atorvastatin', '10mg daily', '2025-08-01'),
(1, 'Aspirin', '75mg daily', '2025-08-01'),
(2, 'Metformin', '500mg twice daily', '2025-09-01'),
(3, 'Sumatriptan', '50mg as needed', '2025-08-04'),
(4, 'Paracetamol', '500mg thrice daily', '2025-08-07'),
(4, 'Ibuprofen', '200mg twice daily', '2025-08-07'),
(5, 'Amoxicillin', '250mg twice daily', '2025-09-05'),
(6, 'Insulin', '5 units before meal', '2025-08-10'),
(7, 'Vitamin C', '500mg daily', '2025-09-07'),
(8, 'Clopidogrel', '75mg daily', '2025-09-15'),
(8, 'Atorvastatin', '10mg daily', '2025-09-15'),
(9, 'Azithromycin', '500mg daily', '2025-08-15'),
(10, 'Salbutamol', '100mcg inhaler', '2025-08-18'),
(11, 'Morphine', '10mg injection', '2025-08-20'),
(12, 'Cetirizine', '10mg daily', '2025-08-23'),
(13, 'Paracetamol', '500mg thrice daily', '2025-08-25'),
(14, 'Tamsulosin', '0.4mg daily', '2025-08-28'),
(15, 'Calcium', '500mg daily', '2025-08-30');