<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">JSP 웹사이트</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
            </ul>
            <ul class="navbar-nav ms-auto">   
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item active" href="login.jsp">로그인</a></li>
                        <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
	</nav>
	<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-lg-4">
	            <div class="jumbotron" style="padding-top: 20px;">
	                <form method="post" action="loginAction.jsp">
	                    <h3 style="text-align: center;">로그인 화면</h3>
	                    <div class="form-group">
	                    	<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
	                    </div>
	                    <div class="form-group">
	                    	<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
	                    </div>
	                    <input type="submit" class="btn btn-primary form-control" value="로그인"> 
	                </form>    
	            </div>
	        </div>
	    </div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
