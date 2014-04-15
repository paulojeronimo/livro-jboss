<%@ page contentType="text/html; charset=UTF-8" %> 
<html>
<head>
<title>Aplicação para teste de replicação de sessão</title>
</head>
<body>
<center>
<%
System.out.println("\n\t sessionCheck.jsp getAttribute() chamado. SessionKey = " +
  (String)session.getAttribute("SessionKey"));
%>
<h2>Verificando o valor de "SessionKey" ...</h2>
session.getAttribute("SessionKey") = <%=session.getAttribute("SessionKey")%>   
<br><br>
session.getId() = <%=session.getId()%>
</h2>
</center>
</body>
</html>
