import pymysql as pym

db = pym.connect(
    host='localhost',
    user='root',
    password='Your password',
    database='sql_student_data'
)

cursor = db.cursor()

cursor.execute("SELECT name FROM students")
all_students = [name[0].lower() for name in cursor.fetchall()]

print("Chatbot: Hello! Ask me about studentd OR Type 'q' to quit.")

while True:
    user_input = input("You: ").strip().lower()
    if user_input == 'q':
        print("Chatbot: Goodbye!")
        break
    found_name = None
    for student in all_students:
        if student in user_input:
            found_name = student.title()
            break
    wants_attendance = "attendance" in user_input
    wants_marks = "mark" in user_input or "marks" in user_input
    if found_name:
        cursor.execute("SELECT student_id FROM students WHERE name = %s", (found_name,))
        student_row = cursor.fetchone()
        if student_row:
            student_id = student_row[0]
            if wants_attendance:
                query = """
                SELECT 
                    COUNT(CASE WHEN status = 'Present' THEN 1 END) * 100.0 / COUNT(*) AS attendance_percentage
                FROM attendance
                WHERE student_id = %s
                """
                cursor.execute(query, (student_id,))
                result = cursor.fetchone()
                if result and result[0] is not None:
                    print(f"Chatbot: {found_name}'s attendance: {result[0]:.2f}%")
                else:
                    print("Chatbot: No attendance data found for that student.")
            if wants_marks:
                query = """
                SELECT english, math, nepali, science, social_studies 
                FROM student_marks WHERE name = %s
                """
                cursor.execute(query, (found_name,))
                result = cursor.fetchone()
                if result:
                    print(f"Chatbot: {found_name}'s marks - English: {result[0]}, Math: {result[1]}, Nepali: {result[2]}, Science: {result[3]}, Social Studies: {result[4]}")
                else:
                    print("Chatbot: No marks data found for that student.")
            if not wants_marks and not wants_attendance:
                print("Chatbot: Please specify if you want 'marks' or 'attendance'.")
        else:
            print("Chatbot: Student not found.")
    else:
        print("Chatbot: I couldn’t recognize the student’s name. Please try again!")

cursor.close()
db.close()
