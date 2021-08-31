<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="project1.loginUser" %>
<%
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");
%>
<%
	String bnoStr = (String)request.getParameter("bno");
	int bno = 0;
	if(bnoStr != null){
		bno = Integer.parseInt(bnoStr);
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String category = "";
	String title ="";
	int mno = 0; 
	String date = "";
	String content = "";
	String Img1 = "";
	String Img2 = "";
	String Img3 = "";
	
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		String user = "tester2";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql = "select * from board where bno="+bno;
		
		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();
		
		
		
		if(rs.next()){
			category = rs.getString("bcategory");
			title = rs.getString("btitle");
			mno = rs.getInt("mno");
			date = rs.getString("bdate");
			content = rs.getString("bcontent");
			Img1 = rs.getString("img1");
			Img2 = rs.getString("img2");
			Img3 = rs.getString("img3");
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		psmt.close();
		rs.close();
	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../style.css">
    <title>상세보기</title>
    <script src="https://kit.fontawesome.com/57da38e2a5.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!-- <script>
		function outfn(){
			alert("글 수정을 하지않고 나가시겠습니까?")
			if(login != 'null'){
				location.href="board/write.jsp";
			}else{
				alert("접근권한이 없습니다.");
			}
		}
	</script>
	-->
    <style>
        .boardName{
            font-size: 14px;
            margin-left: 30px;
            padding-top: 10px;
        }
        .title{
            margin-top: 5px;
            margin-left: 30px;
            font-size: 26px;

        }
        .writer{
            font-size: 14px;
            margin-left: 30px;
        }
        .footbar{
            display:flex;
        }
        input[type=button]{
            text-align: right;
            background-color: #f4d4d4;
            border-radius: 6px;
            border: none;
            width: 50px;
            height: 30px;
            text-align: center;
            color: rgb(85, 83, 83);
        }
        .modify{
            margin-top: 10px;
        }
        .delete{
            margin-top: 10px;
            margin-left: 10px;
        }
        .mainlist{
            margin-top: 10px;
            margin-left: 750px;
        }
        .write{
            width: 200px;
            height: 50px;
            font-size: 26px;
        }
        .body{
            margin-top: 5px;
        }
        .board{
            width: 200px;
            height: 35px;
            margin-left: 50px;
            margin-top: 16px;
            border-radius: 6px;
            background-color: #f4d4d4;
            border: none;
            
        }
        .board:focus{
            outline: none;
        }
        .m22{
            width: 900px;
            height: 30px;
            margin-left: 50px;
            margin-top: 16px;
            border-radius: 6px;
            background-color: #f4d4d4;
            border: none;
        }
        .m22:focus{
            outline: none;  
        }
        #m3{
            margin-left: 50px;
            margin-top: 16px;
            border-radius: 6px;
            background-color: #f4d4d4;
            border: none;
        }
        #m3:focus{
            outline: none;
        }
        .m42{
            margin-left: 50px;
            margin-top: 16px;
            border-radius: 6px;
        }
        .middlebody{
            width: auto;
            height: 520px;
        }
        .commentTitle{
            margin-left: 30px;
            font-size: 20px;
        }
        .commentBox{
            margin-left: 30px;
            width: 94%;
            height: 100px;
            border: 0.5px solid gray;
            border-radius: 6px;
            background-color: #f4d4d4;
        }
        .commentWriter{
            margin-left: 20px;
            font-size: 14px;
            margin-top: 10px;
        }
        .commentText{
            margin-left: 20px;
            border: none;
            background-color: #f4d4d4;

        }
        .commentBtn{
            margin-top: 10px;
            margin-left: 880px;
            font-size: 10px;
        }
        .commentText:focus{
            border: none;
            outline: none;
        }
        input[type=submit] {
            text-align: right;
            margin-top: 30px;
            margin-left: 880px;
            background-color: #f4d4d4;
            border-radius: 6px;
            border: none;
            width: 70px;
            height: 30px;
            text-align: center;
            color: rgb(85, 83, 83);
        }
        .footerC{
			width:80px;
			height:30px;
			text-align:center;
			margin:0 auto;
		}
    </style>
</head>
<body>
<form action="modifyOk.jsp" method="post">
<input type="hidden" name="bno" value="<%=bno%>">
    <div class="mainBox">
        <div class="user bar">
            <%if(loginUser == null){ %>
            <button class="loginBtn"onclick="location.href='../login/login.jsp'">로그인</button>
            <%}else{ %>
            <button class="loginBtn" onclick="location.href='../login/logout.jsp'">로그아웃</button>
            <b><%=loginUser.getName() %></b>님 계정입니다.
            <%} %>
        </div>
        <header class="head">
            <i class="fas fa-paw"></i>
            <a href="../index.jsp" class="title">나만 없어 고양이</a>
        </header>
        <nav class="menuBar">
            <ul class="menu">
                <li><a href="noticeList.jsp">공지사항</a></li>
                <li><a href="totalList.jsp">전체 게시글</a></li>
                <li><a href="helloList.jsp">안냥</a></li>
                <li><a href="whyList.jsp">궁굼하다냥</a></li>
                <li><a href="buyList.jsp">냥품생활</a></li>
                <li><a href="photoList.jsp">고영희씨 사진첩</a></li>
            </ul>
        </nav>
        <section >
            <div class="middleBar">
                
                <div class="bar">
                    <button class="writeBtn">게시글 작성</button>
                </div>
                <div class="search bar">
                    <button class="searchBtn"><i class="fas fa-search"></i></button>
                    <select class="searchS">
                    	<option value="1">제목+내용</option>
                    	<option value="2">작성자</option>
                    </select>
                    <input class="searchBox" type="text" placeholder="검색"/>
                </div>
            </div>
            <div class="footbar">
                <div class="write">
                    글 수정하기
                </div>
                <div class="mainlist">
                    <input type="button" value="목록">
                </div>
            </div>
            <div class="body">
                <div class="m1">
                    <select name="category" class="board" >
                        <option value="안냥"<%if(category.equals("안냥")){%>selected<%} %>>안냥</option>
                        <option value="궁금하다냥"<%if(category.equals("궁금하다냥")){%>selected<%} %>>궁금하다냥</option>
                        <option value="냥품생활"<%if(category.equals("냥품생활")){%>selected<%} %>>냥품생활</option>
                        <option value="고영희씨 사진첩"<%if(category.equals("고영희씨 사진첩")){%>selected<%} %>>고영희씨 사진첩</option>
                    </select>
                </div>
                <div class="m2">
                    <input type="text" name="title" class="m22" value="<%= title %>"> 
                </div>
                <div class="m3">
                    <textarea name="content" id="m3" cols="122" rows="30"><%= content %></textarea>
                </div>
                <div class="m4">
                    <input type="file" class="m42"name="fileName">
                </div>
                <div>
                	<input type="submit" value="등록">
                </div>
                <hr>
				<footer>
					<div class="footerC">
					&copy;TeamC
					</div>
				</footer>
            </div>
        </section>
    </div>
    </form>
</body>
