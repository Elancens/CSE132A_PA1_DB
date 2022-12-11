SELECT j.name AS name, j.lno AS no
FROM loan l, (customer c join borrower b on c.name = b.cname) j
WHERE l.no = j.lno AND l.minCredit > j.credit;
--DELIM
SELECT j.name AS name, count(j.lno) AS "loanCount"
FROM (customer c LEFT JOIN borrower b ON b.cname = c.name) j
GROUP BY j.name;
--DELIM
CREATE VIEW  loancount AS
SELECT j.type AS type, count(j.lno) AS count
FROM (loan l LEFT JOIN borrower b ON l.no = b.lno) j
GROUP BY j.type;
    
SELECT l.type AS "loanType"
FROM loancount l
WHERE l.count = (SELECT min(count) FROM loancount);

DROP VIEW loancount;
--DELIM
CREATE VIEW LoanTypes AS
SELECT DISTINCT l1.type
FROM loan l1;

SELECT name AS name
FROM customer c
WHERE NOT EXISTS (	SELECT *
 					FROM LoanTypes lt
 					WHERE NOT EXISTS (	SELECT *
 										FROM (loan l LEFT JOIN borrower b ON l.no = b.lno) j
 										WHERE j.cname = c.name AND j.type = lt.type));

DROP VIEW LoanTypes;
--DELIM
CREATE VIEW  loanCountByType AS
	SELECT DISTINCT j.type AS type, count(j.lno) AS count
	FROM (loan l LEFT JOIN borrower b ON l.no = b.lno) j
	GROUP BY j.type;
    
    
CREATE VIEW loanAverageByType AS
	SELECT lcbt.type, (lcbt.count*1.0/temp.lcount) AS average
   FROM loanCountByType lcbt, (SELECT l.type, count(l.no) AS lcount
			 					FROM loan l
							 	GROUP BY l.type) temp
   WHERE temp.type = lcbt.type;
			
CREATE VIEW  loanCountByLoan AS
	SELECT j.type, j.no, count(j.lno) AS lcount
	FROM (loan l LEFT JOIN borrower b ON l.no = b.lno) j
	GROUP BY j.no, j.type;
    
SELECT lcbl.no AS no
FROM loanCountByLoan lcbl, loanAverageByType labt
WHERE labt.type = lcbl.type AND lcbl.lcount > labt.average;

DROP VIEW loanCountByLoan;
DROP VIEW loanAverageByType;
DROP VIEW loanCountByType;
--DELIM
CREATE VIEW sharedLoanWithLno AS
SELECT j1.cname AS name1, j2.cname AS name2, j1.lno
FROM (customer c LEFT JOIN borrower b ON b.cname = c.name) j1, (customer c LEFT JOIN borrower b ON b.cname = c.name) j2
WHERE j1.lno = j2.lno AND j1.cname < j2.cname;

CREATE VIEW sharedLoanWithCount AS
SELECT s.name1, s.name2, count(s.lno)
FROM sharedLoanWithLno s
GROUP BY s.name1, s.name2;

CREATE VIEW loanCountByCustomer AS 
SELECT j.name AS name, count(j.lno) AS loanCount
FROM (customer c LEFT JOIN borrower b ON b.cname = c.name) j
GROUP BY j.name;

SELECT s.name1 AS name1, s.name2 AS name2
FROM loanCountByCustomer l1, loanCountByCustomer l2, sharedLoanWithCount s
WHERE l1.name = s.name1 AND l2.name = s.name2 AND l1.loanCount = l2.loanCount AND l1.loanCount = s.count;

DROP VIEW loanCountByCustomer;
DROP VIEW sharedLoanWithCount;
DROP VIEW sharedLoanWithLno;
