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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%--    브라우저에서 캐싱된 파일을 호출해서 servlet.xml에 캐시 무효와 설정 추가--%>
</head>
<body>
<form class="vertical" action="${pageContext.request.contextPath}/add_ok" id="addForm" method="post">
    <div class="horizontal">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" required autocomplete="off"/>
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
        <label for="weight">몸무게(kg)</label>
        <input type="number" id="weight" name="weight" min="0" required/>
    </div>
    <div class="horizontal">
        <label for="bodyGrade">신체등급</label>
        <input type="number" id="bodyGrade" name="bodyGrade" min="0" max="6" required/>
    </div>
    <div class="horizontal">
        <label for="desiredPosition">희망보직</label>
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
        <label for="desiredDate">희망 입영 월</label>
        <select id="desiredDate" name="desiredDate">
            <option value="2024-01" selected>2024-01</option>
            <option value="2024-02">2024-02</option>
            <option value="2024-03">2024-03</option>
        </select>
    </div>
<%--    <div class="horizontal">--%>
<%--        <label for="certificate">보유 자격증 및 영어 성적 증명서</label>--%>
<%--        <input type="file" id="certificate" name="certificate"/>--%>
<%--    </div>--%>
    <button type="submit" class="btn btn-outline-dark" id="submitBtn">Submit</button>
</form>
</body>
</html>
<style>
    html{
        font-size: 16px;
    }
    body{
        width: 100vw;
        height: 100vh;
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .vertical{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%;
    }

    .horizontal{
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        width: 100%;
    }


    body{
        background-image: url(${pageContext.request.contextPath}/resources/img/battleCap.png);
        background-size: 40%;
        background-repeat: no-repeat;
        background-position: center;
    }

    #addForm{
        width: 35%;
        /*font-size: 1.6rem;*/
        .horizontal{
            margin-bottom: 20px;
        }
        input{
            margin-left: 10px;
            /*font-size: 1.4rem;*/
            background-color: transparent;
            border-radius: 16px;
            border: 1px solid black;
            outline: none;
            padding: 5px 0 5px 10px;
        }
        select{
            margin-left: 10px;
            /*font-size: 1.4rem;*/
            background-color: transparent;
            border-radius: 16px;
            border: 1px solid black;
            outline: none;
            padding: 5px 0 5px 10px;
        }
    }

    #submitBtn{
        width: 150px
        /*font-size: 1.5rem;*/
    }
</style>
<script src="${pageContext.request.contextPath}/resources/js/add.js?v=1"></script>