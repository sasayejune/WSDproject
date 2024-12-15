<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>병사 상세보기</title>
</head>
<body>
<h1>병사 상세보기</h1>
<p><strong>ID:</strong> ${soldier.id}</p>
<p><strong>이름:</strong> ${soldier.name}</p>
<p><strong>생년월일:</strong> ${soldier.birthDate}</p>
<p><strong>신장:</strong> ${soldier.height} cm</p>
<p><strong>체중:</strong> ${soldier.weight} kg</p>
<p><strong>신체 등급:</strong> ${soldier.bodyGrade}</p>
<p><strong>희망 직위:</strong> ${soldier.desiredPosition}</p>
<p><strong>희망 날짜:</strong> ${soldier.desiredDate}</p>
<p><strong>증명서:</strong> ${soldier.certificate}</p>
<a href="${pageContext.request.contextPath}/list">목록으로 돌아가기</a>
</body>
</html>
