## Update feature works when we are trying to change a value column in a table

#Change column value
UPDATE refinery_table
SET items_sold = 9000
WHERE sale_id = 1;

#delete row
DELETE FROM refinery_table
WHERE sale_id = 1007

#rename table
ALTER refinery_table
RENAME TO ref_table;