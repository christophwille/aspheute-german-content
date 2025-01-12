
<%
Set BrowserHawk = Server.CreateObject("cyScape.browserObj")
BrowserHawk.GetExtProperties

Dim FlashDetect
FlashDetect = BrowserHawk.Plugin_Flash
%>

<HTML>
<HEAD>
	<TITLE>Flash Erkennung</TITLE>
</HEAD>
<BODY>

<%
If FlashDetect = -1 Then
	Response.Write "Flash Plug-In konnte nicht gepr&uuml;ft werden."
ElseIf FlashDetect = 0 Then
	Response.Write "Flash Plug-In nicht installiert"
Else
	Response.Write "Flash Plug-In Version " & FlashDetect & " installiert."
End If
 %>

</BODY>
</HTML>

<%
' Resourcen freisetzen
Set BrowserHawk = Nothing
%>