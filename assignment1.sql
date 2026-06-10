CREATE DATABASE InsuranceDB;
USE InsuranceDB;
-- Create Customer Table
CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(50),
    DOB DATE,
    ContactNo BIGINT
);
-- Create PolicyType Table
CREATE TABLE PolicyType (
    PolicyType VARCHAR(20) PRIMARY KEY,
    PremiumRate DECIMAL(5,2),
    CoverageYears INT
);
-- Create Branch Table
CREATE TABLE Branch (
    BranchID VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(50),
    Manager VARCHAR(50)
);
-- Create Policy Table
CREATE TABLE Policy (
    PolicyID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    PolicyType VARCHAR(20),
    PremiumAmount DECIMAL(10,2),
    BranchID VARCHAR(10),

    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (PolicyType) REFERENCES PolicyType(PolicyType),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
-- Insert Customers
INSERT INTO Customer VALUES
('C1', 'Ramesh', '1985-05-10', 9876543210),
('C2', 'Kavya', '1990-09-15', 9123456789);

-- Insert Policy Types
INSERT INTO PolicyType VALUES
('Health', 5.00, 10),
('Life', 8.00, 20),
('Vehicle', 6.00, 5);

-- Insert Branches
INSERT INTO Branch VALUES
('B1', 'Bangalore', 'Anil'),
('B2', 'Mysore', 'Sneha');

-- Insert Policies
INSERT INTO Policy VALUES
('P1', 'C1', 'Health', 20000, 'B1'),
('P2', 'C1', 'Vehicle', 15000, 'B1'),
('P3', 'C2', 'Life', 50000, 'B2');

-- Display Tables
SELECT * FROM Customer;
SELECT * FROM PolicyType;
SELECT * FROM Branch;
SELECT * FROM Policy;

-- a. Maximum premium amount per branch

SELECT 
    b.BranchName,
    MAX(p.PremiumAmount) AS MaximumPremium
FROM Policy p
JOIN Branch b
ON p.BranchID = b.BranchID
GROUP BY b.BranchName;
-- a. Maximum premium amount per branch

SELECT 
    b.BranchName,
    MAX(p.PremiumAmount) AS MaximumPremium
FROM Policy p
JOIN Branch b
ON p.BranchID = b.BranchID
GROUP BY b.BranchName;
-- c. Total annual premium payable per branch

SELECT 
    b.BranchName,
    SUM(p.PremiumAmount) AS TotalAnnualPremium
FROM Policy p
JOIN Branch b
ON p.BranchID = b.BranchID
GROUP BY b.BranchName;

