<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output encoding="UTF-8" method="html" />
<xsl:template match="/">
    Esimene:<xsl:value-of select="/inimesed/inimene[1]/eesnimi" />;<br/>
    Viimane:<xsl:value-of select="/inimesed/inimene[last()]/eesnimi" /><br/>
	<br/>
	Esimened kolm perenime:
	<xsl:value-of select="/inimesed/inimene[1]/perenimi" />, <xsl:value-of select="/inimesed/inimene[2]/perenimi" />, <xsl:value-of select="/inimesed/inimene[3]/perenimi" />;
	<br/>
	Esimened kolm perenime + sugu :
	<xsl:value-of select="/inimesed/inimene[1]/perenimi" /> - <xsl:value-of select="/inimesed/inimene[1]/sugu" />, <xsl:value-of select="/inimesed/inimene[2]/perenimi" /> - <xsl:value-of select="/inimesed/inimene[2]/sugu" />, <xsl:value-of select="/inimesed/inimene[3]/perenimi" /> - <xsl:value-of select="/inimesed/inimene[3]/sugu" />;
	<br/>
	Eelviimane:<xsl:value-of select="/inimesed/inimene[last()-1]/eesnimi" /><br/>

	<table>
		<tr>
			<th>Inimeste vanuste vahe</th>
			<xsl:for-each select="/inimesed/inimene">
				<th>
					<xsl:value-of select="
concat(eesnimi, ', ', synd)"></xsl:value-of>
				</th>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="/inimesed/inimene">
			<tr>
				<xsl:variable name="v2limine" select="." />
				<td>
					<xsl:value-of select="eesnimi" />
				</td>
				<xsl:for-each select="/inimesed/inimene">
					<td>
						<xsl:if test="number(synd)-number($v2limine/synd) &gt; -6 and number(synd)-number($v2limine/synd) &lt; 6">
							<xsl:attribute name="style">
								background-color:orange
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="
number(synd)-number($v2limine/synd)" />

					</td>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
	</table>
	<table>
		<tr>
			<th>Inimeste vanuste vahe</th>
			<xsl:for-each select="/inimesed/inimene">
				<th>
					<xsl:value-of select="
concat(eesnimi, ', ', synd)"></xsl:value-of>
				</th>
			</xsl:for-each>
		</tr>
		<xsl:for-each select="/inimesed/inimene">
			<tr>
				<xsl:variable name="v2limine" select="." />
				<xsl:variable name="v2liminepos" select="position()"/>
				<td>
					<xsl:value-of select="eesnimi" />
				</td>
				<xsl:for-each select="/inimesed/inimene">
					<td>
						<xsl:if test="position() = $v2liminepos">
							
						</xsl:if>
						<xsl:if test="not(position() = $v2liminepos)">
							<xsl:value-of select="$v2limine/perenimi" /> ja <xsl:value-of select="perenimi" />
						</xsl:if>


					</td>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>