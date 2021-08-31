<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project1.loginUser"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");

	String category = (String)request.getParameter("category");
	String title = (String) request.getParameter("title");
	String content = (String)request.getParameter("content");
	String Img1 = (String)request.getParameter("Img1");
	String Img2 = (String)request.getParameter("Img2");
	String Img3 = (String)request.getParameter("Img3");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		String user = "tester2";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql = "";
		
		sql += "insert into board(bno,bcategory,btitle,bdate,bcontent,mno) ";
		sql += " values(seq_board_bno.nextval,'"+category+"','"+title+"',sysdate,'"+content+"',"+loginUser.getNo()+")";
		
		System.out.println(sql);
		
		psmt = conn.prepareStatement(sql);
		psmt.executeUpdate();
		
		conn.commit();
		conn.setAutoCommit(true);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
		psmt.close();
	}
	
 	if(category.equals("안냥")){
	response.sendRedirect("helloList.jsp");
 	}else if(category.equals("궁금하다냥")){
	response.sendRedirect("whyList.jsp");
 	}else if(category.equals("냥품생활")){
	response.sendRedirect("buyList.jsp");
 	}else if(category.equals("고영희씨 사진첩")){
	response.sendRedirect("photoList.jsp");
 	}

%>    