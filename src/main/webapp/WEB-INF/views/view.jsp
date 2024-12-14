<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yejun
  Date: 24. 12. 12.
  Time: 오후 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
hello world
<div>
    <form>
        <select>
            <c:forEach items="${list}" var="soldier">
                <option value=${soldier.id}>${soldier.name}</option>
            </c:forEach>
        </select>
        <button type="submit">search</button>
    </form>
</div>
<table id="table-container" class="table table-hover">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">모집분야</th>
        <th scope="col">접수 기간</th>
        <th scope="col">입영 월</th>
        <th scope="col">모집 인원</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>hello</td>
        <td>hello</td>
        <td>hello</td>
        <td>hello</td>
    </tr>
    </tbody>
</table>
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

    #table-container{
        width: 70%;
        border: 1px solid black;
    }
</style>