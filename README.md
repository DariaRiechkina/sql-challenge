# sql-challenge
Link to  Entity Relationship Diagram of the tables
https://app.quickdatabasediagrams.com/#/
![QuickDBD-export (2)](https://github.com/DariaRiechkina/sql-challenge/assets/142356334/ce5cbf87-cbea-4f71-8c12-742db3a7fb97)

# Data Engineering

The schema consists of several tables that represent an organizational structure. 

**Tables:**

1. **titles**: Contains titles that employees can hold.
2. **employees**: Holds details about employees including their number, title ID, birth date, first name, last name, sex, and hire date.
3. **salaries**: Maintains the salaries associated with each employee number.
4. **departments**: Lists the various departments within the organization.
5. **dept_emp**: Connects employees to their respective departments.
6. **dept_manager**: Links departments to their respective managers.

Several foreign key constraints have been applied to maintain referential integrity across these tables.

### Filling with Data

*Ensure that data from CSV files has been imported to your database by running queries. All the Data places in CSV files in Data folder*

---

# Data Analysis

The following queries allow us to analyze the data:

1. **Managers of Departments**:
    - Retrieves the department number, department name, manager's employee number, and their full name.
    - Utilizes `LEFT JOIN` to join tables based on employee numbers and department numbers.
  
2. **Employees in Departments**:
    - Retrieves the department number, employee number, employee's full name, and department name.
    - Uses `LEFT JOIN` operations similar to the previous query.

3. **Employees Named 'Hercules' with Last Name Starting with 'B'**:
    - Fetches the first name, last name, and sex of employees named 'Hercules' where their last name starts with the letter 'B'.

4. **Employees in the Sales Department**:
    - Retrieves the employee number and full name of those working in the 'Sales' department.

5. **Employees in Sales and Development Departments**:
    - Similar to the above query, but expands the search to include both the 'Sales' and 'Development' departments.

6. **Most Common Last Names**:
    - Groups employees by their last names, counts the occurrences of each last name, and orders the result in descending order based on frequency.

---

*To utilize these queries, ensure that the database schema is set up as described in the 'Data Engineering' section and that it is populated with relevant data. Once that is done, the queries in the 'Data Analysis' section can be executed to obtain insights from the data.*
