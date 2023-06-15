## Creating table and adding respective columns
CREATE TABLE employee(
    employee_id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    department VARCHAR(20) UNIQUE
);

## Describe to see if table structure is similar to what we want
DESCRIBE employee;

## You can also drop table
DROP TABLE employee;

## alter table by either adding new columns or dropping columns
 ALTER TABLE employee add salary DECIMAL NOT NULL;