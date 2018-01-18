<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/voting" user="root" password="" />

<sql:update dataSource="${snapshot}" var="result">
 delete from voter_register where Identification_number = ?
<sql:param value="${param.Identification_number}"></sql:param>
</sql:update>
</head>
<body>
	<c:if test="${result==1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="index.jsp">Go Home</a>
		<c:redirect url="index.jsp.jsp" />
	</c:if>
</body>
</html>