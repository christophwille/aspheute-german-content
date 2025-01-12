
<% 

FlashVersion = Request.Querystring("FlashVersion")
If FlashVersion <> "" Then
	If FlashVersion = 3 Then
		%>
<HTML>
<HEAD>
	<TITLE>Flash Version 3</TITLE>
</HEAD>
<BODY>		
Dies ist die Flash (Version 3) Seite.
</BODY>		
</HTML>
		<%
	Else
		%>
<HTML>
<HEAD>
	<TITLE>Flash Version 4 oder h&ouml;her</TITLE>
</HEAD>
<BODY>		
Dies ist die Flash (Version 4 oder h&ouml;her) Seite.
</BODY>		
</HTML>

		<%
	End If
	Response.End
End If


Set BrowserHawk = Server.CreateObject("cyScape.browserObj")
BrowserHawk.GetExtProperties

Dim FlashDetect
FlashDetect = BrowserHawk.Plugin_Flash

ScriptName = Request.ServerVariables("SCRIPT_NAME")
If FlashDetect <= 0 Then
	' Flash Plug-In konnte nicht geprueft werden oder Flash nicht installiert

ElseIf FlashDetect = 3 Then
	' Flash Version 3, Umleitung zu Flash3.asp
	Response.Redirect(ScriptName & "?FlashVersion=3")
ElseIf FlashDetect >= 4 Then
	' Flash Version 4 oder hoeher, Umleitung zu Flash4.asp
	Response.Redirect(ScriptName & "?FlashVersion=4")
End If
%>

<HTML>
<HEAD>
	<TITLE>Flash Erkennung</TITLE>
</HEAD>
<BODY>

<% 
If FlashDetect = -1 Then
	Response.Write "Flash Plug-In konnte nicht gepr&uuml;ft werden.<BR>"
	Response.Write "Klicken Sie hier f&uuml;r "
	Response.Write "<A HREF=""" & ScriptName & "?FlashVersion=3"">Flash Version 3</A> oder "
	Response.Write "<A HREF=""" & ScriptName & "?FlashVersion=4"">Flash Version 4 und h&ouml;her</A>."
ElseIf FlashDetect = 0 Then
	' Flash nicht installiert
	Response.Write "Flash Plug-In nicht installiert."
Else
	Response.Write "Fehler bei Flash Plug-In Detektion."
End If
%>

</BODY>
</HTML>

<% 
' Resourcen freisetzen
Set BrowserHawk = Nothing
%>