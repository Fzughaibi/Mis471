-- جدول المدرسين (teachers) المستخدم في النشاط الثامن
CREATE TABLE teachers (
  code     NUMBER(3),
  name     VARCHAR2(20),
  salary   NUMBER(5),
  increase NUMBER(4)
);

INSERT INTO teachers (code, name, salary) VALUES (21, 'khalid', 5900);
INSERT INTO teachers (code, name, salary) VALUES (22, 'ali',    6200);
INSERT INTO teachers (code, name, salary) VALUES (23, 'sami',   7000);
INSERT INTO teachers (code, name, salary) VALUES (24, 'hani',   8500);
INSERT INTO teachers (code, name, salary) VALUES (25, 'belal',  7900);
INSERT INTO teachers (code, name, salary) VALUES (26, 'rami',   4800);
INSERT INTO teachers (code, name, salary) VALUES (27, 'rajab',  6500);
COMMIT;
