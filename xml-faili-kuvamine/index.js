document.getElementById("app").innerHTML = "<table id='xmlTable'></table>";

const xhttp = new XMLHttpRequest();
xhttp.open("GET","games.xml",false);
xhttp.send();
const XMLContent = xhttp.responseXML;

function getGamePlatforms(gameElement){
    const gamePlatforms = gameElement.getElementsByTagName("platform")
    let result = "";
    for (let i=0; i<gamePlatforms.length;i++){
        const element = gamePlatforms[i];
        result += element.textContent+"/"
    }
    return result
}
/*
element.getElementsByTagName("platforms")[0];
const platform = "";
        for (let x=0; x<platforms.length; x++)
        {
            platform = platforms.getElementsByTagName("platform")[x].textContent; + "/"
        }
*/

function generateTable(XMLContent){
    let tableRows = `<tr><th>--Game--</th><th>--Price--</th><th>--Platforms--</th></tr>`
    let gameElements = XMLContent.getElementsByTagName("game")
    console.log("gameElements",gameElements)
    for (let i=0; i < gameElements.length; i++){
        const element = gameElements[i];
        const title = element.getElementsByTagName("title")[0].textContent;
        const price = element.getElementsByTagName("price")[0].textContent;
        const platforms = getGamePlatforms(element)
        
        tableRows += `<tr><td>${title}</td><td>${price}</td><td>${platforms}</td></tr>`

    }
    document.getElementById("xmlTable").innerHTML = tableRows
}

generateTable(XMLContent)