CREATE DATABASE IF NOT EXISTS ENTERPRISE_DB;

-- Employee table
CREATE TABLE EMPLOYEE (
    ID_EMP INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    FNAME VARCHAR(255) NOT NULL,
    BIRTHDATE DATE NOT NULL
);

-- Contract table
CREATE TABLE CONTRACT(
    ID_CONTRACT INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    SIGN_DATE DATE NOT NULL,
    DURATION INT NOT NULL,
    SALARY FLOAT NOT NULL
);

-- Service table
CREATE TABLE SERVICE(
    ID_SERVICE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    NESTED_SERVICES INT,
    ID_DIRECTOR INT,
    -- A service must have a responsible employee
     FOREIGN KEY (ID_DIRECTOR) REFERENCES EMPLOYEE(ID_EMP)
);

-- relationship table family members, because employee can have family members. 
-- Hypothesis : each family member is an employee
CREATE TABLE FAMILY_MEMBERS(
    ID_FAMILY_MEMBER INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_MEMBER INT,
    ID_MEMBER_2 INT,
    FOREIGN KEY (ID_MEMBER) REFERENCES EMPLOYEE(ID_EMP),
    FOREIGN KEY (ID_MEMBER_2) REFERENCES EMPLOYEE(ID_EMP)
);

-- relationship table between services
-- each service may have nested services
CREATE TABLE NESTED_SERVICES(
    ID_NESTED_SERVICE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_SERVICE_PARENT INT,
    ID_SERVICE_CHILD INT,
    FOREIGN KEY (ID_SERVICE_PARENT) REFERENCES SERVICE(ID_SERVICE),
    FOREIGN KEY (ID_SERVICE_CHILD) REFERENCES SERVICE(ID_SERVICE)
);

-- relationship table multiple employees inside multiple services
-- Employees may have multiple services 
CREATE TABLE WORKING (
    ID_WORKING INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_EMPLOYEE INT,
    ID_SERVICE INT,
    FOREIGN KEY (ID_EMPLOYEE) REFERENCES EMPLOYEE(ID_EMP),
    FOREIGN KEY (ID_SERVICE) REFERENCES SERVICE(ID_SERVICE)
);

--relationship table between multiple contracts and multiple employees
-- Employees may have multiple contracts
CREATE TABLE EMPLOYEE_CONTRACT(
    ID_EMPLOYEE_CONTRACT INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_EMPLOYEE INT,
    ID_CONTRACT INT,
    FOREIGN KEY (ID_EMPLOYEE) REFERENCES EMPLOYEE(ID_EMP),
    FOREIGN KEY (ID_CONTRACT) REFERENCES CONTRACT(ID_CONTRACT)
);
-- Employees may have multiple services 
CREATE TABLE EMPLOYEE_SERVICE(
    ID_EMPLOYEE_SERVICE INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ID_EMPLOYEE INT,
    ID_SERVICE INT,
    FOREIGN KEY (ID_EMPLOYEE) REFERENCES EMPLOYEE(ID_EMP),
    FOREIGN KEY (ID_SERVICE) REFERENCES SERVICE(ID_SERVICE)
);