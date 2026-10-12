-- النشاط الحادي عشر: الحزم (Packages) في PL/SQL
-- نفّذ students.sql أولاً
SET SERVEROUTPUT ON

-- 1) student_package
CREATE OR REPLACE PACKAGE student_package IS
  PROCEDURE new_student (
    p_id     IN students.id%TYPE,
    p_name   IN students.name%TYPE,
    p_mark   IN students.mark%TYPE,
    p_result IN students.result%TYPE DEFAULT NULL
  );
  PROCEDURE update_student (
    p_id     IN students.id%TYPE,
    p_result IN students.result%TYPE
  );
  PROCEDURE delete_student (p_id IN students.id%TYPE);
END student_package;
/

CREATE OR REPLACE PACKAGE BODY student_package IS
  PROCEDURE new_student (
    p_id     IN students.id%TYPE,
    p_name   IN students.name%TYPE,
    p_mark   IN students.mark%TYPE,
    p_result IN students.result%TYPE DEFAULT NULL
  ) IS
  BEGIN
    INSERT INTO students (id, name, mark, result)
    VALUES (p_id, p_name, p_mark, p_result);
    COMMIT;
  END new_student;

  PROCEDURE update_student (
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

  PROCEDURE delete_student (p_id IN students.id%TYPE) IS
  BEGIN
    DELETE FROM students WHERE id = p_id;
    IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('error: Student number not exist');
    END IF;
    COMMIT;
  END delete_student;
END student_package;
/

-- 2) math_package
CREATE OR REPLACE PACKAGE math_package IS
  PROCEDURE swap (a IN OUT NUMBER, b IN OUT NUMBER);
  FUNCTION func_avg (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER;
  FUNCTION func_max (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER;
  FUNCTION func_min (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER;
END math_package;
/

CREATE OR REPLACE PACKAGE BODY math_package IS
  PROCEDURE swap (a IN OUT NUMBER, b IN OUT NUMBER) IS
    tmp NUMBER;
  BEGIN
    tmp := a;
    a   := b;
    b   := tmp;
  END swap;

  FUNCTION func_avg (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a + b + c + d) / 4;
  END func_avg;

  FUNCTION func_max (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN GREATEST(a, b, c, d);
  END func_max;

  FUNCTION func_min (a NUMBER, b NUMBER, c NUMBER, d NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN LEAST(a, b, c, d);
  END func_min;
END math_package;
/

-- 3) تعديل نتيجة طالب حسب درجته باستخدام student_package
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

  student_package.update_student(v_id, v_result);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('error: Student number not exist');
END;
/

-- 4) حذف طالب برمزه
BEGIN
  student_package.delete_student(&student_id);
END;
/

-- 5) إضافة سجل طالب ببيانات من المستخدم
BEGIN
  student_package.new_student(&id, '&name', &mark, NULL);
END;
/

-- 6) متوسط وأعلى وأدنى قيمة من أربع قيم
DECLARE
  a NUMBER := &a;
  b NUMBER := &b;
  c NUMBER := &c;
  d NUMBER := &d;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Values: ' || a || ', ' || b || ', ' || c || ', ' || d);
  DBMS_OUTPUT.PUT_LINE('Average = ' || math_package.func_avg(a, b, c, d));
  DBMS_OUTPUT.PUT_LINE('Max     = ' || math_package.func_max(a, b, c, d));
  DBMS_OUTPUT.PUT_LINE('Min     = ' || math_package.func_min(a, b, c, d));
END;
/

-- 7) تبديل قيمتين (swap موجود داخل math_package)
DECLARE
  a NUMBER := &first;
  b NUMBER := &second;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Before: a = ' || a || ', b = ' || b);
  math_package.swap(a, b);
  DBMS_OUTPUT.PUT_LINE('After:  a = ' || a || ', b = ' || b);
END;
/
