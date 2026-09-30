<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

    <xsl:output encoding="UTF-8" method="html"/>
    <xsl:key name="inimeneNimeJargi" match="pereliige" use="nimi"/>
    <xsl:variable name="praeguneAasta" select="2026"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Elizabeth II sugupuu</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 30px;
                        background-color: #f5f5f5;
                    }

                    h1, h2 {
                        color: #333333;
                    }

                    table {
                        border-collapse: collapse;
                        margin-bottom: 30px;
                        background-color: white;
                    }

                    th {
                        background-color: #444444;
                        color: white;
                        padding: 8px;
                        border: 1px solid black;
                    }

                    td {
                        padding: 8px;
                        border: 1px solid black;
                    }

                    tr:nth-child(even) {
                        background-color: #eeeeee;
                    }

                    .otsing {
                        background-color: white;
                        padding: 15px;
                        margin-bottom: 30px;
                        border: 1px solid #cccccc;
                    }

                    .roheline {
                        background-color: lightgreen;
                    }

                    input {
                        padding: 5px;
                        margin: 5px;
                    }

                    button {
                        padding: 5px 10px;
                    }
                </style>
                <script type="text/javascript">
                    function otsiNime() {

                        var otsing =
                            document.getElementById("nimeOtsing").value.toLowerCase();

                        var read =
                            document.getElementById("sugupuuTabel")
                            .getElementsByTagName("tr");

                        for (var i = 1; i &lt; read.length; i++) {

                            var nimi =
                                read[i].getElementsByTagName("td")[1]
                                .innerHTML.toLowerCase();

                            if (nimi.indexOf(otsing) != -1) {
                                read[i].style.display = "";
                            }
                            else {
                                read[i].style.display = "none";
                            }
                        }
                    }


                    function otsiPikkuseJargi() {

                        var pikkus =
                            parseInt(
                                document.getElementById("pikkuseOtsing").value
                            );

                        var read =
                            document.getElementById("sugupuuTabel")
                            .getElementsByTagName("tr");

                        for (var i = 1; i &lt; read.length; i++) {

                            var nimi =
                                read[i].getElementsByTagName("td")[1]
                                .innerHTML;

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
                            document.getElementById("sugupuuTabel")
                            .getElementsByTagName("tr");

                        for (var i = 1; i &lt; read.length; i++) {
                            read[i].style.display = "";
                        }
                    }
                </script>
            </head>
            <body>
                <h1>Elizabeth II ja tema järglased</h1>
                <!-- 1. KÕIKIDE INIMESTE SÜNNIAASTAD -->
                <h2>1. Kõikide inimeste sünniaastad</h2>
                <xsl:for-each select="sugupuu/pereliige">
                    <xsl:value-of select="nimi"/>
                    -
                    <xsl:value-of select="@synniaasta"/>
                    <br/>
                </xsl:for-each>
                <!-- 2. VÄHEMALT KAKS LAST -->
                <h2>2. Inimesed, kellel on vähemalt kaks last</h2>
                <xsl:for-each select="sugupuu/pereliige">
                    <xsl:if test="count(lapsed/laps) &gt;= 2">
                        <p>
                            <b>
                                <xsl:value-of select="nimi"/>
                            </b>
                            -
                            <xsl:value-of select="count(lapsed/laps)"/>
                            last
                        </p>
                    </xsl:if>
                </xsl:for-each>
                <!-- 3. OTSINGUVORMID -->
                <h2>3. Otsing</h2>
                <div class="otsing">
                    <b>Otsi nime järgi:</b>
                    <input
                        type="text"
                        id="nimeOtsing"
                        placeholder="Sisesta nimi"/>

                    <button onclick="otsiNime()">
                        Otsi
                    </button>
                    <br/>
                    <b>Otsi nime pikkuse järgi:</b>
                    <input
                        type="number"
                        id="pikkuseOtsing"
                        placeholder="Pikkus"/>
                    <button onclick="otsiPikkuseJargi()">
                        Otsi
                    </button>
                    <br/>
                    <button onclick="naitaKoiki()">
                        Näita kõiki
                    </button>
                </div>
                <!-- 4. PÕHITABEL -->
                <h2>4. Sugupuu andmed tabelina</h2>
                <table id="sugupuuTabel">
                    <tr>
                        <th>Nr</th>
                        <th>Nimi</th>
                        <th>Sünniaasta</th>
                        <th>Vanemad</th>
                        <th>Vanavanemad</th>
                        <th>Laste arv</th>
                        <th>Vanus</th>
                        <th>Vanema sünniaastast</th>
                    </tr>
                    <xsl:for-each select="sugupuu/pereliige">
                        <tr>
                            <!-- Nr -->
                            <td>
                                <xsl:value-of select="position()"/>
                            </td>
                            <!-- Nimi -->
                            <td>
                                <xsl:if test="string-length(nimi) &lt; 7">
                                    <xsl:attribute name="class">
                                        roheline
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="nimi"/>
                            </td>
                            <!-- Sünniaasta -->
                            <td>
                                <xsl:value-of select="@synniaasta"/>
                            </td>
                            <!-- VANEMAD -->
                            <td>
                                <xsl:for-each select="vanemad/vanem">
                                    <xsl:value-of select="nimi"/>
                                    <xsl:if test="position() != last()">
                                        ,
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <!-- VANAVANEMAD -->
                            <td>
                                <xsl:for-each select="vanemad/vanavanem">
                                    <xsl:value-of select="nimi"/>
                                </xsl:for-each>
                                <xsl:for-each select="vanemad/vanem">
                                    <xsl:variable
                                        name="vanemaNimi"
                                        select="nimi"/>
                                    <xsl:for-each
                                        select="key('inimeneNimeJargi', $vanemaNimi)">
                                        <xsl:for-each select="vanemad/vanem">
                                            <br/>
                                            <xsl:value-of select="nimi"/>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </td>
                            <!-- LASTE ARV -->
                            <td>
                                <xsl:value-of select="count(lapsed/laps)"/>
                            </td>
                            <!-- LAPSE VANUS -->
                            <td>
                                <!--
                                    Ainult inimene, kellel ei ole lapsi.
                                -->
                                <xsl:if test="not(lapsed/laps)">
                                    <xsl:value-of
                                        select="$praeguneAasta - number(@synniaasta)"/>
                                    aastat
                                </xsl:if>
                                <xsl:if test="lapsed/laps">
                                    -
                                </xsl:if>
                            </td>
                            <!-- MITMENDAL VANEMA SÜNNIAASTAL -->
                            <td>
                                <xsl:for-each select="vanemad/vanem">
                                    <xsl:variable
                                        name="vanemaNimi"
                                        select="nimi"/>
                                    <xsl:for-each
                                        select="key('inimeneNimeJargi', $vanemaNimi)">
                                        <xsl:value-of
                                            select="number(current()/@synniaasta)
                                            - number(@synniaasta)"/>
                                    </xsl:for-each>
                                    <xsl:if test="position() != last()">
                                        aastat, 
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <!-- 5. NIMEDE PIKKUSED -->
                <h2>5. Nime pikkused</h2>
                <table>
                    <tr>
                        <th>Nimi</th>
                        <th>Pikkus</th>
                        <th>Vähem kui 7?</th>
                    </tr>
                    <xsl:for-each select="sugupuu/pereliige">
                        <tr>
                            <td>
                                <xsl:if test="string-length(nimi) &lt; 7">
                                    <xsl:attribute name="style">
                                        background-color:lightgreen
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="nimi"/>
                            </td>
                            <td>
                                <xsl:value-of select="string-length(nimi)"/>
                            </td>
                            <td>
                                <xsl:if test="string-length(nimi) &lt; 7">
                                    Jah
                                </xsl:if>
                                <xsl:if test="string-length(nimi) &gt;= 7">
                                    Ei
                                </xsl:if>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <!-- 6. NIMEDE OTSIMINE SÜMBOLI JÄRGI -->
                <h2>6. Nimede otsimine teatud sümboli järgi</h2>
                <p>
                    Näiteks nimed, milles esineb täht
                    <b>e</b>:
                </p>
                <xsl:for-each select="sugupuu/pereliige">
                    <xsl:if test="contains(nimi, 'e')">
                        <xsl:value-of select="nimi"/>
                        <br/>
                    </xsl:if>
                </xsl:for-each>
                <!-- 7. NIMEDE LOEND PIKKUSE JÄRGI -->
                <h2>7. Alla 7 tähemärgi pikkused nimed</h2>
                <xsl:for-each select="sugupuu/pereliige">
                    <xsl:if test="string-length(nimi) &lt; 7">
                        <div style="background-color:lightgreen; width:200px; padding:5px;">
                            <xsl:value-of select="nimi"/>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
