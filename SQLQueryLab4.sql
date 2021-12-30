USE BADEKUNLE

Create Table Patient
(
PatientID	integer not null identity(100, 1),
FName		varchar(30) not null,
LName		varchar(30) not null,
DOB			date,
Street		varchar(50),
City		varchar(30),
State		char(2),
Zipcode		char(10),
Email		varchar(40) not null unique,
Gender		char(2),
Age			int,
PatientType	varchar(35),		
PRIMARY KEY(PatientID)
)
select * from Patient
Insert into Patient(FName, LName, DOB, Street, City, State, Zipcode, Email, Gender, Age, PatientType) values ('Kevin', 'Larry', '04/02/1999', 
'King','Marietta','GA','30144','klarry4@gmail.com','M',21, 'In-patient')
Insert into Patient(FName, LName, DOB, Street, City, State, Zipcode, Email, Gender, Age, PatientType) values ('Stacy', 'Adam', '05/03/1998', 
'Stone','Kennesaw','PA','43290','sadam5@gmail.com1','F', 22, 'Out-patient')
Insert into Patient(FName, LName, DOB, Street, City, State, Zipcode, Email, Gender, Age, PatientType) values ('Devin', 'Kinry', '06/01/1997', 
'Wing','Masonria','TX','11011','dkinry6@gmail.com','M',24,'Resident-patient')
Insert into Patient(FName, LName, DOB, Street, City, State, Zipcode, Email, Gender, Age, PatientType) values ('Moria', 'Clany', '10/10/1990', 
'Flee','Marietta','GA','44557','mclany1@gmail.com','F',31,'Out-patient')
Insert into Patient(FName, LName, DOB, Street, City, State, Zipcode, Email, Gender, Age, PatientType) values ('Ernie', 'Jerry', '05/02/1999', 
'King','Orlando','FL','30144','ejerry5@gmail.com','M',21,'Resident-patient')
select * from Patient
Create Table Bed
(
BedIdNumber	integer not null identity(1000, 1),
PatientID	integer not null,

Primary Key(BedIdNumber),
Foreign Key(PatientId) references Patient(PatientId),
)
Insert into Bed(PatientID) values(1000)
Insert into Bed(PatientID) values(1003)
select * from Bed
select * from Patient
Create Table Personnel
(
PersonnelID		integer not null identity(1000, 2),
FName			varchar(20),
LName			varchar(20),
Street			varchar(50),
City			varchar(30),
State			char(2),
Zipcode			char(10),
Position		varchar(10),
PersonnelType	char(2),
Hire_date		date,
Phone#			integer not null,

Primary Key(PersonnelID)
)
Insert into Personnel(FName, LName, Street, City, State, Zipcode, Position,PersonnelType, Hire_date, Phone#) values ('Smith', 'Long', 
'Kenswith','Orlando','FL','12341','Doctor','F','05/09/20',404789100)
Insert into Personnel(FName, LName, Street, City, State, Zipcode, Position,PersonnelType, Hire_date, Phone#) values ('Mary', 'Mason', 
'South','Orlando','TX','22557','Nurse','P','03/07/19',562334561)
Insert into Personnel(FName, LName, Street, City, State, Zipcode, Position,PersonnelType, Hire_date, Phone#) values ('Wes', 'Ling', 
'Kenswer','Orlando','FL','34562','Optician','F','10/20/21',778321445)
Insert into Personnel(FName, LName, Street, City, State, Zipcode, Position,PersonnelType, Hire_date, Phone#) values ('Sam', 'Smith', 
'North','Kennesaw','GA','35681','Dentist','P','04/03/18',404332111)
Insert into Personnel(FName, LName, Street, City, State, Zipcode, Position,PersonnelType, Hire_date, Phone#) values ('Ulfred', 'Chime', 
'West','Jonesboro','WX','22445','Dentist','F','05/09/20',673126444)

Delete from Personnel where PersonnelID = 1018
Delete from Personnel where PersonnelID = 1016
Delete from Personnel where PersonnelID = 1014
select * from Personnel
--drop table Personnel
Create Table Department
(
DepartmentCode	integer not null identity(100, 1),
DepartmentName	varchar(50),

Primary Key(DepartmentCode)
)
Insert into Department values('Radiology')
Insert into Department values('Cardiology')
Insert into Department values('ENT')
Insert into Department values('Emergency')
Insert into Department values('Primary Care')
select * from Department

