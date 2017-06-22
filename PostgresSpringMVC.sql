CREATE DATABASE "student_tracker";

CREATE TABLE "students"

(
 "id" SERIAL,
 "first_name"   VARCHAR(24) NOT NULL,
 "last_name"    VARCHAR(32) NOT NULL,
 "age"   INTEGER NOT NULL,
 "email"   VARCHAR(24) DEFAULT NULL,
 PRIMARY KEY ("id")
);