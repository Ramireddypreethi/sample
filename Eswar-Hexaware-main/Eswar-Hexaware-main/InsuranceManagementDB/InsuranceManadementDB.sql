CREATE DATABASE InsuranceManagementDB;
USE InsuranceManagementDB;

-- Create Users table
CREATE TABLE Users (
    userId INT PRIMARY KEY identity(101,1),
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    role NVARCHAR(50) NOT NULL
);
INSERT INTO Users (username, password, role) VALUES
('preethi', 'password123', 'admin'),
('varun', 'varunpass', 'agent'),
('sreeja', 'sreeja2024', 'customer'),
('pooja', 'pooja@123', 'customer')

-- Create Clients table
CREATE TABLE Clients (
    clientId INT PRIMARY KEY identity(201,1),
    clientName NVARCHAR(100) NOT NULL,
    contactInfo NVARCHAR(100) NOT NULL,
    policy NVARCHAR(100) NOT NULL
);


INSERT INTO Clients(clientname, contactinfo, policy) VALUES
('John Doe', 'john.doe@email.com', 'Life Insurance'),
('Jane Smith', 'jane.smith@email.com', 'Auto Insurance'),
('Alice Johnson', '+1234567890', 'Health Insurance'),
('Robert Brown', 'robert.brown@email.com', 'Home Insurance')


-- Create Policies table
CREATE TABLE Policies (
    policyId INT PRIMARY KEY IDENTITY(1,1),
    policyName NVARCHAR(100) NOT NULL,
    policyDescription NVARCHAR(255) NOT NULL
);
-- Insert into Policies
INSERT INTO Policies (policyName, policyDescription)
VALUES ('Health Insurance', 'Covers medical expenses including hospital stays and treatments'),
       ('Life Insurance', 'Provides financial security to your family in case of your death'),
       ('Auto Insurance', 'Covers damages to your car and third-party liability'),
       ('Home Insurance', 'Covers damages to your home and belongings');
-- Create Claims table
CREATE TABLE Claims (
    claimId INT PRIMARY KEY identity(301,1),
    claimNumber NVARCHAR(100) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount DECIMAL(10, 2) NOT NULL,
    status NVARCHAR(50) NOT NULL,
    clientId INT,
    policy NVARCHAR(100),
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);
INSERT INTO Claims (claimNumber, dateFiled, claimAmount, status, policy, clientId) VALUES
('CLM2024001', '2024-10-01', 1500.00, 'Pending', 'Auto Insurance', 201),
('CLM2024002', '2024-10-05', 2500.00, 'Approved', 'Home Insurance', 202),
('CLM2024003', '2024-10-07', 350.00, 'Rejected', 'Health Insurance', 203),
('CLM2024004', '2024-10-12', 4200.00, 'Pending', 'Life Insurance', 204)

-- Create Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY identity(401,1),
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(10, 2) NOT NULL,
    clientId INT,
    FOREIGN KEY (clientId) REFERENCES Clients(clientId)
);
INSERT INTO Payments (paymentDate, paymentAmount, clientId) VALUES
('2024-10-01', 1500.00, 201),  -- Payment for John Doe
('2024-10-02', 2500.00, 202),  -- Payment for Jane Smith
('2024-10-03', 350.00, 203),   -- Payment for Alice Johnson
('2024-10-04', 4200.00, 204)
SELECT * FROM Clients;
SELECT * FROM Users;
SELECT * FROM Claims;
SELECT * FROM Payments;
SELECT * FROM Policies;

