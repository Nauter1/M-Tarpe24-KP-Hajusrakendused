<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" />
	<xsl:template match="/">
		Register :<xsl:value-of select="/autod/auto[1]/registrinumber" />;<br/>
		Register numbrid :<xsl:value-of select="substring(/autod/auto[1]/registrinumber,1,3)" />;<br/>
		Register tähed :<xsl:value-of select="substring(/autod/auto[1]/registrinumber,4,3)" />;<br/>

		Perekonnanimi: <xsl:value-of select="/autod/auto[1]/perekonnanimi" />;<br/>
		Perekonnanimi esitäht: <xsl:value-of select="substring(/autod/auto[1]/perekonnanimi, 1, 1)" />;<br/>
		Perekonnanimi viimane täht: <xsl:value-of select="substring(/autod/auto[1]/perekonnanimi, string-length(/autod/auto[1]/perekonnanimi), 1)" />;<br/>
		<br/>
		Mitu perekonnanimi on Kaalikas:<xsl:value-of select="count(/autod/auto[perekonnanimi='Kaalikas'])" /><br/>
		Mitu perekonnanimi algab M-iga:<xsl:value-of select="count(/autod/auto[substring(perekonnanimi, 1, 1)='M'])" /><br/>
		Mitme autoregistri number lõppeb 2-ga:<xsl:value-of select="count(/autod/auto[substring(registrinumber, 3, 1)=2])" /><br/>
		Mitme autoregistri number lõppeb 1 või 2-ga:<xsl:value-of select="count(/autod/auto[substring(registrinumber,3, 1)&lt; 3])" /><br/>
		<br/><br/>
		<xsl:for-each select="/autod/auto">
			<div>
			<xsl:if test="substring(registrinumber,3,1)=1 or substring(registrinumber,3,1)=2">
				<xsl:attribute name="style">
					font-weight:bold
				</xsl:attribute>
			</xsl:if>
			<xsl:value-of select="position()"/> -
			Auto: <xsl:value-of select="registrinumber"/><br/>
			<xsl:if test="substring(registrinumber,3,1)=5">
				Ülevaatuse kuu on juuli<br/>
			</xsl:if>
			Omanik: <xsl:value-of select="perekonnanimi"/><br/>
			<xsl:if test="contains(perekonnanimi,'x')">
				Tegemist on võõrnimega<br/>
			</xsl:if>
			<xsl:if test="not(contains(perekonnanimi,'x'))">
				Tegemist on kohalikuga<br/>
			</xsl:if>
			</div>
			<br/>
		</xsl:for-each>
		<table>
			<tr>
				<th>ID</th>
				<th>Registrinumber</th>
				<th>Perekonnanimi</th>
			</tr>
			<xsl:for-each select="/autod/auto">
				<tr>
					<td>
						<xsl:if test="position() mod 3 =0">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 3 =2">
							<xsl:attribute name="style">
								background-color:lightgray
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="position()"/>
					</td>
					<td>
						<xsl:if test="position() mod 3 =0">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 3 =2">
							<xsl:attribute name="style">
								background-color:lightgray
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:if test="position() mod 3 =0">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 3 =2">
							<xsl:attribute name="style">
								background-color:lightgray
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="perekonnanimi"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>


	</xsl:template>
</xsl:stylesheet>