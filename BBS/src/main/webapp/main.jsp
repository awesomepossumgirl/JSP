<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<style>
</style>
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
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="main.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
            </ul>
            <%
            	if(userID == null) { // 로그인 하지 않은 사용자에게 보여줄 화면
            %>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                        <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
            <% 		
            	} else { // 로그인 한 사용자에게 보여줄 화면
            %>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <% 
            	}
            %>
        </div>
    </div>
    </nav>
    
	 <div class="container mt-5">
        <div class="bg-light p-5 rounded shadow">
            <h1 class="display-4">어서 오세요!</h1>
            <p class="lead">
                이 웹사이트는 부트스트랩으로 제작된 간단한 JSP 웹사이트입니다. 최소한의 간단한 로직을 사용하여 개발되었습니다.
            </p>
            <hr class="my-4">
            <p>
                저는 요즘 너무 피곤합니다. 카페인이 없으면 살 수가 없어요! 저에게 커피를 꼭 사주세요. 😂 
                이렇게 간단한 웹사이트를 만드는데도 MySQL과 Eclipse에서는 왜 이렇게 많은 
                에러가 발생하는 것일까요? 정말 미스테리 합니다. (사실은 제가 코드를 잘못 썼기 때문입니다 양심고백합니다)
            </p>
            <a class="btn btn-primary btn-lg" href="#" role="button">자세히 알아보기</a>
        </div>
    </div>
    
    <div class="container mt-5 mb-5">
	    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	    	<!-- carousel-indicator -->
	        <ol class="carousel-indicators" style="display: none;">
	            <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
	            <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
	            <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
	        </ol>
	        <!-- 슬라이드 콘텐츠 추가 -->
	        <div class="carousel-inner">
	            <div class="carousel-item active">
	                <img src="Images/image1.jpg" class="d-block w-100" alt="Slide 1" style="height: 800px; object-fit: cover;">
	            </div>
	            <div class="carousel-item">
	                <img src="Images/image2.jpeg" class="d-block w-100" alt="Slide 2" style="height: 800px; object-fit: cover;">
	            </div>
	            <div class="carousel-item">
	                <img src="Images/image3.jpg" class="d-block w-100" alt="Slide 3" style="height: 800px; object-fit: cover;">
	            </div>
	        </div>
	        <!-- 이전/다음 버튼 추가 -->
	        <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Prev</span>
	        </a>
	        <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="visually-hidden">Next</span>
	        </a>
	    </div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
