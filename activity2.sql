-- النشاط الثاني: كتابة استعلامات SQL على الجداول
-- (نفّذ activity1.sql أو S471TablesData.SQL أولاً)

-- أ) رقم الزبون صاحب الفاتورة 600
SELECT code_cust FROM invoices WHERE code = 600;

-- ب) اسم الزبون صاحب الفاتورة 600
SELECT c.name
  FROM customers c JOIN invoices i ON i.code_cust = c.code
 WHERE i.code = 600;

-- ت) أرقام الأصناف في الفاتورة 600
SELECT code_item FROM daily WHERE code_inv = 600;

-- ث) أسماء الأصناف في الفاتورة 600
SELECT it.name
  FROM items it JOIN daily d ON d.code_item = it.code
 WHERE d.code_inv = 600;

-- ج) رقم السلعة fine
SELECT code FROM items WHERE name = 'fine';

-- ح) أرقام الفواتير التي ظهرت بها السلعة fine
SELECT d.code_inv
  FROM daily d JOIN items it ON it.code = d.code_item
 WHERE it.name = 'fine';

-- خ) أرقام الزبائن الذين اشتروا السلعة fine
SELECT DISTINCT i.code_cust
  FROM invoices i
  JOIN daily d  ON d.code_inv = i.code
  JOIN items it ON it.code = d.code_item
 WHERE it.name = 'fine';

-- د) أسماء الزبائن الذين اشتروا السلعة fine
SELECT DISTINCT c.name
  FROM customers c
  JOIN invoices i ON i.code_cust = c.code
  JOIN daily d    ON d.code_inv = i.code
  JOIN items it   ON it.code = d.code_item
 WHERE it.name = 'fine';

-- ذ) أسماء الأصناف التي اشتراها الزبون علي (ali) بتاريخ 2004/06/15
SELECT it.name
  FROM customers c
  JOIN invoices i ON i.code_cust = c.code
  JOIN daily d    ON d.code_inv = i.code
  JOIN items it   ON it.code = d.code_item
 WHERE c.name = 'ali'
   AND i.inv_date = TO_DATE('2004/06/15', 'YYYY/MM/DD');
