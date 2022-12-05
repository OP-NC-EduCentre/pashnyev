/*
Line / Position	Description
L036	1 / 1	
Select targets should be on a new line unless there is only one select target.
L028	1 / 8	
Unqualified reference 'price' found in single table select.
L028	1 / 15	
Unqualified reference 'type_spr' found in single table select.
L014	2 / 6	
Unquoted identifiers must be consistently lower case.
L026	3 / 7	
Reference 'spr.price' refers to table/view not found in the FROM clause or found in ancestor statement.
L028	3 / 7	
Qualified reference 'spr.price' found in single table select which is inconsistent with previous references.
L007	3 / 17	
Operators near newlines should be after, not before the newline
L004	4 / 1	
Incorrect indentation type found in file.
L003	4 / 5	
Expected 0 indentations, found 4 [compared to line 03]
*/

SELECT price, type_spr
FROM SPR
WHERE spr.price >
				(SELECT AVG(price) FROM spr);
            

