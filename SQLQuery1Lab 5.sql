USE BADEKUNLE

select * from Patient
select * from Tests
select * from PatientTests
select * from Bed

Select Patient.PatientID, Patient.FName, Patient.LName, Patient.DOB, Bed.BedIdNumber
From Patient Join Bed ON 
Patient.PatientID = Bed.PatientID

select * from Treatments
select * from PatientTreatments
Select Patient.FName, Patient.LName, Patient.DOB, Treatments.TreatmentDescription
From Patient
Join PatientTreatments ON
Patient.PatientID = PatientTreatments.PatientID
JOIN Treatments ON
Treatments.TreatmentCode = PatientTreatments.TreatmentCode

Select Patient.FName, Patient.LName, Patient.DOB, Tests.TestDescription
From Patient
Join PatientTests ON
Patient.PatientID = PatientTests.PatientID
JOIN Tests ON
Tests.TestCode = PatientTests.TestCode

Select Patient.FName as [Patient FName], Patient.LName as [Patient LName], Personnel.FName as [Personnel FName], Personnel.LName as [Personnel LName], Personnel.Position
From Patient
Join PatientPersonnel ON
Patient.PatientID = PatientPersonnel.PatientID
JOIN Personnel ON
Personnel.PersonnelID = PatientPersonnel.PersonnelID

Select * from Patient Order By FName

Select Patient.FName, Patient.LName, Patient.DOB, Tests.TestDescription
From Patient
Join PatientTests ON
Patient.PatientID = PatientTests.PatientID
JOIN Tests ON
Tests.TestCode = PatientTests.TestCode
where City = 'Atlanta'

Select Patient.FName, Patient.LName, Patient.DOB, Treatments.TreatmentDescription, Patient.City
From Patient
Join PatientTreatments ON
Patient.PatientID = PatientTreatments.PatientID
JOIN Treatments ON
Treatments.TreatmentCode = PatientTreatments.TreatmentCode
where City in('Jonesboro','Woodstock')




