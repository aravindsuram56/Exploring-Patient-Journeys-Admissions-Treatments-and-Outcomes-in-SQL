
-- Most overloaded departments
SELECT Department, COUNT(*) AS TotalAdmissions
FROM Admissions
GROUP BY Department
ORDER BY TotalAdmissions DESC
LIMIT 1;
-- Surgey department is overloaded with most of the patients


-- Average Stay Duration by Department
SELECT Department, AVG(DATEDIFF(DischargeDate, AdmissionDate)) AS AvgStay
FROM Admissions
WHERE DischargeDate IS NOT NULL
GROUP BY Department
ORDER BY AvgStay DESC;

-- Gynecology and Radiology  Departemet has the highest Average stay duration

-- Most Common Treatments
SELECT t.TreatmentName, COUNT(*) AS common_treatments
FROM Treatments t
JOIN Admissions a ON t.TreatmentID = a.TreatmentID
GROUP BY t.TreatmentName
ORDER BY common_treatments DESC
LIMIT 5;
-- MRI Scan is the most common treatment

-- Revenue by Department
SELECT a.Department, SUM(b.TotalAmount) AS TotalRevenue
FROM Billing b
JOIN Admissions a ON b.AdmissionID = a.AdmissionID
GROUP BY a.Department
ORDER BY TotalRevenue DESC;
-- General Medicine  Department has highest revenue with 13,60,681

-- Highest bill payong patients
SELECT p.FirstName, SUM(b.TotalAmount) AS total_pay
FROM Patients p
JOIN Admissions a ON p.PatientID = a.PatientID
JOIN Billing b ON a.AdmissionID = b.AdmissionID
GROUP BY p.FirstName
ORDER BY total_pay DESC
LIMIT 5;

-- Patient 97 pays the highest bill with total 2,16,563 rupees


-- Monthly Revenue Trend
SELECT DATE_FORMAT(a.AdmissionDate, '%Y-%m') AS Month, SUM(b.TotalAmount) AS MonthlyRevenue
FROM Admissions a
JOIN Billing b ON a.AdmissionID = b.AdmissionID
GROUP BY Month
ORDER BY Month;







