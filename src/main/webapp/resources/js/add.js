window.onload = () => {
    const selectedValue = document.getElementById("desiredPosition").value
    setDetailOption(selectedValue)
}

let armyOption = ["기술행정병", "전문특기병", "어학병", "동반입대병", "직계가족복무부대병", "연고지복무병"] // 육군 보직 종류
let airForceOption = ["기술병", "전문특기병", "취업맞춤특기병", "임기제부사관"] // 공군 보직 종류
let navyOption = ["기술병", "동반입대병", "복무지역선택병", "전문특기병"] // 해군 보직 종류
let marineCorpsOption = ["기술병", "어학병", "동반입대병", "직계가족복무병"] // 해병대 보직 종류

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

    const combinedPosition = desiredPosition + '-' + desiredDetailPosition;

    document.querySelector('select[name="desiredPosition"]').remove();

    const hiddenPositionInput = document.createElement("input");
    hiddenPositionInput.type = "hidden";
    hiddenPositionInput.name = "desiredPosition";
    hiddenPositionInput.value = combinedPosition;


    form.append(hiddenPositionInput);

    console.log("Form Data:");
    const formData = new FormData(form);
    for (let [key, value] of formData.entries()) {
        console.log(key + ": " + value);
    }

    form.submit();
})