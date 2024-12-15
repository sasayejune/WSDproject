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
    <link href="${pageContext.request.contextPath}/resources/css/add.css?v=2" rel="stylesheet">
<%--    브라우저에서 캐싱된 파일을 호출해서 servlet.xml에 캐시 무효와 설정 추가--%>
</head>
<body>
<form class="vertical" action="${pageContext.request.contextPath}/add_ok" id="addForm" method="post">
    <div class="horizontal">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" required/>
    </div>
    <div class="horizontal">
        <label for="birthDate">생년월일</label>
        <input type="date" id="birthDate" name="birthDate" required/>
    </div>
    <div class="horizontal">
        <label for="height">키(cm)</label>
        <input type="number" id="height" name="height" min="0" required/>
    </div>
    <div class="horizontal">
        <label for="weight">몸무게</label>
        <input type="number" id="weight" name="weight" min="0" required/>
    </div>
    <div class="horizontal">
        <label for="bodyGrade">신체등급</label>
        <input type="number" id="bodyGrade" name="bodyGrade" min="0" max="6" required/>
    </div>
    <div class="horizontal">
        <label for="desiredPosition">희망보직</label>
<%--        <input type="text" id="desiredPosition" name="desiredPosition"/>--%>
        <select id="desiredPosition" onchange="setDetailOption(this.value)" name="desiredPosition">
            <option value="육군" selected>육군</option>
            <option value="공군">공군</option>
            <option value="해군">해군</option>
            <option value="해병대">해병대</option>
        </select>
        <select id="desiredDetailPosition">

        </select>
    </div>
    <div class="horizontal">
        <label for="desiredDate">희망입영날짜</label>
        <input type="month" id="desiredDate" name="desiredDate" required/>
        <span>~</span>
        <input type="month" id="desiredDate2" name="desiredDate2" required/>
    </div>
<%--    <div class="horizontal">--%>
<%--        <label for="certificate">보유 자격증 및 영어 성적 증명서</label>--%>
<%--        <input type="file" id="certificate" name="certificate"/>--%>
<%--    </div>--%>
    <button type="submit">submit</button>
</form>
</body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/add.js
</script>