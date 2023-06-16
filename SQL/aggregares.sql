### An aggregate function in SQL performs a calculation on multiple values and returns a single value. SQL provides many aggregate functions that include avg, count, sum, min, max, etc. An aggregate function ignores NULL values when it performs the calculation, except for the count function. 

##avg
SELECT AVG (salary)

FROM employees; 

##count
SELECT COUNT(product_id)
FROM Products
WHERE unit_price>4;

##min
SELECT MIN(quantity_in_stock)
FROM products;

###max
SELECT MAX(quantity_in_stock)
FROM products;
