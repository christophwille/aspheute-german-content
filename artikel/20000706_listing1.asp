
<% Function GetScriptEngine()
   Dim strSE
   strSE = ScriptEngine & " " 
   strSE = strSE & ScriptEngineMajorVersion & "."
   strSE = strSE & ScriptEngineMinorVersion & "."
   strSE = strSE & ScriptEngineBuildVersion
   GetScriptEngine = strSE
End Function

Response.Write GetScriptEngine()
%>
