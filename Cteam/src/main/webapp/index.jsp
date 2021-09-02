<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project1.loginUser" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBmanager.PagingUtil" %>
<%@ page import="DBmanager.DBManager" %>
<%
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");

	String searchType = (String)request.getParameter("searchType");
	String searchValue =(String)request.getParameter("searchValue");
	
	String bno = (String)request.getParameter("bno");
	String mno = (String)request.getParameter("mno");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	//리졀트셋은 트라이 바깥에서 선언해야함 다시 선언해서 사용하기
	
	try{
		conn = DBManager.getConnection();
		
	//---전체게시판---------------이거 왜 안나오냐-------------------------------------	
		 String tsql = " ";
				tsql +="select B.* from ";
				   tsql +="(select rownum as rnum, A.* from "; 
				   tsql +=" (select mname,b.bno,btitle,";
				   tsql +=" to_char(bdate,'yyyy-mm-dd') as bdate,bcategory ";
				   tsql +=" from board b ,mem m";
				   tsql +=" where b.mno = m.mno";
				   if(searchValue != null && !searchValue.equals("")){
					   	if(searchType.equals("title")){
					   		tsql +=" and b.btitle like '%"+searchValue+"%'";
					   	}else if(searchType.equals("writer")){
					   		tsql += " and m.mname = '"+searchValue+"'";
					   	}
				   }
				   tsql +=" and b.bcategory = '궁금하다냥'";//카테고리가 전체게시판인 애를 가져오겠다.
				   tsql +=" order by b.bno) A";	 //A가 카테고리가 전체게시판인 전체게시글		
				   tsql +=" where rownum <= 10)B"; //인스턴스에 대한 순번 로우넘 
				   tsql +=" where B.rnum >=0"; //어디서부터 시작할껀지
				   
				   psmt = conn.prepareStatement(tsql);
					
				   rs = psmt.executeQuery();
	//---안냥--------------------------------------------------------------------			   
				   String Qsql = "";
						   Qsql +="select B.* from ";
						   Qsql +="(select rownum as rnum, A.* from "; 
						   Qsql +=" (select mname,b.bno,btitle,";
						   Qsql +=" to_char(bdate,'yyyy-mm-dd') as bdate,bcategory ";
						   Qsql +=" from board b ,mem m";
						   Qsql +=" where b.mno = m.mno";
						   if(searchValue != null && !searchValue.equals("")){
							   	if(searchType.equals("by_content")){
							   		Qsql +=" and (b.btitle like '%"+searchValue+"%'";
							   		Qsql +=" or b.bcontent like '%"+searchValue+"%')";
							   	}else if(searchType.equals("by_member")){
							   		Qsql += " and m.mname = '"+searchValue+"'";
							   	}
						   	
						   }
						   Qsql +=" and b.bcategory = '안냥'";//카테고리가 전체게시판인 애를 가져오겠다.
						   Qsql +=" order by b.bno) A";	 //A가 카테고리가 전체게시판인 전체게시글		
						   Qsql +=" where rownum <= 10)B"; //인스턴스에 대한 순번 로우넘 
						   Qsql +=" where B.rnum >=0"; //어디서부터 시작할껀지
					   
					   psmt = conn.prepareStatement(Qsql);
						
					   rs2 = psmt.executeQuery();	   
				   
		  
				   
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
	}
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
    <script>
		function goWrite(){
			var login = '<%=loginUser%>';
			if(login != 'null'){
				location.href="board/write.jsp";
			}else{
				alert("접근권한이 없습니다.");
			}
		}
	</script>
    <style>
        .youtube{
            width: 600px;
            height: 350px;
            background-color: #f4d4d4;
            text-align: center;
            justify-self: center;
            margin-left: auto;
            margin-right: auto;
            position: relative;
            top: 20px;

        }
        .youtube2{
            width: 600px;
            height: 350px;
            background-color: #f4d4d4;
            text-align: center;
            justify-self: center;
            margin-top:20px;
            margin-left: auto;
            margin-right: auto;
            position: relative;
            top: 20px;

        }
        .vod{
            position: relative;
            top: 16px;
        }
        .board{
            display: flex;
        }
        .total{
            width: 400px;
            height: 350px;
            background-color:#f4d4d4;
            margin-top: 80px;
            margin-left: 70px;
        }
        .notice{
            width: 400px;
            height: 350px;
            background-color:#f4d4d4;
            margin-top: 80px;
            margin-left: 60px;
        }
        .footerC{
			width:80px;
			height:30px;
			text-align:center;
			margin:20px auto;
		}
		.today{
			width:310px;
			height:30px;
		 	position: relative;
            top: 10px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom:10px;
            font-size:30px;
            
		}
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
            <a href="index.jsp" class="title">나만 없어 고양이</a>
        </header>
        <nav class="menuBar">
            <ul class="menu">
                <li><a href="board/noticeList.jsp">공지사항</a></li>
                <li><a href="board/totalList.jsp">전체 게시글</a></li>
                <li><a href="board/helloList.jsp">안냥</a></li>
                <li><a href="board/whyList.jsp">궁굼하다냥</a></li>
                <li><a href="board/buyList.jsp">냥품생활</a></li>
                <li><a href="board/photoList.jsp">고영희씨 사진첩</a></li>
            </ul>
        </nav>
        <section >
            <div class="middleBar">
               
                <div class="bar">
                    <button type="button" class="writeBtn" onclick="goWrite()">게시글 작성</button>
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
            <div class="body">
            	<div class=today>
            		Today's Best Video
            		<i class="fas fa-video"></i>
            	</div>
            <!-- 유튜브 영상 넣는 부분 -->
                <div class="youtube">
                    <iframe class="vod"width="560" height="315" src="https://www.youtube.com/embed/U6gXFcywFug" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="youtube2">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/wb-UBFYb3_I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <footer>
					<div class="footerC">
					&copy;TeamC
					</div>
				</footer>
            </div>
        </section>
    </div>
    
</body>