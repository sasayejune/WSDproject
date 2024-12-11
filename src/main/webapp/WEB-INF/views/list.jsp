<%--
  Created by IntelliJ IDEA.
  User: hansungyu
  Date: 12/6/24
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Hello world</p>
<button onclick="goAddPage()">add</button>
</body>
</html>
<script>
    const contextPath = "<%= request.getContextPath() %>";

    function goAddPage(){
        window.location.href = contextPath + "/add";
    }
</script>
