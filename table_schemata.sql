CREATE TABLE employee (
	"emp_id" INT Primary Key NOT NULL,
    "title_id" VARCHAR NOT NULL,
    "birth_date" VARCHAR NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" CHAR NOT NULL,
    "hire_date" VARCHAR NOT NULL
);

CREATE TABLE "salary" (
    "emp_id" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_id"
     )
);

--CREATE TABLE salary (
  --  "emp_id" VARCHAR PRIMARY KEY NOT NULL,
    --"salary" INT   NOT NULL
--);

CREATE TABLE title (
    "title_id" VARCHAR  PRIMARY KEY NOT NULL,
    "title" VARCHAR   NOT NULL
);


CREATE TABLE department (
    "dept_id" VARCHAR(8) PRIMARY KEY  NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);



--CREATE TABLE dept_emp (
  --  "emp_id" INT   NOT NULL,
   -- "dept_id" INT   NOT NULL
--);

CREATE TABLE dept_manager (
    "dept_id" VARCHAR   NOT NULL,
    "emp_id" INT   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_id" INT   NOT NULL,
    "dept_id" VARCHAR   NOT NULL
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("title_id");

--struggle
ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");

--struggle
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_id" FOREIGN KEY("dept_id")
REFERENCES "department" ("dept_id");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_id" FOREIGN KEY("emp_id")
REFERENCES "employee" ("emp_id");