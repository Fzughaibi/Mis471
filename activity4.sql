-- النشاط الرابع: التعديل على البيانات باستخدام PL/SQL وجملة CASE
-- الخطوات 1 و 2: نفّذ S471user.SQL ثم students.sql
SET SERVEROUTPUT ON

-- 3) تخزين pass للطالب الذي يُدخل رمزه إذا كانت درجته >= 60
DECLARE
  v_id students.id%TYPE := &student_id;
BEGIN
  UPDATE students
     SET result = 'pass'
   WHERE id = v_id
     AND mark >= 60;
  DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);
  COMMIT;
END;
/

-- 4) pass إذا كانت الدرجة >= 60، وإلا fail (للطالب الذي يُدخل رمزه)
DECLARE
  v_id   students.id%TYPE := &student_id;
  v_mark students.mark%TYPE;
BEGIN
  SELECT mark INTO v_mark FROM students WHERE id = v_id;

  IF v_mark >= 60 THEN
    UPDATE students SET result = 'pass' WHERE id = v_id;
  ELSE
    UPDATE students SET result = 'fail' WHERE id = v_id;
  END IF;
  COMMIT;
END;
/

-- 5) تعديل النتيجة حسب جدول الدرجات باستخدام IF .. ELSIF
DECLARE
  v_id     students.id%TYPE := &student_id;
  v_mark   students.mark%TYPE;
  v_result students.result%TYPE;
BEGIN
  SELECT mark INTO v_mark FROM students WHERE id = v_id;

  IF v_mark >= 90 THEN
    v_result := 'Excellent';
  ELSIF v_mark >= 80 THEN
    v_result := 'Very Good';
  ELSIF v_mark >= 70 THEN
    v_result := 'Good';
  ELSIF v_mark >= 60 THEN
    v_result := 'Medium';
  ELSE
    v_result := 'Fail';
  END IF;

  UPDATE students SET result = v_result WHERE id = v_id;
  COMMIT;
END;
/

-- 6) نفس التمرين السابق باستخدام جملة CASE
DECLARE
  v_id     students.id%TYPE := &student_id;
  v_mark   students.mark%TYPE;
  v_result students.result%TYPE;
BEGIN
  SELECT mark INTO v_mark FROM students WHERE id = v_id;

  v_result := CASE
                WHEN v_mark >= 90 THEN 'Excellent'
                WHEN v_mark >= 80 THEN 'Very Good'
                WHEN v_mark >= 70 THEN 'Good'
                WHEN v_mark >= 60 THEN 'Medium'
                ELSE 'Fail'
              END;

  UPDATE students SET result = v_result WHERE id = v_id;
  COMMIT;
END;
/

SELECT * FROM students;
