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

## add a new COLUMN
ALTER TABLE dis_channels
ADD location TEXT NULL;

##add values to a newly added column
UPDATE dis_channels 
SET location = 'County A'
WHERE sale_id =1001 OR sale_id = 1003
OR sale_id = 1006 OR sale_id = 1004;
