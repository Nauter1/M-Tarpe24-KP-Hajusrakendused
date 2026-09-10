let givenProfile=""
let profileName = ""
let profileId = ""
let profileLink = ""
let profileRepos = ""

let fetchProfile = async (personalToken) => {
    let fetchedData;
    const headers = new Headers()
    headers.set("Authorization",personalToken)
    
    await fetch(`https://api.github.com/users/${givenProfile}`,{
        headers
    }).then((response) => response.json()).then((data) => (fetchedData = data));
    profileName = fetchedData.login;
    profileId = fetchedData.id;
    profileRepos = fetchedData.public_repos;
    profileLink = fetchedData.url;
    renderContent();
}

const input = document.querySelector("input")
input.addEventListener("change", updateContent)

function updateContent(e){
    const personalToken = prompt("insert your github personal token :P")
    givenProfile = e.target.value
    fetchProfile(personalToken)
}

function renderContent(){
    document.getElementById("content").innerHTML = `
     <h2 id="name">Name: ${profileName}</h1>
     <p id="id">Id: ${profileId}</p>
     <p id="repos">Public repos: ${profileRepos}</p>
     <p id="profileurl">Link:<a href="${profileName}" target="_blank">/users/</a></p>
    `
}

renderContent();
