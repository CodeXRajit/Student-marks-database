import pymysql as pym 

db=pym.connect(
host='localhost',
user='root',
password='Ktm@Rajit100!',
database='sql_student_data'
)

cursor = db.cursor()

cursor.execute("SELECT name FROM student_marks")
all_students = [name[0].lower() for name in cursor.fetchall()]  # lowercase for matching

subject_map = {
    "english": "english",
    "math": "math",
    "mathematics": "math",
    "nepali": "nepali",
    "science": "science",
    "social": "social_studies",
    "social studies": "social_studies"
}


user_input = input("You: ").strip().lower()

found_name = None
for student in all_students:
    if student in user_input:
        found_name = student.title() 
        break

found_subject = None
for key in subject_map:
    if key in user_input:
        found_subject = subject_map[key]
        break


if found_name:
    if found_subject:

        query = f"SELECT {found_subject} FROM student_marks WHERE name = %s"
        cursor.execute(query, (found_name,))
        result = cursor.fetchone()
        if result:
            print(f"Chatbot: {found_name}'s {found_subject.replace('_', ' ').title()} marks: {result[0]}")
        else:
            print("Chatbot: Sorry, no data found for that student.")
    else:
   
        query = """
        SELECT english, math, nepali, science, social_studies 
        FROM student_marks WHERE name = %s
        """
        cursor.execute(query, (found_name,))
        result = cursor.fetchone()
        if result:
            print(f"Chatbot: {found_name}'s marks - English: {result[0]}, Math: {result[1]}, Nepali: {result[2]}, Science: {result[3]}, Social Studies: {result[4]}")
        else:
            print("Chatbot: Sorry, no data found for that student.")
else:
    print("Chatbot: Sorry, I couldn't recognize the student name. Please try again.")

cursor.close()
db.close()