-- 1.Data Retrieval Queries
-- Query 1: Get all patients and their health records
SELECT Patients.Name, Patients.Age, Patients.Gender, Patients.Region, Health_Records.Disease_Type, Health_Records.Treatment_Provided
FROM Patients
JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID;



-- Query 2: Get healthcare facilities in a specific region
SELECT Facility_Name, Location, Number_of_Doctors
FROM Healthcare_Facilities
WHERE Location = 'Rural';



-- Query 3: Get all visits by a patient
SELECT Patients.Name, Visits.Visit_Date, Healthcare_Facilities.Facility_Name, Visits.Reason_for_Visit
FROM Visits
JOIN Patients ON Visits.Patient_ID = Patients.Patient_ID
JOIN Healthcare_Facilities ON Visits.Facility_ID = Healthcare_Facilities.Facility_ID
WHERE Patients.Name = 'John Doe';




-- Query 4: Get the number of visits for each healthcare facility
SELECT Healthcare_Facilities.Facility_Name, COUNT(Visits.Visit_ID) AS Total_Visits
FROM Visits
JOIN Healthcare_Facilities ON Visits.Facility_ID = Healthcare_Facilities.Facility_ID
GROUP BY Healthcare_Facilities.Facility_Name;




-- Query 5: Get patients with a specific disease
SELECT Patients.Name, Patients.Age, Patients.Gender, Health_Records.Disease_Type
FROM Patients
JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID
WHERE Health_Records.Disease_Type = 'Malaria';




-- 2.Data Analysis Queries
-- Query 6: Get the average number of doctors per healthcare facility
SELECT AVG(Number_of_Doctors) AS Avg_Doctors_Per_Facility
FROM Healthcare_Facilities;



-- Query 7: Get the most common disease by region
SELECT Patients.Region, Health_Records.Disease_Type, COUNT(*) AS Disease_Count
FROM Patients
JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID
GROUP BY Patients.Region, Health_Records.Disease_Type
ORDER BY Disease_Count DESC;



-- Query 8: Get healthcare providers by specialty in each healthcare facility
SELECT Healthcare_Facilities.Facility_Name, Healthcare_Providers.Specialty, COUNT(*) AS Total_Providers
FROM Healthcare_Providers
JOIN Healthcare_Facilities ON Healthcare_Providers.Facility_ID = Healthcare_Facilities.Facility_ID
GROUP BY Healthcare_Facilities.Facility_Name, Healthcare_Providers.Specialty;



-- Query 9: Get the number of patients diagnosed with a disease (e.g., Hypertension)
SELECT Health_Records.Disease_Type, COUNT(*) AS Total_Patients
FROM Health_Records
WHERE Health_Records.Disease_Type = 'Hypertension'
GROUP BY Health_Records.Disease_Type;



-- Query 10: Get the total number of visits in each year
SELECT EXTRACT(YEAR FROM Visit_Date) AS Year, COUNT(*) AS Total_Visits
FROM Visits
GROUP BY EXTRACT(YEAR FROM Visit_Date)
ORDER BY Year;




-- 3. Data Filtering and Insights
-- Query 11: Get the healthcare facilities with more than 20 doctors
SELECT Facility_Name, Location, Number_of_Doctors
FROM Healthcare_Facilities
WHERE Number_of_Doctors > 20;



-- Query 12: Get patients in rural areas who visited healthcare facilities more than 3 times
SELECT Patients.Name, COUNT(Visits.Visit_ID) AS Total_Visits
FROM Patients
JOIN Visits ON Patients.Patient_ID = Visits.Patient_ID
WHERE Patients.Region = 'Rural'
GROUP BY Patients.Name
HAVING COUNT(Visits.Visit_ID) > 3;



-- Query 13: Get the total number of patients diagnosed with different diseases by healthcare provider
SELECT Healthcare_Providers.Provider_Name, Health_Records.Disease_Type, COUNT(*) AS Disease_Count
FROM Healthcare_Providers
JOIN Health_Records ON Healthcare_Providers.Facility_ID = Health_Records.Facility_ID
GROUP BY Healthcare_Providers.Provider_Name, Health_Records.Disease_Type
ORDER BY Disease_Count DESC;




-- 4. Join and Subquery Usage
-- Query 14: Get the healthcare facility with the highest number of patients
SELECT Facility_Name
FROM Healthcare_Facilities
WHERE Facility_ID = (
    SELECT Facility_ID
    FROM Visits
    GROUP BY Facility_ID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- Query 15: Get patients who have visited healthcare facilities for multiple diseases
SELECT Patients.Name, COUNT(DISTINCT Health_Records.Disease_Type) AS Disease_Count
FROM Patients
JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID
JOIN Visits ON Patients.Patient_ID = Visits.Patient_ID
GROUP BY Patients.Name
HAVING COUNT(DISTINCT Health_Records.Disease_Type) > 1;

