<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
<h2>Add New User</h2>
<form action="${pageContext.request.contextPath}/user/save" method="post" enctype="multipart/form-data">
    <label for="birthDate">생년월일:</label>
    <input type="date" name="birthDate" required/><br/>

    <label for="weight">몸무게:</label>
    <input type="number" name="weight" required/><br/>

    <label for="height">키:</label>
    <input type="number" name="height" required/><br/>

    <label for="name">이름:</label>
    <input type="text" name="name" required/><br/>

    <label for="desiredPosition">희망 보직:</label>
    <input type="text" name="desiredPosition" required/><br/>

    <label for="desiredEnlistmentDate">희망 입영 날짜:</label>
    <input type="text" name="desiredEnlistmentDate" required/><br/>

    <label for="physicalGrade">신체 등급:</label>
    <input type="number" name="physicalGrade" required/><br/>

    <label for="qualificationFile">보유 자격증 및 영어 성적 증명서:</label>
    <input type="file" name="qualificationFile" accept=".pdf,.doc,.docx,.jpg,.png"/><br/>

    <input type="submit" value="Add User"/>
</form>
<a href="${pageContext.request.contextPath}/user/list">Cancel</a>
</body>
</html>
