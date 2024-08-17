CREATE DATABASE IF NOT EXISTS healthtrack
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

-- Create 'doctors' table
CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `OfficePhoneNumber` varchar(40) DEFAULT NULL,
  `OfficeAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create 'patients' table
CREATE TABLE `patients` (
  `PatientID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `DateOfBirth` datetime NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `HomeAddress` varchar(255) DEFAULT NULL,
  `EmergencyContact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create 'medicalrecords' table
CREATE TABLE `medicalrecords` (
  `RecordID` int NOT NULL,
  `PatientID` int NOT NULL,
  `Diagnosis` text,
  `Treatment` text,
  PRIMARY KEY (`RecordID`),
  FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Create 'appointments' table
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `DateTime` datetime NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`),
  FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
