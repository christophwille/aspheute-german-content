
<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

     
<xsl:template match="/">
<xsl:variable name="Produkte" select="count(//Produkt)" />
<xsl:variable name="Absatz" select="sum(//Produkt/Sold/@quartal1) + sum(//Produkt/Sold/@quartal2) + sum(//Produkt/Sold/@quartal3) + sum(//Produkt/Sold/@quartal4)" />
<xsl:variable name="Umsatz" select="$Absatz * (sum(//Produkt/Preis) div $Produkte)" />

	<HTML>
	<HEAD>
	<TITLE><xsl:value-of select="Statistik/Info/Inhalt" /></TITLE>
	<STYLE TYPE="text/css">
	body {background-color:#cccccc; }
	.table{border:1px solid #aaaaaa;padding:5px;background-color:#dddddd;text-alignment:left;}
	.head{font-size:13px;font-family:sans-serif;font-weight:bold;color:#333333;background-color:#c5c5c5;}
	.head2{font-size:12px;font-family:sans-serif;color:#333333;background-color:#cfcfcf;}
	.text{font-size:12px;font-family:sans-serif;color:#333333;}
	.bold{font-weight:bold;}
	.chart1{background-color:#c5c5c5;color:#333333;width:20px; height:<xsl:value-of select="(sum(//Produkt/Sold/@quartal1) * (sum(//Produkt/Preis) div $Produkte)) div 2500" />px;}
	.chart2{background-color:#c5c5c5;color:#333333;width:20px; height:<xsl:value-of select="(sum(//Produkt/Sold/@quartal2) * (sum(//Produkt/Preis) div $Produkte)) div 2500" />px;}
	.chart3{background-color:#c5c5c5;color:#333333;width:20px; height:<xsl:value-of select="(sum(//Produkt/Sold/@quartal3) * (sum(//Produkt/Preis) div $Produkte)) div 2500" />px;}
	.chart4{background-color:#c5c5c5;color:#333333;width:20px; height:<xsl:value-of select="(sum(//Produkt/Sold/@quartal4) * (sum(//Produkt/Preis) div $Produkte)) div 2500" />px;}
	</STYLE>
	</HEAD>
	<BODY>
	<CENTER>
	<TABLE class="table" border="0" cellspacing="0" cellpadding="0" width="450px" valign="top">
	
	<TR class="head">
		<TD colspan="6">		
			<xsl:value-of select="Statistik/Info/Inhalt"/> vom <xsl:value-of select="Statistik/Info/Von"/> bis <xsl:value-of select="Statistik/Info/Bis"/>
		</TD>
	</TR>
	
	<TR class="head2">
		<TD align="left">
		Produktbezeichnung
		</TD>
		<TD align="right">
		System
		</TD>
		<TD align="right">
		St&#252;ckpreis		
		</TD>
		<TD align="right">
		Absatzmenge
		</TD>
		<TD align="right">
		Umsatz
		</TD>
	</TR>

 <xsl:for-each select="//Produkt">
	<TR class="text">
		<TD>
			<xsl:value-of select="Name"/>
		</TD>
		<TD align="center">
			 <xsl:choose>
			 	<xsl:when test="number(System = 'UNX')"><IMG SRC="tux.gif" border="0" /></xsl:when>
			 	<xsl:otherwise></xsl:otherwise>
			 </xsl:choose>
			 <xsl:choose>
		         	 	<xsl:when test="number(System = 'WIN')"><IMG SRC="win.gif" border="0" /></xsl:when>
		         	 	<xsl:otherwise></xsl:otherwise>
		                </xsl:choose>
		</TD>
		<TD align="right">
			<xsl:value-of select="Preis"/>
		</TD>
		<TD align="right">
			<xsl:value-of select="Sold/@quartal1 + Sold/@quartal2 + Sold/@quartal3 + Sold/@quartal4" />
		</TD>
		<TD align="right">
			<xsl:value-of select="(Sold/@quartal1 + Sold/@quartal2 + Sold/@quartal3 + Sold/@quartal4) * Preis" />
		</TD>
	</TR>
</xsl:for-each>
	
	
	<TR class="head2">
		<TD>
		Total:
		</TD>
		<TD>&#160;
		</TD>
		<TD>&#160;
		</TD>
		<TD align="right" class="bold">
		<xsl:value-of select="sum(//Produkt/Sold/@quartal1) + sum(//Produkt/Sold/@quartal2) + sum(//Produkt/Sold/@quartal3) + sum(//Produkt/Sold/@quartal4)"/>
		</TD>
		<TD align="right" class="bold">
		<xsl:value-of select="$Umsatz"/>
		</TD>
	</TR>
	
	<TR class="head">
		<TD colspan="6">		
		Umsatz nach Quartalen
		</TD>
	</TR>
	<TR class="text">
		<TD colspan="6" align="center">	
		<center>
		<TABLE border="0" cellspacing="0" cellpadding="0" valign="bottom" class="text" style="padding-right:5px;">
			<TR valign="bottom">
				<TD>
				<DIV class="chart1" valign="bottom">&#160;<xsl:value-of select="sum(//Produkt/Sold/@quartal1) * (sum(//Produkt/Preis) div $Produkte)" />&#160;</DIV>
				</TD>
				<TD>
				<DIV class="chart2" valign="bottom">&#160;<xsl:value-of select="sum(//Produkt/Sold/@quartal2) * (sum(//Produkt/Preis) div $Produkte)" />&#160;</DIV>
				</TD>
				<TD>
				<DIV class="chart3" valign="bottom">&#160;<xsl:value-of select="sum(//Produkt/Sold/@quartal3) * (sum(//Produkt/Preis) div $Produkte)" />&#160;</DIV>
				</TD>
				<TD>
				<DIV class="chart4" valign="bottom">&#160;<xsl:value-of select="sum(//Produkt/Sold/@quartal4) * (sum(//Produkt/Preis) div $Produkte)" />&#160;</DIV>
				</TD>
			</TR>
			<TR>
				<TD align="center">
				Q1
				</TD>
				<TD align="center">
				Q2
				</TD>
				<TD align="center">
				Q3
				</TD>
				<TD align="center">
				Q4
				</TD>
			</TR>
		</TABLE>
		</center>
		</TD>
	</TR>
	
	</TABLE>
	
	</CENTER>
	</BODY>

	</HTML>
</xsl:template>

</xsl:stylesheet>
