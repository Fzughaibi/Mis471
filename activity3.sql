-- النشاط الثالث: استعلامات SQL وتعريف المتغيرات ومقدمة في PL/SQL
SET SERVEROUTPUT ON

-- 3-أ) أسماء الزبائن الذين اشتروا السلعة fine
SELECT DISTINCT c.name
  FROM customers c
  JOIN invoices i ON i.code_cust = c.code
  JOIN daily d    ON d.code_inv = i.code
  JOIN items it   ON it.code = d.code_item
 WHERE it.name = 'fine';

-- 3-ب) أسماء الأصناف التي اشتراها علي بتاريخ 2004/06/15
SELECT it.name
  FROM customers c
  JOIN invoices i ON i.code_cust = c.code
  JOIN daily d    ON d.code_inv = i.code
  JOIN items it   ON it.code = d.code_item
 WHERE c.name = 'ali'
   AND i.inv_date = TO_DATE('2004/06/15', 'YYYY/MM/DD');

-- 4) تعريف المتغيرات
DECLARE
  Age       INTEGER;
  FirstName VARCHAR2(30);
  DateBirth DATE;
  Salary    FLOAT := 4308.5;
  Name      customers.name%TYPE;
  customer  customers%ROWTYPE;
BEGIN
  NULL;
END;
/

-- 5) طباعة بيانات الطالب
DECLARE
  v_num  NUMBER(9)    := 321205412;
  v_name VARCHAR2(30) := 'Sami Ahmed Ali';
  v_date DATE         := TO_DATE('20/5/1997', 'DD/MM/YYYY');
BEGIN
  DBMS_OUTPUT.PUT_LINE('Student Number: ' || v_num);
  DBMS_OUTPUT.PUT_LINE('Student Name: '   || v_name);
  DBMS_OUTPUT.PUT_LINE('Birth Date: '     || TO_CHAR(v_date, 'DD/MM/YYYY'));
END;
/

-- 6) نفس البرنامج لكن بإدخال المستخدم
DECLARE
  v_num  NUMBER(9)    := &student_number;
  v_name VARCHAR2(30) := '&student_name';
  v_date DATE         := TO_DATE('&birth_date', 'DD/MM/YYYY');
BEGIN
  DBMS_OUTPUT.PUT_LINE('Student Number: ' || v_num);
  DBMS_OUTPUT.PUT_LINE('Student Name: '   || v_name);
  DBMS_OUTPUT.PUT_LINE('Birth Date: '     || TO_CHAR(v_date, 'DD/MM/YYYY'));
END;
/

-- 7) تبديل (swap) قيمتي a و b
DECLARE
  a   NUMBER := 25;
  b   NUMBER := 12;
  tmp NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Before swap: a = ' || a || ', b = ' || b);
  tmp := a;
  a   := b;
  b   := tmp;
  DBMS_OUTPUT.PUT_LINE('After swap:  a = ' || a || ', b = ' || b);
END;
/
