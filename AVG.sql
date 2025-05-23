-- avg_marks
CREATE TABLE AVG_MARKS
SELECT
AVG(math) AS avg_math,
AVG(science) AS avg_science,
AVG(english) AS avg_english,
AVG(social_studies) AS avg_social,
AVG(nepali) AS avg_nepali
FROM marks 

