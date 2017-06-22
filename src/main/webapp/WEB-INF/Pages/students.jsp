<%--suppress ALL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Calibri, ;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

    </style>
</head>
<body background="http://s1.hostingkartinok.com/uploads/images/2012/10/9b5f28f249b60412a4cf9cbc7cf8af4b.jpg">


<br/>
<br/>

<h1 align="center">Student's List</h1>

<c:if test="${!empty listStudents}">
    <div class="tg">
        <table align="center">
            <tr>
                <th width="80">ID</th>
                <th width="120">First Name</th>
                <th width="120">Last Name</th>
                <th width="120">Age</th>
                <th width="120">Email</th>
                <th width="60">Edit</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listStudents}" var="student">
                <tr>
                    <td align="center">${student.id}</td>
                    <td align="center"><a href="/studentdata/${student.id}" target="_blank">${student.firstName}</a></td>
                    <td align="center">${student.lastName}</td>
                    <td align="center">${student.age}</td>
                    <td align="center">${student.email}</td>
                    <td align="center"><a href="<c:url value='/edit/${student.id}'/>">Edit</a></td>
                    <td align="center"><a href="<c:url value='/remove/${student.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</c:if>



<c:url var="addAction" value="/students/add"/>

<form:form action="${addAction}" commandName="student">
    <table align="center">
        <c:if test="${!empty student.firstName}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message text="First Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="Last Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="Email"/>
                </form:label>
            </td>
            <td>
                <form:input path="email"/>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <c:if test="${!empty student.firstName}">
                    <input type="submit"
                           value="<spring:message text="Edit Student"/>"/>
                </c:if>
                <c:if test="${empty student.firstName}">
                    <input type="submit"
                           value="<spring:message text="Add Student"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
    <p align="center">Вернуться <a href="../../index.jsp">назад</a></p>
</form:form>
</body>
</html>

