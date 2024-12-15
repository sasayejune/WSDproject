<%--
  Created by IntelliJ IDEA.
  User: hansungyu
  Date: 12/15/24
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div id="content-wrapper">
    <div id="home-wrapper">
        <img alt="img" src="${pageContext.request.contextPath}/resources/img/battleCap.png"/>
        <p><span>병무청</span> 보조 서비스</p>
    </div>
    <div id="button-container">
        <button type="button" class="btn btn-outline-success" onclick="goAddPage()">추가하기</button>
        <button type="button" class="btn btn-outline-success" onclick="goViewPage()">입영신청 조회</button>
        <button type="button" class="btn btn-outline-success" onclick="goMyPage()">내 정보</button>

    </div>
</div>
</body>
</html>
<style>
    html{
        font-size: 16px;
    }
    #content-wrapper{
        display: flex;
        flex-direction: row;
        width: 100%;
        justify-content: space-around;
    }

    #home-wrapper{
        display: flex;
        flex-direction: row;
        align-items: center;

        img{
            width: 100px;
        }
        span{
            font-size: 1.6rem;
            font-weight: bold;
            color: green;
        }
    }
</style>
<script>
    const contextPath = "<%= request.getContextPath() %>";

    function goAddPage() {
        window.location.href = contextPath + "/add";
    }

    function goMyPage(){
        window.location.href = contextPath + "/list";
    }

    function goViewPage(){
        window.location.href = contextPath + "/";
    }
</script>