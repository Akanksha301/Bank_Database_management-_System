CREATE DATABASE BANK_MANAGEMENT ;

USE BANK_MANAGEMENT ;

CREATE TABLE CUSTOMER_DETAILS(
CUSTOMER_ID CHAR(10) PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
CONTACT CHAR(10) NOT NULL,
ADDRESS VARCHAR(100) NOT NULL,
EMAIL VARCHAR(30) NOT NULL,
DOB DATE NOT NULL,
GENDER VARCHAR(2),
AGE VARCHAR(4) NOT NULL,
ADHARCARDNO CHAR(12) NOT NULL,
ACCOUNTNO  CHAR(12),
constraint U1 unique(CONTACT),
constraint CK2 CHECK (length(CONTACT) = 10),
constraint CK3 CHECK (length(ADHARCARDNO) = 12),
constraint CK4 CHECK (LENGTH(ACCOUNTNO) = 12),
constraint CK5 CHECK (EMAIL LIKE '%@%.%')
);

SELECT * FROM CUSTOMER_DETAILS ;

ALTER TABLE CUSTOMER_DETAILS
ADD CONSTRAINT U2 UNIQUE(ADHARCARDNO) ;

ALTER TABLE CUSTOMER_DETAILS
ADD CONSTRAINT U3 UNIQUE(ACCOUNTNO);

ALTER TABLE CUSTOMER_DETAILS
ADD CONSTRAINT U4 UNIQUE(EMAIL);

CREATE TABLE ACCOUNT_DETAILS(
ACCOUNTNO CHAR(12) PRIMARY KEY ,
BRANCHNAME VARCHAR(50) NOT NULL,
BRANCHCODE CHAR(10) NOT NULL,
ISFC_CODE CHAR(10) NOT NULL,
MIRC_CODE CHAR(8),
ACCOUNT_TYPE VARCHAR(20),
CONSTRAINT U1 UNIQUE(BRANCHCODE),
CONSTRAINT CH1 CHECK(LENGTH(BRANCHCODE)=10),
CONSTRAINT U2 UNIQUE(ISFC_CODE),
CONSTRAINT CH2 CHECK(LENGTH(ISFC_CODE)=10),
CONSTRAINT U3 UNIQUE(MIRC_CODE),
CONSTRAINT CH3 CHECK(LENGTH(MIRC_CODE)=8)
);

SELECT * FROM ACCOUNT_DETAILS ;

CREATE TABLE BRANCH_DETAILS(
BRANCHCODE CHAR(10) PRIMARY KEY,
BRANCH_NAME VARCHAR(50) NOT NULL,
BRANCH_ADDRESS VARCHAR(50) NOT NULL,
BRANCH_EMAIL VARCHAR(30) UNIQUE ,

BRANCH_CONTACT CHAR(10) UNIQUE NOT NULL
CONSTRAINT CK1 CHECK(LENGTH(BRANCH_CONTACT)=10),
CONSTRAINT CK11 CHECK(BRANCH_EMAIL LIKE '%@%.%')
);

SELECT * FROM BRANCH_DETAILS ;

CREATE TABLE CHECKBOOK_DETAILS(
TRANSACTION_DATE DATE,
TRANSACTION_TIME TIME,
CHECK_NO VARCHAR(10) NOT NULL,
DEPOSITE int8 ,
WITHDRAW int4 
);

SELECT * FROM CHECKBOOK_DETAILS ;

ALTER TABLE CHECKBOOK_DETAILS
ADD TRANSFER INT ;

SELECT * FROM CHECKBOOK_DETAILS ;

use bank_management ;

create table transaction(
transaction_Id char(10) not null,
Ttime time,
Tdate date,
fromAccNo char(12) not null ,
toAccNo char(12) not null ,
transaction_type varchar(20) not null,
Amount_transfer int8,
Balance int8,
constraint ch13 check(length(fromAccNo)=12),
constraint ch21 check(length(toAccNo)=12)
);

select * from transaction ;

CREATE TABLE DEBITCARD(
CREDITCARD_ID CHAR(12) PRIMARY KEY,
PINCODE CHAR(4) NOT NULL,
ACCOUNTNO CHAR(12) NOT NULL UNIQUE,
CUSTOMER_ID CHAR(10) NOT NULL UNIQUE,
CVV CHAR(3) NOT NULL UNIQUE,
EXPIRY_DATE DATE,
CARDLIMIT VARCHAR(10),
CONSTRAINT CK7 CHECK(LENGTH(ACCOUNTNO)=12),
CONSTRAINT CK8 CHECK(LENGTH(CUSTOMER_ID)=10),
CONSTRAINT CK9 CHECK(LENGTH(PINCODE)=4),
CONSTRAINT CK6 CHECK(LENGTH(CVV)=3)
);

SELECT * FROM DEBITCARD ;

CREATE TABLE COSTUMERS_ACCOUNT(
CUSTOMER_ID CHAR(10)  PRIMARY KEY,
CREDITCARD_ID CHAR(12) UNIQUE ,
ACCOUNTNO CHAR(12) NOT NULL UNIQUE,
transaction_Id char(10) not null,
NET_BANKING_ID VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE NET_BANKING_DETAILS(
NET_BANKING_ID VARCHAR(20) PRIMARY KEY,
NB_PASSWORD VARCHAR(20) NOT NULL 
);

