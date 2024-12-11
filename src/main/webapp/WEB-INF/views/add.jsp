<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hansungyu
  Date: 12/10/24
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/resources/css/add.css" rel="stylesheet">
</head>
<body>
<form>
    <label for="name">이름</label>
    <input type="text" id="name" name="name"/>
    <label for="birthDate">생년월일</label>
    <input type="date" id="birthDate" name="birthDate"/>
    <label for="height">키(cm)</label>
    <input type="number" id="height" name="height"/>
    <label for="weight">몸무게</label>
    <input type="number" id="weight" name="weight"/>
    <label for="bodyGrade">신체등급</label>
    <input type="number" id="bodyGrade" name="bodyGrade"/>
    <label for="desiredPosition">희망보직</label>
    <input type="number" id="desiredPosition" name="desiredPosition"/>
    <label for="desiredDate">희망입영날짜</label>
    <input type="number" id="desiredDate" name="desiredDate"/>
    <label for="certificate">보유 자격증 및 영어 성적 증명서</label>
    <input type="file" id="certificate" name="certificate"/>
</form>
</body>
</html>
