<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>병사 목록</title>
</head>
<body>
<%@include file="top.jsp"%>
<div id="wrapper">
    <c:forEach var="soldier" items="${soldierList}">
        <div class="content-wrapper">
            <img src="${pageContext.request.contextPath}/resources/img/soldier.jpeg" alt="soldier"/>
            <div class="content-container">
                <div class="button-wrapper">
                    <button class="btn btn-outline-info" id="modify-btn" onclick="goEditPage(${soldier.id})">Edit</button>
                    <button class="btn btn-outline-danger" id="delete-btn" onclick=delete_ok(${board.id})>delete</button>
                </div>
                <div class="info-wrapper">
                    <div class="wrapper1">
                        <p><span>이름 : </span>${soldier.name}</p>
                        <p><span>생년월일 : </span>${soldier.birthDate}</p>
                        <p><span>키 : </span>${soldier.height}</p>
                        <p><span>몸무게 : </span>${soldier.weight}kg</p>
                    </div>
                    <div class="wrapper2">
                        <p><span>신체등급 : </span>${soldier.bodyGrade}</p>
                        <p><span>희망보직 : </span>${soldier.desiredPosition.split(',')[1]}</p>
                        <p><span>희망 입영월 : </span>${soldier.desiredDate}</p>
                            <%--                    <p>${soldier.certificate}</p>--%>
                    </div>
                </div>
            </div>
      </div>
    </c:forEach>
</div>
</body>
</html>
<script>
    const contextPath = "<%= request.getContextPath() %>";

    function goEditPage(id){
        window.location.href = contextPath + "/soldier/edit?id="+id;
    }
</script>
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
    #wrapper{
        padding-top: 40px;
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        height: 60vh;
        overflow: auto;
    }
    .content-wrapper {
        width: 50%;
        border: 1px solid black;
        padding: 10px;
        border-radius: 16px;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: flex-start;
        margin-bottom: 30px;

        >img{
            margin-left: 40px;
            width: 110px;
        }
    }
    .content-container{
        width: 75%;
    }
    .button-wrapper{
        display: flex;
        justify-content: flex-end;
    }
    .info-wrapper{
        display: flex;
        flex-direction: row;
        justify-content: space-around;

        > div >p{
            margin: 10px;
            font-weight: bolder;
            >span{
                font-weight: normal;
                color: gray;
        }
    }
    }
</style>