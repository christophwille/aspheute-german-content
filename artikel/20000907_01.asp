<% @Language=VBScript %>
<% 
' Pruefen, ob dem Seitenaufruf bereits ein Redirect vorangegangen ist:
strRedirect = Request.QueryString("Redirect")
If UCase(strRedirect) <> UCase("True") Then
	' Es hat noch kein Redirect stattgefunden,
	' die Seite ist erst aufgerufen worden.

	' Wert in einer Session Variable speichern
	Session("CookiesEnabled") = True

	' Redirect zur selben Seite machen
	strSeite = Request.ServerVariables("SCRIPT_NAME")
	' Querystring an die URL anhaengen um zu kennzeichnen,
	' dass die Seite via Redirect aufgerufen wurde:
	strQueryString = "Redirect=True"
	strURL = strSeite & "?" & strQueryString
	Response.Redirect(strURL)
	Response.End
Else
	' Es hat ein Redirect stattgefunden.
	' Pruefen, ob der Wert in der Session Variablen
	' noch immer gespeichert ist.
	bSessionWert = Session("CookiesEnabled")
	If bSessionWert = True Then
		bCookies = True
	Else
		bCookies = False
	End If
End If 

' den Wert in bCookies benutzen, um die jeweiligen Aktionen zu setzen:
If bCookies = True Then
	Response.Write("<font color=""Green"">Ihr Browser nimmt Cookies an.</font>")
Else
	Response.Write("<font color=""Red"">Ihr Browser nimmt keine Cookies an.</font>")
End If
%>






