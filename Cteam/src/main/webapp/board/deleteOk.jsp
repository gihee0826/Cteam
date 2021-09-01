<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="project1.loginUser" %> 
<%@ page import="DBmanager.DBManager" %>
<%

	request.setCharacterEncoding("UTF-8");

	loginUser loginUser = (loginUser)session.getAttribute("loginUser");

	String bno =(String)request.getParameter("bno");
	String category = (String)request.getParameter("category");
	
	if(bno == null){
		bno = "";
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "tester2";
		String pass="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql ="delete from board where bno="+bno;
		
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
	
	
	// 삭제 후 해당 리스트로 이동할 수 있게 조건문을 걸어둠
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