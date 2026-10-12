-- النشاط الثامن: المؤشرات الصريحة - تطبيق على جدول المدرسين
-- نفّذ teachers.sql أولاً
SET SERVEROUTPUT ON

DECLARE
  CURSOR c_teachers IS SELECT code, salary FROM teachers FOR UPDATE;
  v_inc teachers.increase%TYPE;
BEGIN
  FOR t IN c_teachers LOOP
    v_inc := CASE
               WHEN t.salary < 6000  THEN 500
               WHEN t.salary < 8000  THEN 300
               ELSE 200
             END;

    UPDATE teachers
       SET increase = v_inc,
           salary   = salary + v_inc
     WHERE CURRENT OF c_teachers;
  END LOOP;
  COMMIT;
END;
/

SELECT * FROM teachers;
