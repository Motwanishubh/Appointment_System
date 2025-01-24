-- 1. Total Number of Appointments for Each Doctor
SELECT d.first_name, d.last_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

-- 2. List All Patients Who Have an Appointment with Dr. John Smith
SELECT p.first_name, p.last_name
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Patients p ON a.patient_id = p.patient_id
WHERE d.first_name = 'John' AND d.last_name = 'Smith';

-- 3. Find the Number of Appointments Scheduled in a Specific Department
SELECT dep.department_name, COUNT(a.appointment_id) AS scheduled_appointments
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Departments dep ON d.department_id = dep.department_id
WHERE a.status = 'Scheduled'
GROUP BY dep.department_id, dep.department_name;

-- 4. Most Popular Specialty Based on Number of Appointments
SELECT s.specialty_name, COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Specialties s ON d.specialty_id = s.specialty_id
GROUP BY s.specialty_id, s.specialty_name
ORDER BY total_appointments DESC
LIMIT 1;

-- 5. Total Payment Amount for All Completed Appointments
SELECT SUM(p.payment_amount) AS total_completed_payments
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
WHERE a.status = 'Completed';

-- 6. Number of Patients Seen by Each Doctor
SELECT d.first_name, d.last_name, COUNT(DISTINCT a.patient_id) AS total_patients
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name;

-- 7. List All Patients Who Missed Their Appointments
SELECT p.first_name, p.last_name
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
WHERE a.status = 'Cancelled';

-- 8. Total Number of Appointments by Status
SELECT a.status, COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
GROUP BY a.status;

-- 9. Average Payment Amount for Completed Appointments
SELECT AVG(p.payment_amount) AS average_payment
FROM Payments p
JOIN Appointments a ON p.appointment_id = a.appointment_id
WHERE a.status = 'Completed';

-- 10. Doctor with the Highest Number of Appointments
SELECT d.first_name, d.last_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_appointments DESC
LIMIT 1;