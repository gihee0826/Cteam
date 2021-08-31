<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBmanager.DBManager" %>
<%@ page import="project1.loginUser" %>    
<%
	
	request.setCharacterEncoding("UTF-8");
	//리퀘스트니가 받는쪽에서 적어줘야함
	//이거 받아오는 것에 넘겨줘야함

	String bno = (String)request.getParameter("bno");
	String comment = (String)request.getParameter("comment");
	String searchType = (String)request.getParameter("searchType");
	String searchValue =(String)request.getParameter("searchValue");
	//name값과 일치하는 파라미터들을 받아와야 여기서 사용할 수 있음
	
	loginUser lu = (loginUser)session.getAttribute("loginUser");
	//로그인 유저 java에 담긴 get이니까 가져오기
	//Attribute 속성은 각각의 기본 객체가 존재하는 동안에 사용될 수 있고, JSP 페이지 사이에서 정보를 주고 받거나 공유하기 위한 목적으로 사용된다.

	int mno = lu.getNo();
	//로그인 유저의 번호를 가져와서 mno에 담겠다
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		conn = DBManager.getConnection();
		String sql = "insert into reply values(seq_reply_cno.nextval,?,sysdate,?,?)";
		//오라클 reply의 필드랑 동일해야함
		
		psmt = conn.prepareStatement(sql);
		
		
		psmt.setString(1,comment);
		psmt.setInt(2,Integer.parseInt(bno));
		psmt.setInt(3,mno);
		//?에 담길 애들을 (들어갈 위치 번호,넣을 거)를 담기
				
		psmt.executeUpdate();
		conn.commit();
		//커밋해야됨!!필수 안그러면 저장 안됨
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBManager.close(psmt, conn);
	}
	
	String type = (String)request.getParameter("type");//★
	//폼에 고정되있으니까 굳이 파라미터 안넘겨줘도 됨
	
	//여러개의 디테일화면에서 댓글넘어오면 다시 페이지를 넘겨줘야되니까 type속성의 문자열 비교로 조건 걸어주기
	if(type.equals("why")){
		response.sendRedirect("whyDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);
											//얘네는 넘어오는 파라미터들 그대로 다시 넘겨줘야 데이터가 유지되냐?
	}else if(type.equals("hello")){
		response.sendRedirect("helloDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);
	}else if(type.equals("notice")){
		response.sendRedirect("noticeDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);
	}else if(type.equals("buy")){
		response.sendRedirect("buyDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);
	}else if(type.equals("photo")){
		response.sendRedirect("photoDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);
	}
	//response.sendRedirect("HelloDetail.jsp?bno="+bno+"&comment="+comment+"&searchType="+searchType+"&searchValue="+searchValue);

%>