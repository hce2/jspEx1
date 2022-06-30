<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="num" value="300" />
	
	<c:if test="${num >= 50}">
	    <c:out value="num은 50이상" />
	</c:if>
	<c:if test="${num < 50}">
	    <c:out value="num은 50미만" />
	</c:if>
	
	<%
	int num2 = 300;
	if(num2>=50)
		out.println("num2는 50이상");
	else
		out.println("num2는 50미만");
	%>
	<br>
	
	<!-- 자바영역에 있는 배열에 특정한 숫자가 있으면 화면에 맞다고 표시. 아니면 아니라고 표시 -->
	<%
	int [] numArr = {3,6,9,12,15,18,21,24,27,30};
	int target = 6;
	for(int i=0; i<numArr.length; i++){
		if(numArr[i]==target){
			out.println("일치1");
		}
		else{
			out.println("불일치1");
		}
	}
	%>
	
	<c:set var="target" value="6"></c:set>
	<c:set var="numArr" value="{3,6,9,12,15,18,21,24,27,30}"></c:set>
	<br><br>
	<c:forEach var="item" items="${numArr}">
		<c:if test="${item==target}"> 
			<c:out value = "일치2"></c:out>
		</c:if>
		<c:if test="${item!=target}">
			<c:out value = "불일치2"></c:out>
		</c:if>
	</c:forEach>
	
	
	
	
      
      
<%--       <c:forEach var="k" begin="1" end="50" step="1">
          <c:out value="${k%2==0}" />
      </c:forEach> --%>
</body>
</html>