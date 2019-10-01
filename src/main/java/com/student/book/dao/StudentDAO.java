package com.student.book.dao;

import com.student.book.model.Student;

import java.util.List;

public interface StudentDAO {
  void addStudent(Student student);

  void updateStudent(Student student);

  void removeStudent(int id);

  Student getStudentById(int id);

  List<Student> listStudents();
}
