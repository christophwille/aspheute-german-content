
<HTML>
<HEAD>
	<TITLE>Beispiel BrowserHawk 2000</TITLE>
</HEAD>

<BODY>
<%
On Error Resume Next
Set BrowserHawk = Server.CreateObject("cyScape.browserObj")
%>
<p>
Ihr Browser liefert zum Beispiel folgende Informationen:<BR>
Browser: <%= BrowserHawk.Browser %><BR>
DHTML: <%
If BrowserHawk.DHTML = True Then
	%>
	Ja
	<%
Else
	%>
	Nein
	<%
End If
%><BR>
JavaScript Version: <%= BrowserHawk.JavaScriptVer %><BR>
VBScript: <%
If BrowserHawk.VBScript = True Then
	%>
	Ja
	<%
Else
	%>
	Nein
	<%
End If
%><BR>
SSL:<%
If BrowserHawk.SSL = True Then
	%>
	Ja
	<%
Else
	%>
	Nein
	<%
End If
%><BR>
XML: <%
If BrowserHawk.XML = True Then
	%>
	Ja
	<%
Else
	%>
	Nein
	<%
End If

Set BrowserHawk = Nothing

%><BR>

</BODY>
</HTML>
