-- النشاط الأول: تصميم وإنشاء الجداول وإدخال البيانات
-- الخطوة 1: نفّذ S471user.SQL لإنشاء مستخدم جديد (ملف المقرر)

-- الخطوة 2: إنشاء الجداول
CREATE TABLE customers (
  code    NUMBER(4) NOT NULL,
  name    VARCHAR2(30),
  address VARCHAR2(30),
  CONSTRAINT pk_customers PRIMARY KEY (code)
);

CREATE TABLE invoices (
  code      NUMBER(4) NOT NULL,
  inv_date  DATE,
  amount    NUMBER(6,2),
  code_cust NUMBER(4) NOT NULL,
  CONSTRAINT pk_invoices PRIMARY KEY (code),
  CONSTRAINT fk_inv_cust FOREIGN KEY (code_cust) REFERENCES customers (code)
);

CREATE TABLE items (
  code       NUMBER(4) NOT NULL,
  name       VARCHAR2(30),
  quantity   NUMBER(4),
  unit_price NUMBER(6,2),
  CONSTRAINT pk_items PRIMARY KEY (code)
);

CREATE TABLE daily (
  code_inv  NUMBER(4) NOT NULL,
  code_item NUMBER(4) NOT NULL,
  quantity  NUMBER(4),
  CONSTRAINT pk_daily PRIMARY KEY (code_inv, code_item),
  CONSTRAINT fk_daily_inv  FOREIGN KEY (code_inv)  REFERENCES invoices (code),
  CONSTRAINT fk_daily_item FOREIGN KEY (code_item) REFERENCES items (code)
);

-- الخطوة 3: إدخال البيانات
INSERT INTO customers VALUES (10,  'khalid', 'buraydah');
INSERT INTO customers VALUES (20,  'ali',    'riadh');
INSERT INTO customers VALUES (30,  'sami',   'unaizah');
INSERT INTO customers VALUES (40,  'ratib',  'buraydah');
INSERT INTO customers VALUES (50,  'khalid', 'buraydah');
INSERT INTO customers VALUES (60,  'samear', 'qassim');
INSERT INTO customers VALUES (70,  'belal',  'qassim');
INSERT INTO customers VALUES (80,  'belal',  'qassim');
INSERT INTO customers VALUES (90,  'majdi',  'qassim');
INSERT INTO customers VALUES (100, 'salem',  'onayzah');

INSERT INTO invoices VALUES (1000, TO_DATE('22/05/2008','DD/MM/YYYY'), 582,   90);
INSERT INTO invoices VALUES (400,  TO_DATE('02/08/2009','DD/MM/YYYY'), 32.5,  50);
INSERT INTO invoices VALUES (500,  TO_DATE('02/05/2010','DD/MM/YYYY'), 552,   60);
INSERT INTO invoices VALUES (600,  TO_DATE('15/06/2004','DD/MM/YYYY'), 112,   20);
INSERT INTO invoices VALUES (700,  TO_DATE('12/05/2010','DD/MM/YYYY'), 542,   60);
INSERT INTO invoices VALUES (800,  TO_DATE('02/09/2009','DD/MM/YYYY'), 552,   70);
INSERT INTO invoices VALUES (900,  TO_DATE('02/06/2010','DD/MM/YYYY'), 314,   80);
INSERT INTO invoices VALUES (200,  TO_DATE('20/08/2010','DD/MM/YYYY'), 312.5, 10);
INSERT INTO invoices VALUES (300,  TO_DATE('20/05/2008','DD/MM/YYYY'), 214.5, 10);

INSERT INTO items VALUES (1, 'fine',     6,   12.5);
INSERT INTO items VALUES (2, 'sugar',    20,  22.5);
INSERT INTO items VALUES (3, 'tona',     60,  2.5);
INSERT INTO items VALUES (4, 'coffee',   6,   25.5);
INSERT INTO items VALUES (5, 'pepsi',    161, 1.5);
INSERT INTO items VALUES (6, 'meat',     16,  52.5);
INSERT INTO items VALUES (7, 'fish',     6,   10.5);
INSERT INTO items VALUES (8, 'sardean',  34,  2.5);
INSERT INTO items VALUES (9, 'tomatoes', 15,  35);

-- جدول daily: (code_inv, code_item) والكمية غير معطاة في البيانات
INSERT INTO daily (code_inv, code_item) VALUES (200, 1);
INSERT INTO daily (code_inv, code_item) VALUES (200, 2);
INSERT INTO daily (code_inv, code_item) VALUES (200, 3);
INSERT INTO daily (code_inv, code_item) VALUES (300, 1);
INSERT INTO daily (code_inv, code_item) VALUES (300, 2);
INSERT INTO daily (code_inv, code_item) VALUES (300, 4);
INSERT INTO daily (code_inv, code_item) VALUES (300, 5);
INSERT INTO daily (code_inv, code_item) VALUES (400, 9);
INSERT INTO daily (code_inv, code_item) VALUES (400, 8);
INSERT INTO daily (code_inv, code_item) VALUES (500, 6);
INSERT INTO daily (code_inv, code_item) VALUES (500, 7);
INSERT INTO daily (code_inv, code_item) VALUES (500, 8);
INSERT INTO daily (code_inv, code_item) VALUES (600, 1);
INSERT INTO daily (code_inv, code_item) VALUES (600, 2);
INSERT INTO daily (code_inv, code_item) VALUES (600, 3);
INSERT INTO daily (code_inv, code_item) VALUES (600, 4);
INSERT INTO daily (code_inv, code_item) VALUES (700, 7);
INSERT INTO daily (code_inv, code_item) VALUES (700, 8);
INSERT INTO daily (code_inv, code_item) VALUES (700, 6);
INSERT INTO daily (code_inv, code_item) VALUES (800, 5);
INSERT INTO daily (code_inv, code_item) VALUES (800, 6);
INSERT INTO daily (code_inv, code_item) VALUES (800, 7);
INSERT INTO daily (code_inv, code_item) VALUES (900, 8);
INSERT INTO daily (code_inv, code_item) VALUES (900, 9);
INSERT INTO daily (code_inv, code_item) VALUES (1000, 9);
COMMIT;
