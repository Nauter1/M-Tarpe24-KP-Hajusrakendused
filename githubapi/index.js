let givenProfile="";
let profileName = "";
let profileId = "";
let profileLink = "";
let profileRepos = "";

function renderPage(){
    document.getElementById("app").innerHTML = `
    <div>
    <h1>Github Profile Viewer</h1>
    <p>Please enter profile name: </p>
    <input />
     <div class="content">
     <h1 id="name">Name: ${profileName}</h1>
     <p id="id">Id: ${profileid}</p>
     <p id="repos">Public repos: ${profileRepos}</p>
     <p id="profileurl">Link: ${profileLink}<a href="${profileName}" target="_blank">/users/</a></p>
     </div>
    </div>
    `;
}

renderPage();

const input = document.querySelector("input");
input.addEventListener("change",updateValue);

function updateValue(e){
    givenProfile = e.target.value;
    fetchProfile();
}

let fetchProfile = async () => {
    let fetchedData;

    await fetch(`https://api.github.com/users/${}`).then((response) => response.json()).then((data) => (fetchedData = data));

    profileName = fetchedData.login;
    profileId = fetchedData.id;
    profileLink = fetchedData.node_id;
}