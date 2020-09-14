CREATE TABLE IF NOT EXISTS competences (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

CREATE TABLE IF NOT EXISTS students (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

CREATE TABLE IF NOT EXISTS students_comp (
id INTEGER PRIMARY KEY AUTOINCREMENT,
comp_id INTEGER,
student_id INTEGER,
status TEXT,
FOREIGN KEY (comp_id) REFERENCES competences(id),
FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO competences (name) VALUES 
("C1"),
("C2"),
("C3");

SELECT * FROM competences;

INSERT INTO students (name) VALUES
("Fatima"),
("Deborah"),
("Steeven"),
("Camille"),
("Maxim"),
("Lucas"),
("Chloé"),
("Pierre"),
("Isa"),
("Julie"),
("Voja"),
("Jojo"),
("Clement");

SELECT * FROM students;

INSERT INTO students_comp (comp_id, student_id, status) VALUES
(1,1, "Vert"),
(1,2, "Vert"),
(1,5, "Bleu"),
(1,3, "Bleu"),
(1,4, "Bleu"),
(1,12, "Violet"),
(1,8, "Violet"),
(1,13, "Violet"),
(2,1, "Vert"),
(2,2, "Vert"),
(2,3, "Vert"),
(2,4, "Vert"),
(2,6, "Bleu"),
(2,7, "Bleu"),
(2,8, "Bleu"),
(2,12, "Violet"),
(3,9, "Bleu"),
(3,10, "Bleu"),
(3,11, "Bleu"),
(3,13, "Violet"),
(3,3, "Violet"),
(3,4, "Violet");

SELECT * FROM students_comp;

SELECT students.name, competences.name, students_comp.status FROM students
JOIN students_comp ON students.id = students_comp.student_id
JOIN competences ON students_comp.comp_id = competences.id
ORDER BY students.name, competences.name;

UPDATE students_comp 
SET status = "Vert" 
WHERE student_id = 10 AND comp_id = 3 ;
-- Ici je me (student_id = 10 c'est moi !) suis passée en vert sur la compétence C3...
