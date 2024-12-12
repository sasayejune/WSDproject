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
        <input type="text" id="name" name="name"/>
    </div>
    <div class="horizontal">
        <label for="birthDate">생년월일</label>
        <input type="date" id="birthDate" name="birthDate"/>
    </div>
    <div class="horizontal">
        <label for="height">키(cm)</label>
        <input type="number" id="height" name="height" min="0"/>
    </div>
    <div class="horizontal">
        <label for="weight">몸무게</label>
        <input type="number" id="weight" name="weight" min="0"/>
    </div>
    <div class="horizontal">
        <label for="bodyGrade">신체등급</label>
        <input type="number" id="bodyGrade" name="bodyGrade" min="0" max="6"/>
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
        <input type="month" id="desiredDate" name="desiredDate"/>
        <span>~</span>
        <input type="month" id="desiredDate2" name="desiredDate2"/>
    </div>
<%--    <div class="horizontal">--%>
<%--        <label for="certificate">보유 자격증 및 영어 성적 증명서</label>--%>
<%--        <input type="file" id="certificate" name="certificate"/>--%>
<%--    </div>--%>
    <button type="submit">submit</button>
</form>
</body>
</html>
<script>
    window.onload = () => {
        const selectedValue = document.getElementById("desiredPosition").value
        setDetailOption(selectedValue)
    }

    let armyOption = ["기술행정병", "전문특기병", "어학병", "카투사", "동반입대병", "취업맞춤특기병", "임기제부사관", "직계가족복무부대병", "연고지복무병"] // 육군 보직 종류
    let airForceOption = ["기술병", "임기제부사관", "취업맞춤특기병"] // 공군 보직 종류
    let navyOption = ["기술병", "동반입대병", "임기제부사관", "취업맞춤특기병", "복무지역선택병", "전문 특기병"] // 해군 보직 종류
    let marineCorpsOption = ["기술병", "임기제부사관", "취업맞춤특기병", "동반입대병", "직계가족복무병", "전문특기병"] // 해병대 보직 종류

    function setDetailOption(option){
        const positionSelect = document.getElementById("desiredDetailPosition");
        positionSelect.replaceChildren();
        let detailOption;

        if(option === "육군") detailOption = armyOption;
        if(option === "해군") detailOption = navyOption;
        if(option === "공군") detailOption = airForceOption;
        if(option === "해병대") detailOption = marineCorpsOption;

        detailOption.forEach((itm) => {
            const option = document.createElement("option");
            option.value = itm;
            option.textContent = itm;
            positionSelect.appendChild(option);
        })
    }
    document.getElementById("addForm").addEventListener("submit", (e) => {
        e.preventDefault();

        const form = e.target;

        const desiredPosition = document.getElementById("desiredPosition").value;
        const desiredDetailPosition = document.getElementById("desiredDetailPosition").value;
        const desiredDate1 = document.getElementById("desiredDate").value;
        const desiredDate2 = document.getElementById("desiredDate2").value;

        const combinedPosition = desiredPosition + '-' + desiredDetailPosition;
        const combinedDate = desiredDate1 + '~' + desiredDate2;

        document.querySelector('select[name="desiredPosition"]').remove();
        document.querySelector('input[name="desiredDate"]').remove();

        const hiddenPositionInput = document.createElement("input");
        hiddenPositionInput.type = "hidden";
        hiddenPositionInput.name = "desiredPosition";
        hiddenPositionInput.value = combinedPosition;

        const hiddenDateInput = document.createElement("input");
        hiddenDateInput.type = "hidden";
        hiddenDateInput.name = "desiredDate";
        hiddenDateInput.value = combinedDate;

        form.append(hiddenPositionInput);
        form.append(hiddenDateInput);

        console.log("Form Data:");
        const formData = new FormData(form);
        for (let [key, value] of formData.entries()) {
            console.log(key + ": " + value);
        }

        form.submit();
    })
</script>