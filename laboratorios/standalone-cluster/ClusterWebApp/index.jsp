<%@ page contentType="text/html; charset=UTF-8" %> 
<html>
<head>
<title>Aplicação para teste de replicação de sessão</title>
</head>
<body>
<center>
<%
session.setAttribute("SessionKey", "Date/time: " + 
   new java.util.Date());
System.out.println("\n\t index.jsp chamado. SessionKey = " + 
   (String) session.getAttribute("SessionKey"));
%>
<h2>O atributo "SessionKey" foi ajustado em HttpSession!</h2>
session.getAttribute("SessionKey") = <%=session.getAttribute("SessionKey")%>
<br><br>
session.getId() = <%=session.getId()%>
<br><br> 
<a href="sessionCheck.jsp">Clique aqui para verificar o valor de SessionKey.</a>
</center>
<br><br>
<b><font color="red">NOTA:</font></b>
Note que o valor configurado para SessionKey apresenta o timestamp de quando ele foi criado e inserido na sessão.
Isso é útil para verificar quando seu valor é novo ou quando ele tem seu valor obtido através da replicação.
<br>
Cada vez que você recarregar essa página, um novo valor será atribuido a SessionKey com o timestamp corrente.
</body>
</html>
