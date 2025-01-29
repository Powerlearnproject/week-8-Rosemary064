-- 1.Database schema design
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Gender VARCHAR(50),
    Region VARCHAR(255)
);

CREATE TABLE Healthcare_Facilities (
    Facility_ID INT PRIMARY KEY,
    Facility_Name VARCHAR(255),
    Location VARCHAR(255),
    Number_of_Doctors INT,
    Services_Offered TEXT
);

CREATE TABLE Healthcare_Providers (
    Provider_ID INT PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Specialty VARCHAR(255),
    Facility_ID INT,
    FOREIGN KEY (Facility_ID) REFERENCES Healthcare_Facilities(Facility_ID)
);

CREATE TABLE Health_Records (
    Record_ID INT PRIMARY KEY,
    Patient_ID INT,
    Disease_Type VARCHAR(255),
    Date_of_Diagnosis DATE,
    Treatment_Provided TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Visits (
    Visit_ID INT PRIMARY KEY,
    Patient_ID INT,
    Facility_ID INT,
    Visit_Date DATE,
    Reason_for_Visit TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Facility_ID) REFERENCES Healthcare_Facilities(Facility_ID)
);





-- 2.Sample data for patients
-- Sample data for Patients
INSERT INTO Patients VALUES (1, 'John Doe', 30, 'Male', 'Urban');
INSERT INTO Patients VALUES (2, 'Jane Smith', 45, 'Female', 'Rural');

-- Sample data for Healthcare_Facilities
INSERT INTO Healthcare_Facilities VALUES (1, 'City Hospital', 'Urban', 50, 'General Care, Emergency Services');
INSERT INTO Healthcare_Facilities VALUES (2, 'Village Clinic', 'Rural', 10, 'General Care');

-- Sample data for Healthcare_Providers
INSERT INTO Healthcare_Providers VALUES (1, 'Dr. Alice Brown', 'General Practitioner', 1);
INSERT INTO Healthcare_Providers VALUES (2, 'Dr. Bob White', 'Pediatrician', 2);

-- Sample data for Health_Records
INSERT INTO Health_Records VALUES (1, 1, 'Hypertension', '2022-05-01', 'Medication');
INSERT INTO Health_Records VALUES (2, 2, 'Malaria', '2022-06-10', 'Antimalarial Drugs');

-- Sample data for Visits
INSERT INTO Visits VALUES (1, 1, 1, '2022-05-02', 'Routine Checkup');
INSERT INTO Visits VALUES (2, 2, 2, '2022-06-15', 'Emergency Visit');
