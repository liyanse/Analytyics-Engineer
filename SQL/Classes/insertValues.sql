##Add the first columns into our table
INSERT INTO employee VALUES(1, 'Jack', 'FrontEnd', '10000');

## retrieve all the information from the table
select * from employee


INSERT INTO employee (employee_id, name, department, salary) VALUES
(2, 'Kate','Marketing','4000'),
(3,'Claire','AI','5000'),
(4,'Jack','HR','8000')
;

## update rows
update employee set department = "FE"
where department="Frontend"