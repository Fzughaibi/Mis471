-- النشاط الخامس: معالجة الاستثناءات (Exceptions) في PL/SQL
-- الخطوة 2: نفّذ students.sql
SET SERVEROUTPUT ON

-- 3) طباعة بيانات الطالب برمزه، وإذا لم يوجد تُطبع رسالة خطأ
DECLARE
  v_id      students.id%TYPE := &student_id;
  v_student students%ROWTYPE;
BEGIN
  SELECT * INTO v_student FROM students WHERE id = v_id;
  DBMS_OUTPUT.PUT_LINE('ID: '     || v_student.id);
  DBMS_OUTPUT.PUT_LINE('Name: '   || v_student.name);
  DBMS_OUTPUT.PUT_LINE('Mark: '   || v_student.mark);
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_student.result);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('error: Student number not exist');
END;
/

-- 4) طباعة بيانات الطالب باسمه، وإذا تكرر الاسم (مثل sami) تُطبع رسالة خطأ
DECLARE
  v_name    students.name%TYPE := '&student_name';
  v_student students%ROWTYPE;
BEGIN
  SELECT * INTO v_student FROM students WHERE name = v_name;
  DBMS_OUTPUT.PUT_LINE('ID: '     || v_student.id);
  DBMS_OUTPUT.PUT_LINE('Name: '   || v_student.name);
  DBMS_OUTPUT.PUT_LINE('Mark: '   || v_student.mark);
  DBMS_OUTPUT.PUT_LINE('Result: ' || v_student.result);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('error: too many data found');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('error: Student name not exist');
END;
/

-- 5) مجموع الأعداد من 1 إلى n
-- A) LOOP .. END LOOP
DECLARE
  n   NUMBER := &n;
  i   NUMBER := 1;
  sum_ NUMBER := 0;
BEGIN
  LOOP
    EXIT WHEN i > n;
    sum_ := sum_ + i;
    i := i + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum (LOOP) = ' || sum_);
END;
/

-- B) WHILE .. LOOP
DECLARE
  n   NUMBER := &n;
  i   NUMBER := 1;
  sum_ NUMBER := 0;
BEGIN
  WHILE i <= n LOOP
    sum_ := sum_ + i;
    i := i + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum (WHILE) = ' || sum_);
END;
/

-- C) FOR .. LOOP
DECLARE
  n   NUMBER := &n;
  sum_ NUMBER := 0;
BEGIN
  FOR i IN 1 .. n LOOP
    sum_ := sum_ + i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum (FOR) = ' || sum_);
END;
/
