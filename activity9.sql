-- النشاط التاسع: الإجراءات المخزنة: الإضافة والتعديل والحذف
-- نفّذ students.sql أولاً
SET SERVEROUTPUT ON

-- 3) إجراء إدخال سجل في جدول الطلاب
CREATE OR REPLACE PROCEDURE insert_into_students (
  p_id     IN students.id%TYPE,
  p_name   IN students.name%TYPE,
  p_mark   IN students.mark%TYPE,
  p_result IN students.result%TYPE DEFAULT NULL
) IS
BEGIN
  INSERT INTO students (id, name, mark, result)
  VALUES (p_id, p_name, p_mark, p_result);
  COMMIT;
END insert_into_students;
/

-- 3-ب) إدخال الطالبين
BEGIN
  insert_into_students(30, 'khalid', 98);
  insert_into_students(40, 'sami',   99);
END;
/

-- 4) إجراء تعديل نتيجة طالب
CREATE OR REPLACE PROCEDURE update_student (
  p_id     IN students.id%TYPE,
  p_result IN students.result%TYPE
) IS
BEGIN
  UPDATE students SET result = p_result WHERE id = p_id;
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('error: Student number not exist');
  END IF;
  COMMIT;
END update_student;
/

-- 5) تعديل نتيجة الطالب 40 إلى Excellent
BEGIN
  update_student(40, 'Excellent');
END;
/

-- 6) إجراء حذف سجل طالب
CREATE OR REPLACE PROCEDURE delete_student (
  p_id IN students.id%TYPE
) IS
BEGIN
  DELETE FROM students WHERE id = p_id;
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('error: Student number not exist');
  END IF;
  COMMIT;
END delete_student;
/

-- 7) حذف الطالب 28
BEGIN
  delete_student(28);
END;
/

SELECT * FROM students;
