-- النشاط السابع: المؤشرات الصريحة (Explicit Cursors)
-- نفّذ students.sql أولاً
SET SERVEROUTPUT ON

-- 3-أ) LOOP .. EXIT WHEN مع متغيرات من نوع %TYPE
DECLARE
  CURSOR c_students IS SELECT id, mark FROM students;
  v_id   students.id%TYPE;
  v_mark students.mark%TYPE;
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO v_id, v_mark;
    EXIT WHEN c_students%NOTFOUND;

    IF v_mark >= 60 THEN
      UPDATE students SET result = 'pass' WHERE id = v_id;
    ELSE
      UPDATE students SET result = 'fail' WHERE id = v_id;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_id || ' - ' || v_mark);
  END LOOP;
  CLOSE c_students;
  COMMIT;
END;
/

-- 3-ب) LOOP .. EXIT WHEN مع متغير من نوع %ROWTYPE
DECLARE
  CURSOR c_students IS SELECT * FROM students;
  v_row c_students%ROWTYPE;
BEGIN
  OPEN c_students;
  LOOP
    FETCH c_students INTO v_row;
    EXIT WHEN c_students%NOTFOUND;

    IF v_row.mark >= 60 THEN
      UPDATE students SET result = 'pass' WHERE id = v_row.id;
    ELSE
      UPDATE students SET result = 'fail' WHERE id = v_row.id;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_row.id || ' - ' || v_row.name || ' - ' || v_row.mark);
  END LOOP;
  CLOSE c_students;
  COMMIT;
END;
/

-- 3-ج) FOR .. IN مع %ROWTYPE (الفتح والإغلاق تلقائي)
DECLARE
  CURSOR c_students IS SELECT * FROM students;
BEGIN
  FOR v_row IN c_students LOOP
    IF v_row.mark >= 60 THEN
      UPDATE students SET result = 'pass' WHERE id = v_row.id;
    ELSE
      UPDATE students SET result = 'fail' WHERE id = v_row.id;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_row.id || ' - ' || v_row.name || ' - ' || v_row.mark);
  END LOOP;
  COMMIT;
END;
/

SELECT * FROM students;
