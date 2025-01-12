
<%
' Verbindunsgeschwindigkeitstest Seite darf nicht gecached werden
' um vernuenftige Test Resultate zu bekommen
Response.Expires=0
Response.AddHeader "Pragma","no-cache"
Response.AddHeader "cache-control", "no-store"

Set BrowserHawk = Server.Createobject("CyScape.Browserobj")
BrowserHawk.GetExtProperties
If BrowserHawk.JavaScriptEnabled = True Then
  BrowserHawk.SpeedDetector , "Bitte warten...", _
  "&nbsp;Die Verbindung wird getestet, bitte warten..."
End If
%>
<html>
<head>
	<title>Verbindungsgeschwindigkeit: Test Resultat</title>
</head>
<body>

<p>Ihre Verbindungsgeschwindigkeit:
<%
Speed = BrowserHawk.ConnectionSpeed

If Speed = -1 Then
  If (Not BrowserHawk.JavaScriptEnabled) Then
     Response.Write "Geschwindigkeit nicht messbar da JavaScript am Browser nicht ausgef&uuml;hrt werden kann."
  Else
     Response.Write "Kleiner als 10 KBytes/sec (schlechte Verbindung oder zu gro&szlig;er Datenstrom)"
  End If
Else
	kBytesProSec = Speed / 8
	If kBytesProSec > 2000000 Then
		Response.Write "Nicht messbar (intern zu hoher Wert ermittelt)"
	Else
		Response.Write FormatNumber(kBytesProSec) & " KBytes/sec"
	End If
End If

Set BrowserHawk = Nothing
%>
</p>

<p><A HREF="<%= Request.ServerVariables("SCRIPT_NAME") %>">Neue Messung starten</a></p>

</body>
</html>

