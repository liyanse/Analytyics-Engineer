# STRUCTURED QUERY LANGUAGE (SQL)
The course is designed for beginners to SQL and database management systems, and will introduce common database management topics.

Throughout the course we'll be looking at various topics including schema design, basic C.R.U.D operations, aggregation, nested queries, joins, keys and much more.

## Introduction to Databases
### 1. What is a Database?

Any collection of related information. It could be on paper, a phonebook, on a computer.

### 2. Why we need a database?
- reduce the amount of time you spend managing data.
- analyse data in a variety of ways.
- promote a disciplined approach to data management.
- turn disparate information into a valuable resource.
- improve the quality and consistency of information.

### 3. Database Management Systems

It is a special software program that helps users create and maintain a database;
- Makes it easy to manage large amounts of information
- Handles security
- Backups
- Importing/exporting data
- Concurrency
- Interacts with software applications

The main operations of DBMS are
    1. CRUD Operations; 
- Create, 
- Read, 
- Update, 
- Delete

### 4. Types of Databases
##### Relational Database(SQL)

Organize data into one or more tables
- Each table has columns and rows
- A unqiue key identifies each row

##### Non-Relational Database

Organize data in anything but a traditional table
- Key value stores
- Documents such as json or xml
- Graphs
- Flexible tables

### 5. Database QUery

Queries are requests made to the dbms for specific information.

As the database's structure become more and more complex, it becomes more difficult to get the specific pieces of information we want.

For example, a google search is a query

## Understanding Tables

All tables in relational databases are going to have columns(vertical entry) and rows(horizontal entry).

When creating tables, we always want to have a special attribute value called Primary Key that is a unique attribute that is used to identify specific rows.

For example,  ID can be the primary key since it is unique for each employee.

### 1. Keys
1. Primary key 

It is the first key used to identify one and only one instance of an entity uniquely. It could be a surrogate key, a key that was generated randomly and has no meaning in the real world or it could be a natural key, like a person's Id number or social security number.

2. Candidate key

A candidate key is an attribute or set of attributes that can uniquely identify a tuple.

In a table, SSN, Passport_Number, License_Number, etc., are considered a candidate key.

3. Super Key

Super key is an attribute set that can uniquely identify a tuple. A super key is a superset of a candidate key.

The name of two employees can be the same, but their EMPLYEE_ID can't be the same. Hence, this combination can also be a key.

The super key would be EMPLOYEE-ID (EMPLOYEE_ID, EMPLOYEE-NAME).

4. Foreign key

Foreign keys are the column of the table used to point to the primary key of another table.

5. Alternate key

There may be one or more attributes or a combination of attributes that uniquely identify each tuple in a relation. These attributes or combinations of the attributes are called the candidate keys. One key is chosen as the primary key from these candidate keys, and the remaining candidate key, if it exists, is termed the alternate key. In other words, the total number of the alternate keys is the total number of candidate keys minus the primary key. The alternate key may or may not exist. If there is only one candidate key in a relation, it does not have an alternate key.

## SQL Basics

SQL is a language that is used for interacting with Relational Database Management System (RDBMS)

You can use SQL to get the RDBMS to;
- Create,retrieve, update & delete data
- Create & manage databases
- Design & create databases tables
- Perform administration tasks( security, user namagement, import, export)

SQL implementations vary between systems like Microsoft SQL Server, Postgress, MySQL

It's basically 4 types of languages in one;

### 1. Data Query Language(DQL)
- Used to query database for information
- Get information that is already stored there

### 2. Data Definition Language(DDL)
- Used for defining database schema

### 3. Data Control Language(DCL)
- Used for controlling access to the data in the database
- User & permissions management

### 4. Data Manipulation Language(DML)
-Used for inserting, updating and deletig data from the database

### Queries

A set of instructions given to thr RDBMS (wrtten in SQL) that tell the RDBMS what information you want it to retrieve for you
- Tons od data in db
- Often hidden in a complex schema
- Goal is to only get the data you need

#### Order of Execution

The order of execution of sql queries is not the same as how the queries are written on the database management systems. The most basic order of writing SQL tables is, SELECT () FROM * WHERE GROUP BY ORDER BY;
However, when executing, we need to focus on the fact all this data is stored in memory therefore this is how data is retrieved whenw e perfom a query. 
FROM > WHERE > GROUP BY> SELECT > ORDER BY>

For this reason, we need to have a set of rules and regulations for perfoming SQL Queries. These rules include;


## Working with SQL

We are going to download and install two application
1. MySQL can be downloaded at https://dev.mysql.com/downloads/installer/
2. PopSQL can be downloaded at https://popsql.com/download
