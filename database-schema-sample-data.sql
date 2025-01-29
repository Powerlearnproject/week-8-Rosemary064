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
