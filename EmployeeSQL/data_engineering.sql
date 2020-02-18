CREATE TABLE employees (
	Employee_Number INT PRIMARY KEY NOT NULL,
	Birth_Date DATE NOT NULL,
	First_Name VARCHAR(255) NOT NULL,
	Last_Name VARCHAR(255) NOT NULL,
	Gender VARCHAR(255) NOT NULL,
	Hire_Date DATE NOT NULL
);

CREATE TABLE titles (
	Employee_Number INT REFERENCES employees(Employee_Number),
	Title VARCHAR(255) NOT NULL,
	From_Date DATE NOT NULL,
	To_Date DATE NOT NULL
);

CREATE TABLE salaries (
	Employee_Number INT REFERENCES employees(Employee_Number),
	Salary MONEY,
	From_Date DATE NOT NULL, 
	To_Date DATE NOT NULL,
	PRIMARY KEY (Employee_Number, Salary)
);

CREATE TABLE dept_emp (
	Employee_Number INT REFERENCES employees(Employee_Number),
	Department_Number VARCHAR(255) REFERENCES departments(Department_Number), 
	From_Date DATE NOT NULL, 
	To_Date DATE NOT NULL,
	PRIMARY KEY(Employee_Number, Department_Number)
);

CREATE TABLE dept_manager (
	Department_Number VARCHAR REFERENCES departments(Department_Number),
	Employee_Number INT REFERENCES employees(Employee_Number),
	From_Date DATE NOT NULL, 
	To_Date DATE NOT NULL,
	PRIMARY KEY(Department_Number, Employee_Number)
);

CREATE TABLE departments (
	Department_Number VARCHAR(255) PRIMARY KEY NOT NULL, 
	Department_Name VARCHAR(255) NOT NULL
);

COPY employees(Employee_Number, Birth_Date, First_Name, Last_Name, Gender, Hire_Date)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/employees.csv' DELIMITER ',' CSV HEADER;

COPY salaries(Employee_Number, Salary, From_Date, To_Date)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/salaries.csv' DELIMITER ',' CSV HEADER;

COPY titles(Employee_Number, Title, From_Date, To_Date)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/titles.csv' DELIMITER ',' CSV HEADER;

COPY departments(Department_Number, Department_Name)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/departments.csv' DELIMITER ',' CSV HEADER;

COPY dept_manager(Department_Number, Employee_Number, From_Date, To_Date)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY dept_emp(Employee_Number, Department_Number, From_Date, To_Date)
FROM '/Users/topiaslemetyinen/GT-ATL-DATA-PT-12-2019-U-C/homework/09-SQL/instructions/data/dept_emp.csv' DELIMITER ',' CSV HEADER;