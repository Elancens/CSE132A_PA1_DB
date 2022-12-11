CREATE TABLE customer (
  name varchar(25),
  credit int
  
);

CREATE TABLE loan (
  no varchar(25),
  type varchar(25),
  minCredit int
);

CREATE TABLE borrower (
  cname varchar(25),
  lno varchar(25),
  due varchar(25)
);

INSERT INTO customer (name, credit) VALUES ('Alan', 750);
INSERT INTO customer (name, credit) VALUES ('Bob', 500);
INSERT INTO customer (name, credit) VALUES ('Mike', 720);
INSERT INTO customer (name, credit) VALUES ('Steve', 730);
INSERT INTO customer (name, credit) VALUES ('John', 630);
INSERT INTO customer (name, credit) VALUES ('Odin', 450);
INSERT INTO customer (name, credit) VALUES ('A', 500);
INSERT INTO customer (name, credit) VALUES ('C', 500);
INSERT INTO customer (name, credit) VALUES ('D', 500);
INSERT INTO customer (name, credit) VALUES ('Z', 500);
INSERT INTO customer (name, credit) VALUES ('H', 500);

INSERT INTO loan (no, type, minCredit) VALUES (1, 'loanType1', 500);

INSERT INTO loan (no, type, minCredit) VALUES (2, 'loanType2', 550);
INSERT INTO loan (no, type, minCredit) VALUES (3, 'loanType3', 600);
INSERT INTO loan (no, type, minCredit) VALUES (4, 'loanType4', 650);
INSERT INTO loan (no, type, minCredit) VALUES (5, 'loanType5', 700);
INSERT INTO loan (no, type, minCredit) VALUES (6, 'loanType6', 750);

INSERT INTO loan (no, type, minCredit) VALUES (7, 'loanType7', 200);
INSERT INTO loan (no, type, minCredit) VALUES (8, 'loanType7', 200);
INSERT INTO loan (no, type, minCredit) VALUES (9, 'loanType7', 200);
INSERT INTO loan (no, type, minCredit) VALUES (10, 'jumbo', 200);
INSERT INTO loan (no, type, minCredit) VALUES (11, 'student', 200);




--Alan have all loan
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 1, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 2, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 2, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 3, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 4, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 5, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 6, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 7, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 7, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 7, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 7, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 7, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 10, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 11, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Alan', 12, 'NoData');


--Other loan 
INSERT INTO borrower (cname, lno, due) VALUES ('Odin', 5, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Odin', 8, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Odin', 9, 'NoData');

INSERT INTO borrower (cname, lno, due) VALUES ('John', 5, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('John', 8, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('John', 9, 'NoData');

INSERT INTO borrower (cname, lno, due) VALUES ('Steve', 5, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Mike', 5, 'NoData');

INSERT INTO borrower (cname, lno, due) VALUES ('A', 6, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('C', 6, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('D', 6, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('Z', 6, 'NoData');
INSERT INTO borrower (cname, lno, due) VALUES ('H', 6, 'NoData');
