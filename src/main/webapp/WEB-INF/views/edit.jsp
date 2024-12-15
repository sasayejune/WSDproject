<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
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
        <select id="desiredPosition" name="desiredPosition" onchange="setDetailOption(this.value)">
            <option value="">선택하세요</option>
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
    };

    const armyOption = ["기술행정병", "전문특기병", "어학병", "카투사", "동반입대병", "취업맞춤특기병", "임기제부사관", "직계가족복무부대병", "연고지복무병"]; // 육군 보직 종류
    const airForceOption = ["기술병", "임기제부사관", "취업맞춤특기병"]; // 공군 보직 종류
    const navyOption = ["기술병", "동반입대병", "임기제부사관", "취업맞춤특기병", "복무지역선택병", "전문 특기병"]; // 해군 보직 종류
    const marineCorpsOption = ["기술병", "임기제부사관", "취업맞춤특기병", "동반입대병", "직계가족복무병", "전문특기병"]; // 해병대 보직 종류

    function setDetailOption(option) {
        const positionSelect = document.getElementById("desiredDetailPosition");
        positionSelect.innerHTML = ''; // 기존 옵션 제거

        let detailOption;
        switch (option) {
            case "육군":
                detailOption = armyOption;
                break;
            case "해군":
                detailOption = navyOption;
                break;
            case "공군":
                detailOption = airForceOption;
                break;
            case "해병대":
                detailOption = marineCorpsOption;
                break;
            default:
                detailOption = [];
        }

        // 선택된 세부 보직이 있을 경우, 해당 보직을 기본 선택으로 설정
        const selectedDetailPosition = "${soldier.desiredPosition.split('-')[1] || ''}";

        detailOption.forEach(itm => {
            const optionElement = document.createElement("option");
            optionElement.value = itm;
            optionElement.textContent = itm;
            // 선택된 세부 보직이 현재 아이템과 같으면 selected 속성 추가
            if (itm === selectedDetailPosition) {
                optionElement.selected = true;
            }
            positionSelect.appendChild(optionElement);
        });
    }

    document.getElementById("editForm").addEventListener("submit", (e) => {
        e.preventDefault();

        const form = e.target;
        const desiredPosition = document.getElementById("desiredPosition").value;
        const desiredDetailPosition = document.getElementById("desiredDetailPosition").value;
        const desiredDate1 = document.getElementById("desiredDate").value;
        const desiredDate2 = document.getElementById("desiredDate2").value;

        const combinedPosition = desiredPosition + (desiredDetailPosition ? '-' + desiredDetailPosition : '');
        const combinedDate = desiredDate1 + '~' + desiredDate2;

        // 숨겨진 입력 필드 추가
        const hiddenPositionInput = document.createElement("input");
        hiddenPositionInput.type = "hidden";
        hiddenPositionInput.name = "desiredPosition";
        hiddenPositionInput.value = combinedPosition;

        const hiddenDateInput = document.createElement("input");
        hiddenDateInput.type = "hidden";
        hiddenDateInput.name = "desiredDate";
        hiddenDateInput.value = combinedDate;

        form.append(hiddenPositionInput, hiddenDateInput);
        form.submit();
    });
</script>
</body>
</html>
