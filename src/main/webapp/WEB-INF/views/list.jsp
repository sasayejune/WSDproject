<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List</title>
</head>
<body>
<h2>User List</h2>
<table border="1">
    <tr>
        <th>이름</th>
        <th>생년월일</th>
        <th>몸무게</th>
        <th>키</th>
        <th>희망 보직</th>
        <th>희망 입영 날짜</th>
        <th>신체 등급</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.name}</td>
            <td>${user.birthDate}</td>
            <td>${user.weight}</td>
            <td>${user.height}</td>
            <td>${user.desiredPosition}</td>
            <td>${user.desiredEnlistmentDate}</td>
            <td>${user.physicalGrade}</td>
            <td>
                <a href="${pageContext.request.contextPath}/user/view?id=${user.id}">View</a>
                <a href="${pageContext.request.contextPath}/user/edit?id=${user.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/user/add">Add New User</a>
</body>
</html>
<script>
    const contextPath = "<%= request.getContextPath() %>";

    function goAddPage(){
        window.location.href = contextPath + "/add";
    }
</script>
