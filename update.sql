UPDATE loan
SET type = CASE type
		 	WHEN 'jumbo' THEN 'student'
			WHEN 'student' THEN 'jumbo'
			ELSE type
			END;
--DELIM
WITH deleted AS
(DELETE FROM borrower
WHERE cname IN (SELECT borrower.cname
            FROM borrower, loan
            WHERE loan.type = 'jumbo' AND loan.no = borrower.lno)
RETURNING cname)

DELETE FROM customer
WHERE name IN (SELECT cname
           FROM deleted);


DELETE FROM loan
WHERE type='jumbo'