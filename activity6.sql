-- النشاط السادس: حلقات التكرار LOOP و WHILE و FOR
SET SERVEROUTPUT ON

CREATE TABLE t1 (
  s_number NUMBER(3),
  s_name   VARCHAR2(30)
);

-- ملاحظة: متغيرات الإحلال (&) في SQL*Plus تُقرأ مرة واحدة قبل التنفيذ،
-- لذلك تُمثَّل المدخلات المتتالية هنا بمصفوفة؛ الرقم 0 هو قيمة الخروج.
-- غيّر القيم كما تشاء لتجربة الخروج المبكر.

-- أ) WHILE .. LOOP: إضافة 3 سجلات، ويخرج إذا أُدخل 0
DECLARE
  TYPE t_nums  IS VARRAY(3) OF NUMBER;
  TYPE t_names IS VARRAY(3) OF VARCHAR2(30);
  nums  t_nums  := t_nums(1, 2, 0);
  names t_names := t_names('khalid', 'ali', 'sami');
  i     PLS_INTEGER := 1;
BEGIN
  WHILE i <= 3 LOOP
    EXIT WHEN nums(i) = 0;
    INSERT INTO t1 VALUES (nums(i), names(i));
    i := i + 1;
  END LOOP;
  COMMIT;
END;
/

-- ب) LOOP .. END LOOP: يستمر بالإدخال حتى تُدخل القيمة 0
DECLARE
  TYPE t_nums  IS TABLE OF NUMBER;
  TYPE t_names IS TABLE OF VARCHAR2(30);
  nums  t_nums  := t_nums(10, 20, 30, 0, 40);
  names t_names := t_names('hani', 'belal', 'rami', 'stop', 'rajab');
  i     PLS_INTEGER := 1;
BEGIN
  LOOP
    EXIT WHEN nums(i) = 0;
    INSERT INTO t1 VALUES (nums(i), names(i));
    i := i + 1;
  END LOOP;
  COMMIT;
END;
/

-- ج) FOR .. LOOP: إضافة 4 سجلات، ويخرج إذا أُدخل 0
DECLARE
  TYPE t_nums  IS VARRAY(4) OF NUMBER;
  TYPE t_names IS VARRAY(4) OF VARCHAR2(30);
  nums  t_nums  := t_nums(51, 52, 53, 54);
  names t_names := t_names('a', 'b', 'c', 'd');
BEGIN
  FOR i IN 1 .. 4 LOOP
    EXIT WHEN nums(i) = 0;
    INSERT INTO t1 VALUES (nums(i), names(i));
  END LOOP;
  COMMIT;
END;
/

SELECT * FROM t1;
