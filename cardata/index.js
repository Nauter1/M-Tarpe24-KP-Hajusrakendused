const myjson = [
    { 
        Car: {
        color: "Rose Red",
        tintedWindows: false,
        wheels: 4,
        roofCargo: null,
        entertainment: ["FM Radio", "MP3, MP4 and MKV player","Harman/Kardon Speakers"],
        accessories: ["Satnav","Cruise Control"]
    }
    },
        { 
        Car: {
        color: "Navy Blue",
        tintedWindows: true,
        wheels: 4,
        roofCargo: "Thule",
        entertainment: ["FM Radio", "Apple Carplay","Bowers & Wilkins premium sound Speakers"],
        accessories: ["Self drive system","Luggage Cover"]
    }
    }
]

let dataHtml = `
<div id="json">
    <h1>Car Properties</h1>
    `
for (let i=0; i<myjson.length;i++){
dataHtml += 
`
    <h2>${i+1}. car</h2>
    <p>Color: ${myjson[i].Car.color}</p>
    <p>Tinted Windows: ${myjson[i].Car.tintedWindows}</p>
    <p>Wheels: ${myjson[i].Car.wheels}</p>
    <p>Roof Cargo: ${myjson[i].Car.roofCargo}</p>
    <p>Entertainment: ${myjson[i].Car.entertainment}</p>
    <p>Accessories: ${myjson[i].Car.accessories}</p>

`
}

dataHtml += `
</div>
`
    

document.getElementById("app").innerHTML = dataHtml