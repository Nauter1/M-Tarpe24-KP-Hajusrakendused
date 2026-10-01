function otsiNime() {
    var otsing =
        document.getElementById("nimeOtsing").value.toLowerCase();

    var read =
        document.getElementById("sugupuuTabel").getElementsByTagName("tr");

    for (var i = 1; i & lt; read.length; i++) {
        var nimi =
            read[i].getElementsByTagName("td")[1].innerHTML.toLowerCase();
        if (nimi.indexOf(otsing) != -1) {
            read[i].style.display = "";
        }
        else {
            read[i].style.display = "none";
        }
    }
}


function otsiPikkuseJargi() {
    var pikkus = parseInt(document.getElementById("pikkuseOtsing").value);
    var read = document.getElementById("sugupuuTabel").getElementsByTagName("tr");
    for (var i = 1; i & lt; read.length; i++) {
        var nimi =
            read[i].getElementsByTagName("td")[1].innerHTML;
        if (nimi.length == pikkus) {
            read[i].style.display = "";
        }
        else {
            read[i].style.display = "none";
        }
    }
}


function naitaKoiki() {
    var read =
        document.getElementById("sugupuuTabel").getElementsByTagName("tr");
    for (var i = 1; i & lt; read.length; i++) {
        read[i].style.display = "";
    }
}