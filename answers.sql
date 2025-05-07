CREATE DATABASE ClinicBooking;
USE ClinicBooking;

-- Create Patients Table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE
);

-- Create Doctors Table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    years_experience INT
);

-- Create Specializations Table
CREATE TABLE specializations (
    specialization_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Create doctor_specializations Table(M-M)
CREATE TABLE doctor_specializations (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
);

-- Appointments Table
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Medical Records Table
CREATE TABLE medical_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    diagnosis TEXT NOT NULL,
    treatment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Sample Data
INSERT INTO patients (name, email, phone, date_of_birth)
VALUES ('George Ceasar', 'oderoceasar@gmail.com', '0703382631', '2006-02-15');

INSERT INTO doctors (name, email, phone, years_experience)
VALUES ('Dr. Leticia Joy', 'omondileticia424@gmail.com', '0798564321', 2);

INSERT INTO specializations (name)
VALUES ('Cardiology'), ('Dermatology');

INSERT INTO doctor_specializations (doctor_id, specialization_id)
VALUES (1, 1);

INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason)
VALUES (1, 1, '2025-05-07 10:00:00', 'Routine check-up');

INSERT INTO medical_records (patient_id, diagnosis, treatment)
VALUES (1, 'Hypertension', 'Medication prescribed');

