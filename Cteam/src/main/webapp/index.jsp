<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project1.loginUser" %>

<%
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>나만 없어 고양이</title>
    <script src="https://kit.fontawesome.com/57da38e2a5.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <style>
    </style>
</head>
<body>
    <div class="mainBox">
    	<div class="user bar">
                    <%if(loginUser == null){ %>
					<button class="loginBtn"onclick="location.href='login/login.jsp'">로그인</button>
					<%}else{ %>
					<button class="loginBtn" onclick="location.href='login/logout.jsp'">로그아웃</button>
                    <b><%=loginUser.getName() %></b>님 계정입니다.
                    <%} %>
                </div>
        <header class="head">
            <i class="fas fa-paw"></i>
            <a href="#" class="title">나만 없어 고양이</a>
        </header>
        <nav class="menuBar">
            <ul class="menu">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">전체 게시글</a></li>
                <li><a href="#">안냥</a></li>
                <li><a href="#">궁굼하다냥</a></li>
                <li><a href="#">냥품생활</a></li>
                <li><a href="#">고영희씨 사진첩</a></li>
            </ul>
        </nav>
        <section >
            <div class="middleBar">
               
                <div class="bar">
                    <button class="writeBtn">게시글 작성</button>
                </div>
                <div class="search bar">
                    <button class="searchBtn"><i class="fas fa-search"></i></button>
                    <input class="searchBox" type="text" placeholder="검색"/>
                </div>
            </div>
            <div class="body">
                <div class="name">
                    전체 게시글
                </div>
                <hr/>
                <table class="list" border="1">
                    <tr>
                        <th>순번</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                    </tr>
                   

                </table>
                <div class="number">
                    <a href="#">&lt;</a>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                    <a href="#">8</a>
                    <a href="#">9</a>
                    <a href="#">10</a>
                    <a href="#">&gt;</a>
                </div>
            </div>
        </section>
    </div>
</body>