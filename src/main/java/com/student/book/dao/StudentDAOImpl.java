package com.student.book.dao;


import com.student.book.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;



@Repository
public class StudentDAOImpl implements StudentDAO {
    private static final Logger logger = LoggerFactory.getLogger(StudentDAOImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addStudent(Student student) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(student);
        logger.info("Student " + student + " was successfully saved.");

    }

    @Override
    public void updateStudent(Student student) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(student);
        logger.info("Student " + student + " was successfully updated.");

    }

    @Override
    public void removeStudent(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Student student = session.load(Student.class, new Integer(id));

        if (student != null) {
            session.delete(student);
        }

        logger.info("Student " + student + " was successfully removed");

    }

    @Override
    public Student getStudentById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Student student = session.load(Student.class, new Integer(id));
        logger.info("Student " + student + " was successfully loaded");
        return student;
    }


    @Override
    @SuppressWarnings("unchecked")
    public List<Student> listStudents() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Student> studentList = session.createQuery("from Student").list();
        for (Student ignored : studentList) {
            logger.info("Students list: " + studentList);
        }
        return studentList;
    }
}
