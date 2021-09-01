<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project1.loginUser" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBmanager.PagingUtil" %>
<%@ page import="DBmanager.DBManager" %>
<%@ page import="project1.loginUser" %> 
<%
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");

	String srarchType = (String)request.getParameter("searchType");
	String srarchValue = (String)request.getParameter("searchValue");

	String bnoStr = (String)request.getParameter("bno");
	String mno = (String)request.getParameter("mno");
	String imgPath = "/Cteam/upload/";
	
	
		int bno =0;
		if(bnoStr != null){
		  	bno = Integer.parseInt(bnoStr);
	    	}
		
		Connection conn = null; 
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String category ="";
	
	try{
		conn = DBManager.getConnection();//																							 이너조인 조건 멤버의 = 보드의 fk키같고 그리고 				
		String sql="select bno,bcategory,btitle,to_char(bdate,'yyyy-mm-dd')as bdate,bcontent,img1,img2,img3,mname from board, mem where mem.mno=board.mno and bno="+bno;
		//보드테이블에 대한 한줄만 가져올꺼니까 보드테이블에 bno만 가져오면 됨 list의 쿼리랑 같아야함
																									//1대 다면 누가 1인지 생각 외래키랑 pk랑 엮어줘야함 다의 fk랑 1의 pk의 키가 엮어져야ㅕ 이너조인
		
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		
		rs.next();
		
		category =rs.getString("bcategory");
		
		//댓글 창 보여주기 위한 쿼리 다시 날리기
		String csql="select cno,ccontent,to_char(cdate,'yyyy-mm-dd')as cdate,bno,mem.mno,mname from reply,mem where reply.mno=mem.mno and bno="+bno;
				
		psmt = conn.prepareStatement(csql);
		rs2 = psmt.executeQuery();
		
	}catch(Exception e){
		e.printStackTrace();
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
    <script>
    function delFn(){
		if('<%=mno%>'=='<%=loginUser.getNo()%>' || '<%=loginUser.getNo()%>'== 1){
			var yn = confirm("삭제하시겠습니까?");
			if(yn){
				location.href="deleteOk.jsp?bno=<%=bno%>&category=<%=category%>";
				//원래는 bno만 넘기는 것이 맞지만, 카테고리별로 나눠져야 하기 때문에 카테고리도 같이 넘겨야함
			}
		}else{
			alert("해당 글을 삭제할수 없습니다.");
		}	
	}

	//--비회원은 댓글 달 수 없음-----------------------------------------------------
	function no(){ //버튼에 onclick이벤트 걸린거임
		var login = '<%=loginUser%>';
		if(login == 'null'){
			alert("로그인이 필요한 서비스 입니다!");
			location.href="login.jsp";
		}else{
			document.cf.submit();
			//나의 웹문서 폼태그 이름의 서브밋을 시켜라 esle니까 로그인이 되있을 경우에
		}
	}
	//-------------------------------------------------------------------------
	</script>
    <style>
        .boardName{
            font-size: 14px;
            margin-left: 30px;
            padding-top: 10px;
        }
        .title2{
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
            margin-left: 840px;
        }
        .body{
            margin-top: 5px;
        }
        .middlebody{
            width: auto;
            height: 400px;
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
        .footerC{
			width:80px;
			height:30px;
			text-align:center;
			margin:0 auto;
		}
		input[type=submit]{
            text-align: right;
            background-color: #dad8ec;
            border-radius: 6px;
            border: none;
            width: 50px;
            height: 25px;
            text-align: center;
            color: rgb(85, 83, 83);
            margin-top:-10px;
        }
        .c1{
        	margin-left:30px;
        }
        .cn{
        	font-size:14px;
        }
        .cd{
        	font-size:14px;
        }
        .m1{
        	margin-left:30px;
        	margin-right:30px;
        }
        .m2{
        	font-size:22px;
        }
        .m3{
        	font-size:18px;
        }
        .m4{
        	font-size:13px;
        }
    </style>
    <script src = "jquery-3.6.0.min.js"></script>
    <script>
    //----------댓글제이쿼리------------------------------------------------------
    $(document).ready(function(){
    	$("#bt").click(function(){
    		$.ajax({
    			url:"comment.jsp",
    			type:"post",
    			data:$(".cf").serialize(),
    			datatype:"html",
    			success:function(data){
    				$(".commentText").append(data);
    			},
    			error:function(){
    				console.log("error");
    			}
    		})
    	});
    });
    //--------------------------------------------------------------------------
    </script>
</head>
<body>
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
                <div class="modify">
                    <input type="button" onclick="location.href='modify.jsp?bno=<%=bno%>'"value="수정">
                </div>
                <div class="delete">
                    <input type="button" onclick="delFn()" value="삭제">
                </div>
                <div class="mainlist">
                    <input type="button" value="목록">
                </div>
            </div>
            <div class="body">
            	<%
            		String title = rs.getString("btitle");
            		String date = rs.getString("bdate");
            		String content = rs.getString("bcontent");
            		String img1 = rs.getString("img1");
            		String img2 = rs.getString("img2");
            		String img3 = rs.getString("img3");
            		String name = rs.getString("mname");
            		%>
                <div class="boardName">
                    <a href="noticeList.jsp">공지사항></a>
                </div>
                <div class="title2">
                    제목 : <%= title %>
                </div>
                <div class="writer">
                    <i class="far fa-user"></i>
                    작성자
                </div>
                <hr>
            	 <table class="m1">
            	 		<tr>
							<td class="m4">날짜&nbsp;<%= date %></td>
						</tr>
						<tr>
							<td class="m2"><b>내용</b></td>
						</tr>
						<tr>
							<td class="m3"><%= content %><br>
							<%if(img1 != null &&!img1.equals("null")){ %>
							<img src="<%=imgPath+img1%>"><br>
							<%}
							if(img2 != null && !img2.equals("null")){
							%><img src="<%=imgPath+img2%>"><br>
							<%}
							if(img3 != null && !img3.equals("null")){
							%><img src="<%=imgPath+img3%>" ><br>
							<%} %>
							</td>
						</tr>
						</table>
                <div class="middlebody">

                </div>
                <hr>
                <div class="footbody">
                    <div class="commentTitle">
                        댓글
                    </div>
                    <div class="comment">
                       <table class="c1">
                    	<% 
//---------------댓글창보여줌------------------------------------------------------                    	
                    	//그 한줄만 나와야되니까 테이블 안쪽에서 선언하고 
                    		while(rs2.next()){
                    			String ccontent = rs2.getString("ccontent");
                    			String cdate = rs2.getString("cdate");
                    			String cname = rs2.getString("mname");                   		
                    	%>                   	
                    		<tr>
                    			<td class="cn"><%=cname %> </td>
                    		</tr>
                    		<tr>
                    			<td><%=ccontent %></td>
                    			<td class="cd"><%=cdate %></td>
                    		</tr>
                    		<%
                    		} //다 끝나고 닫히는거 잊지말기~
//------------------------------------------------------------------------------                    		
                    		%>
                    	</table>     
                     <form action="comment.jsp" name="cf" id = "cf" >  	
                        <div class="commentBox">
                            <div class="commentWriter">
                                작성
                            </div>
                            <div>
                            	<input type="hidden" id="bno" name="bno" value="<%=bno%>">
                            	<!-- 이거를 넘겨줘야 comment창에서 얘를 받아서 인서트인투해줌 파라미터도 넘겨줘야함 -->
                            	 <input type = "hidden" id = "type" name= "type" value="notice"><!-- ★  -->
                                <textarea "text" class="commentText" name="comment"
                                placeholder="댓글을 남겨보세요." onfocus="this.placeholder=''" onblur="this.placeholder='댓글을 남겨보세요.'"></textarea>
                            </div>
                            <div class="commentBtn">
                                <input type="submit" onclick="no()"value="등록">
                            </div>
                        </div>
                    </div>
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
</body>