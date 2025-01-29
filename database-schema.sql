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
