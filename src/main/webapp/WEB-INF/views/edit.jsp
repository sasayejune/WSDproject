<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>병사 정보 수정</title>
    <link href="${pageContext.request.contextPath}/resources/css/edit.css?v=2" rel="stylesheet">
</head>
<body>
<form class="vertical" action="${pageContext.request.contextPath}/soldier/edit_ok" id="editForm" method="post">
    <input type="hidden" name="id" value="${soldier.id}"/> <!-- 병사 ID를 숨겨진 필드로 전달 -->

    <div class="horizontal">
        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${soldier.name}" required/>
    </div>
    <div class="horizontal">
        <label for="birthDate">생년월일</label>
        <input type="date" id="birthDate" name="birthDate" value="${soldier.birthDate}" required/>
    </div>
    <div class="horizontal">
        <label for="height">키(cm)</label>
        <input type="number" id="height" name="height" value="${soldier.height}" min="0" required/>
    </div>
    <div class="horizontal">
        <label for="weight">몸무게</label>
        <input type="number" id="weight" name="weight" value="${soldier.weight}" min="0" required/>
    </div>
    <div class="horizontal">
        <label for="bodyGrade">신체등급</label>
        <input type="number" id="bodyGrade" name="bodyGrade" value="${soldier.bodyGrade}" min="0" max="6" required/>
    </div>
    <div class="horizontal">
        <label for="desiredPosition">희망보직</label>
        <select id="desiredPosition" onchange="setDetailOption(this.value)" name="desiredPosition">
            <option value="육군" ${soldier.desiredPosition.startsWith('육군') ? 'selected' : ''}>육군</option>
            <option value="공군" ${soldier.desiredPosition.startsWith('공군') ? 'selected' : ''}>공군</option>
            <option value="해군" ${soldier.desiredPosition.startsWith('해군') ? 'selected' : ''}>해군</option>
            <option value="해병대" ${soldier.desiredPosition.startsWith('해병대') ? 'selected' : ''}>해병대</option>
        </select>
        <select id="desiredDetailPosition" name="desiredDetailPosition">
            <!-- 세부 보직은 JavaScript로 동적으로 추가 -->
        </select>
    </div>
    <div class="horizontal">
        <label for="desiredDate">희망입영날짜</label>
        <input type="month" id="desiredDate" name="desiredDate" value="${soldier.desiredDate.split('~')[0]}"/>
        <span>~</span>
        <input type="month" id="desiredDate2" name="desiredDate2" value="${soldier.desiredDate.split('~')[1]}"/>
    </div>
    <button type="submit">수정</button>
</form>

<script>
    window.onload = () => {
        const selectedValue = document.getElementById("desiredPosition").value;
        setDetailOption(selectedValue);
    }

    let armyOption = ["기술행정병", "전문특기병", "어학병", "카투사", "동반입대병", "취업맞춤특기병", "임기제부사관", "직계가족복무부대병", "연고지복무병"];
    let airForceOption = ["기술병", "임기제부사관", "취업맞춤특기병"];
    let navyOption = ["기술병", "동반입대병", "임기제부사관", "취업맞춤특기병", "복무지역선택병", "전문 특기병"];
    let marineCorpsOption = ["기술병", "임기제부사관", "취업맞춤특기병", "동반입대병", "직계가족복무병", "전문특기병"];

    function setDetailOption(option) {
        const positionSelect = document.getElementById("desiredDetailPosition");
        positionSelect.replaceChildren();
        let detailOption;

        if (option === "육군") detailOption = armyOption;
        if (option === "해군") detailOption = navyOption;
        if (option === "공군") detailOption = airForceOption;
        if (option === "해병대") detailOption = marineCorpsOption;

        // 기존 병사의 세부 보직을 선택
        const currentDetailPosition = "${soldier.desiredPosition.split('-')[1]}";

        detailOption.forEach((itm) => {
            const option = document.createElement("option");
            option.value = itm;
            option.textContent = itm;
            if (itm === currentDetailPosition) {
                option.selected = true; // 현재 세부 보직 선택
            }
            positionSelect.appendChild(option);
        });
    }
</script>
</body>
</html>
