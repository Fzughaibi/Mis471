-- النشاط العاشر: كتابة الدوال (Functions) والإجراءات (Procedures)
SET SERVEROUTPUT ON

-- متوسط أربعة أرقام
CREATE OR REPLACE FUNCTION func_avg (
  a NUMBER, b NUMBER, c NUMBER, d NUMBER
) RETURN NUMBER IS
BEGIN
  RETURN (a + b + c + d) / 4;
END func_avg;
/

-- القيمة الأصغر بين أربعة أرقام
CREATE OR REPLACE FUNCTION func_min (
  a NUMBER, b NUMBER, c NUMBER, d NUMBER
) RETURN NUMBER IS
BEGIN
  RETURN LEAST(a, b, c, d);
END func_min;
/

-- القيمة الأكبر بين أربعة أرقام
CREATE OR REPLACE FUNCTION func_max (
  a NUMBER, b NUMBER, c NUMBER, d NUMBER
) RETURN NUMBER IS
BEGIN
  RETURN GREATEST(a, b, c, d);
END func_max;
/

-- التبديل بين قيمتي رقمين
CREATE OR REPLACE PROCEDURE proc_swap (
  a IN OUT NUMBER,
  b IN OUT NUMBER
) IS
  tmp NUMBER;
BEGIN
  tmp := a;
  a   := b;
  b   := tmp;
END proc_swap;
/

-- تجربة
DECLARE
  x NUMBER := 25;
  y NUMBER := 12;
BEGIN
  DBMS_OUTPUT.PUT_LINE('avg = ' || func_avg(10, 20, 30, 40));
  DBMS_OUTPUT.PUT_LINE('min = ' || func_min(10, 20, 30, 40));
  DBMS_OUTPUT.PUT_LINE('max = ' || func_max(10, 20, 30, 40));
  DBMS_OUTPUT.PUT_LINE('Before swap: x = ' || x || ', y = ' || y);
  proc_swap(x, y);
  DBMS_OUTPUT.PUT_LINE('After swap:  x = ' || x || ', y = ' || y);
END;
/
