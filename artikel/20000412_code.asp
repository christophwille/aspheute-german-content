
<%
'On Error Resume Next
Dim BrowserHawk     ' BrowserHawk 2000 Objekt
Dim CookieAccept    ' Enthaelt True wenn der Browser Cookies annimmt
CookieAccept = False

Set BrowserHawk = Server.CreateObject("cyScape.browserObj")

If BrowserHawk.Cookies = True Then
	' Cookies werden vom Browser technisch unterstuetzt
	BrowserHawk.CookieDetector "noredirect"
	If BrowserHawk.CookiesEnabled Then
		' Cookies werden vom Browser angenommen
		CookieAccept = True
	End If
End If

%>
<HTML>
<HEAD>
	<TITLE>Beispiel BrowserHawk 2000</TITLE>
</HEAD>

<BODY>

<p>
Pr&uuml;fen ob der Brwoser Cookies annimmt...
</p>


<%
If CookieAccept = True Then
	' Hier die Variante wenn Cookies angenommen werden
	%>
	<P>Cookies werden vom Browser angenommen!</P>
	<%
Else
	' Hier die Variante wenn keine Cookies angenommen werden
	%>
	<P>Cookies werden vom Browser nicht angenommen!</P>
	<%
End If
%>

</BODY>
</HTML>

