<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%= request.getParameter("age") %> --%>
	<%-- <% out.println( request.getParameter("age") ); %> --%>
	
	<% 
	//B에서 결과값 출력
	int a = Integer.parseInt(request.getParameter("num1"));	//무조건 String으로 받기때문에 형변환
	int b = Integer.parseInt(request.getParameter("num2"));
	int result = a+b;
	out.println("첫번째 값 : " + a);
	%>
	<br>
	<%  out.println("두번째 값 : " + b);  %>
	<br>
	<%  out.println("더한 결과 : " + result); %>
	<br>
	
	
	//B에서 출력하는것이 아니라 결과값을 A로 전달하고 A에서 출력
	<% 
	String URL = "A.jsp";
/* 	response.setHeader("result", result+"");
	response.setContentType("text/plain");
	//이렇게하면 B.jsp에있는 response내장객체에 result라는 이름으로 result값을 넣는거. */
	
	//1. 주소 드러나는 방식
/* 	String appendURL = "?result="+result;
	response.sendRedirect(URL+appendURL); */
	
	
	//2. 주소 숨기는 방식
	pageContext.getSession().setAttribute("result", result);
	response.sendRedirect(URL);	//여기에 저 정보가 누락되고있다.
	
	
	%>


</body>
</html>