DROP TABLE students;

CREATE TABLE students(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT2
);

CREATE TABLE house(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
)
