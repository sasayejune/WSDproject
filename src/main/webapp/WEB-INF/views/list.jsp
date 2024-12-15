<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>병사 목록</title>
</head>
<body>
<h1>병사 목록</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>이름</th>
        <th>생년월일</th>
        <th>신장</th>
        <th>체중</th>
        <th>신체 등급</th>
        <th>희망 직위</th>
        <th>희망 날짜</th>
        <th>증명서</th>
        <th>Actions</th> <!-- Actions 열 추가 -->
    </tr>
    </thead>
    <tbody>
    <c:forEach var="soldier" items="${soldierList}">
        <tr>
            <td>${soldier.id}</td>
            <td>${soldier.name}</td>
            <td>${soldier.birthDate}</td>
            <td>${soldier.height}</td>
            <td>${soldier.weight}</td>
            <td>${soldier.bodyGrade}</td>
            <td>${soldier.desiredPosition.split(',')[1]}</td> <!-- 두 번째 값만 출력 -->
            <td>${soldier.desiredDate.split(',')[1]}</td> <!-- 두 번째 값만 출력 -->

            <td>${soldier.certificate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/soldier/view?id=${soldier.id}">View</a>
                <a href="${pageContext.request.contextPath}/soldier/edit?id=${soldier.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<button onclick="goAddPage()">병사 추가</button>
<button onclick="goViewPage()">입영 가능 날짜 조회</button>
</body>
</html>
<script>
    const contextPath = "<%= request.getContextPath() %>";

    function goAddPage(){
        window.location.href = contextPath + "/add";
    }

    function goViewPage(){
        window.location.href = contextPath + "/view";
    }
</script>
