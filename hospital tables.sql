 CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Age INT ,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);


CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    Specialty VARCHAR(50),
    Department VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);


CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(100),
    Cost DECIMAL(10,2)
);


CREATE TABLE Admissions (
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    TreatmentID INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    Department VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);


CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    AdmissionID INT,
    TotalAmount DECIMAL(10,2),
    InsuranceCovered DECIMAL(10,2),
    PatientPayable DECIMAL(10,2),
    FOREIGN KEY (AdmissionID) REFERENCES Admissions(AdmissionID)
);

