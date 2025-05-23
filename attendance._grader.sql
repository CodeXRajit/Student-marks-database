USE sql_student_data;
SELECT 
    student_id,
    COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*) AS attendance_percentage
FROM 
    attendance
GROUP BY 
    student_id
HAVING 
    attendance_percentage >=75;
