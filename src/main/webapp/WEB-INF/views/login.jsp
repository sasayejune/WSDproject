<%--
  Created by IntelliJ IDEA.
  User: hansungyu
  Date: 12/8/24
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<form action="${pageContext.request.contextPath}/auth/login_ok" method="post" id="loginForm" class="vertical">
    <input type="text" name="username" placeholder="id" autocomplete="off"/>
    <input type="password" name="password" placeholder="password" autocomplete="off"/>
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

    #loginForm{
        width: 35%;
        /*font-size: 1.6rem;*/

        input{
            margin-left: 10px;
            /*font-size: 1.4rem;*/
            background-color: transparent;
            border-radius: 16px;
            border: 1px solid black;
            outline: none;
            padding: 5px 0 5px 10px;
            margin-bottom: 20px;
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
