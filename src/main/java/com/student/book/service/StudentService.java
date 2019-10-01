package com.student.book.service;

import com.student.book.model.Student;

import java.util.List;

public interface StudentService {
  void addStudent(Student student);

  void updateStudent(Student student);

  void removeStudent(int id);

  Student getStudentById(int id);

  List<Student> listStudents();
}
