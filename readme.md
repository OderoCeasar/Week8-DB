# ClinicBooking Database Schema

This repository contains the SQL script `answers.sql`, which defines the schema and sample data for a clinic booking system. The database is designed to manage patients, doctors, their specializations, appointments, and medical records.

## Database Overview

The database is named `ClinicBooking` and consists of the following tables:

1. **patients**
2. **doctors**
3. **specializations**
4. **doctor_specializations** (many-to-many relationship)
5. **appointments**
6. **medical_records**

## Table Descriptions

### 1. `patients`
Stores information about patients.

| Column         | Data Type     | Constraints                  |
|----------------|---------------|------------------------------|
| `patient_id`   | INT           | Primary Key, Auto Increment  |
| `name`         | VARCHAR(100)  | Not Null                     |
| `email`        | VARCHAR(100)  | Unique, Not Null             |
| `phone`        | VARCHAR(15)   |                              |
| `date_of_birth`| DATE          |                              |

### 2. `doctors`
Stores information about doctors.

| Column             | Data Type     | Constraints                  |
|--------------------|---------------|------------------------------|
| `doctor_id`        | INT           | Primary Key, Auto Increment  |
| `name`             | VARCHAR(100)  | Not Null                     |
| `email`            | VARCHAR(100)  | Unique, Not Null             |
| `phone`            | VARCHAR(15)   |                              |
| `years_experience` | INT           |                              |

### 3. `specializations`
Stores information about medical specializations.

| Column               | Data Type     | Constraints                  |
|----------------------|---------------|------------------------------|
| `specialization_id`  | INT           | Primary Key, Auto Increment  |
| `name`               | VARCHAR(100)  | Unique, Not Null             |

### 4. `doctor_specializations`
Defines a many-to-many relationship between doctors and their specializations.

| Column               | Data Type     | Constraints                  |
|----------------------|---------------|------------------------------|
| `doctor_id`          | INT           | Primary Key, Foreign Key     |
| `specialization_id`  | INT           | Primary Key, Foreign Key     |

### 5. `appointments`
Stores information about appointments between patients and doctors.

| Column               | Data Type     | Constraints                  |
|----------------------|---------------|------------------------------|
| `appointment_id`     | INT           | Primary Key, Auto Increment  |
| `patient_id`         | INT           | Foreign Key                  |
| `doctor_id`          | INT           | Foreign Key                  |
| `appointment_date`   | DATETIME      | Not Null                     |
| `reason`             | TEXT          |                              |

### 6. `medical_records`
Stores medical records for patients.

| Column               | Data Type     | Constraints                  |
|----------------------|---------------|------------------------------|
| `record_id`          | INT           | Primary Key, Auto Increment  |
| `patient_id`         | INT           | Foreign Key                  |
| `diagnosis`          | TEXT          | Not Null                     |
| `treatment`          | TEXT          |                              |
| `created_at`         | TIMESTAMP     | Default: Current Timestamp   |

## Relationships

- **One-to-Many**: 
  - A patient can have multiple appointments and medical records.
  - A doctor can have multiple appointments.
- **Many-to-Many**:
  - Doctors can have multiple specializations, and each specialization can belong to multiple doctors. This is implemented using the `doctor_specializations` table.

## Sample Data

The script includes sample data for testing purposes:

- **patients**: One patient named George Ceasar.
- **doctors**: One doctor named Dr. Leticia Joy.
- **specializations**: Two specializations: Cardiology and Dermatology.
- **doctor_specializations**: Links Dr. Leticia Joy to Cardiology.
- **appointments**: A routine check-up appointment for George Ceasar with Dr. Leticia Joy.
- **medical_records**: A medical record for George Ceasar with a diagnosis of Hypertension.