Create Table Treatments
(
TreatmentDescription	varchar(50),
TreatmentCode			integer unique not null,
TreatmentCost			money,
Primary Key(TreatmentCode)
)
Insert into Treatments values('Lasic Surgery', 8821, 5000.00),('Kidney Stone', 3321, 2000.00),('Appendicitis', 2211, 1000.00),
('Dialysis', 4422, 10000.00),('Chemical burn', 2200, 7500.00)
select * from Treatments
Create Table Tests
(
TestDescription	varchar(50),
TestCost		money,
TestCode		integer unique not null,
Primary Key(TestCode)
)
select * from Tests
Insert into Tests values('Magnetic resonance imaging', 500.00, 221),('Angiography', 200.00, 333),('X-ray', 700.00, 990),
('Positron emission tomography', 1000.00, 667),('Bone marrow', 750.00, 556)

Create Table Phone
(
Phone#			integer not null,
PatientID		integer not null,
Primary Key(Phone#)
)
Insert into Phone values(40455512, 100),(40457812, 101),(40455517, 102),(41255512, 103),(67855512, 104)

Create Table Email
(
EmailID			varchar(50),
PatientID		integer not null,
Primary Key(EmailID)
)
Insert into Email values('gb@gmail.com', 100),('ig@email.com', 101),('op@yahoo.com', 102),('jk1@email.com', 103),('lg5@yahoo.com', 104)

select * from Phone
select * from Patient
select * from Email
select * from Personnel
select * from Department
Create Table PatientTests
(
TestCode	int		not null,
PatientID	int		not null,

Primary Key (TestCode, PatientID),
Foreign Key(TestCode) references Tests(TestCode),
Foreign Key(PatientID) references Patient(PatientID),
)
select * from PatientTests

Insert into PatientTests values(556, 100),(667, 101),(990, 102),(221, 103),(556, 104)
Create Table PatientTreatments
(
TreatmentCode	int		not null,
PatientID		int		not null,

Primary Key (TreatmentCode, PatientID),
Foreign Key(TreatmentCode) references Treatments(TreatmentCode),
Foreign Key(PatientID) references Patient(PatientID),
)
select * from PatientTreatments

Insert into PatientTreatments values(8821, 100),(3321, 101),(2211, 102),(4422, 103),(2200, 104)

Create Table PatientPersonnel
(
PersonnelID	int		not null,
PatientID	int		not null,

Primary Key (PersonnelID, PatientID),
Foreign Key(PersonnelID) references Personnel(PersonnelID),
Foreign Key(PatientID) references Patient(PatientID),
)
select * from PatientPersonnel

Insert into PatientPersonnel values(1000, 100),(1002, 101),(1004, 102),(1006, 103),(1008, 104)

Create Table OutPatient
(
PatientID		int not null,
CheckBackDate	date,

Primary Key(PatientID),
Foreign Key(PatientID) references Patient(PatientID),
)
Insert into OutPatient values(100,'10/21/21'),(101,'10/22/21')
select * from OutPatient


Create Table [Resident Patient]
(
PatientID		int not null,
DateDischarged	date,

Primary Key(PatientID),
Foreign Key(PatientID) references Patient(PatientID),
)
select * from [Resident Patient]

Insert into [Resident Patient] values(102,'10/23/21'),(103,'10/24/21'),(104,'10/25/21')
Create Table [Part Time]
(
PersonnelID		int not null,
HourlyRate		money,

Primary Key(PersonnelID),
Foreign Key(PersonnelID) references Personnel(PersonnelID),
)
Insert into [Part Time] values(1002,40),(1006,50),(1004,75)
select * from [Part Time]
Create Table [Full Time]
(
PersonnelID		int not null,
Salary			money,

Primary Key(PersonnelID),
Foreign Key(PersonnelID) references Personnel(PersonnelID),
)
Insert into [Full Time] values(1000,60000),(1008,70000)
--drop table[Full Time]
select * from [Full Time]