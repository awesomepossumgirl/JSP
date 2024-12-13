<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID")!=null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href =  'main.jsp'");
			script.println("</script>"); 
		}
		// 아무것도 입력 안하고 회원가입 버튼 누르면 각 변수에 null 값 들어감
		// null처리
		if (user.getUserID() == null || user.getUserPassword() == null ||
			user.getUserName() == null || user.getUserGender() == null || 
			user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}  else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) { // DB오류 발생(해당 아이디가 이미 존재하는 경우)
				// 유저 아이디는 PK(기본키)라서 테이블에 단 하나만 존재해야 함
				// 동일한 아이디가 입력되면 -1 반환
				// 뒤로가기
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>"); 
			} 
			else { // 회원가입 성공 -> 메인 메이지(main.jsp)로 이동
				// result 가 -1 이 아닌 경우에는 정상적으로  등록이 된 것!
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
		 		script.println("</script>");
			}
		}
	%>
</body>
</html>
