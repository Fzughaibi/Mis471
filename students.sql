-- جدول الطلاب (students) المستخدم في النشاط الرابع والخامس
CREATE TABLE students (
  id     NUMBER(4),
  name   VARCHAR2(30),
  mark   NUMBER(2),
  result VARCHAR2(10)
);

INSERT INTO students (id, name, mark) VALUES (21, 'khalid', 90);
INSERT INTO students (id, name, mark) VALUES (22, 'ali',    85);
INSERT INTO students (id, name, mark) VALUES (23, 'sami',   78);
INSERT INTO students (id, name, mark) VALUES (24, 'hani',   65);
INSERT INTO students (id, name, mark) VALUES (25, 'belal',  55);
INSERT INTO students (id, name, mark) VALUES (26, 'rami',   48);
INSERT INTO students (id, name, mark) VALUES (27, 'rajab',  99);
INSERT INTO students (id, name, mark) VALUES (28, 'sami',   99);
COMMIT;
