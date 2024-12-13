<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">JSP 웹사이트</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="main.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="bbs.jsp">게시판</a></li>
				</ul>
				<%
				if (userID == null) { // 로그인 하지 않은 사용자에게 보여줄 화면
				%>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 접속하기<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
						</ul></li>
				</ul>
				<%
				} else { // 로그인 한 사용자에게 보여줄 화면
				%>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 회원관리<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
						</ul></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="card shadow-sm">
			<div class="card-header bg-secondary text-white text-center">
				<h5 class="mb-0">게시판 글쓰기 양식</h5>
			</div>
			<div class="card-body">
				<form method="post" action="writeAction.jsp">
					<!-- 제목 입력 -->
					<div class="mb-4">
						<label for="bbsTitle" class="form-label">글 제목</label><input
							type="text" id="bbsTitle" name="bbsTitle" class="form-control"
							placeholder="글 제목을 입력하세요" maxlength="50" required>
					</div>
					<!-- 내용 입력 -->
					<div class="mb-4">
						<label for="bbsContent" class="form-label">글 내용</label>
						<textarea id="bbsContent" name="bbsContent" class="form-control"
							placeholder="글 내용을 입력하세요" maxlength="2048" rows="10" required></textarea>
					</div>
					<!-- 제출 버튼 -->
					<div class="d-flex justify-content-end">
						<input type="submit" class="btn btn-primary" value="글쓰기">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
