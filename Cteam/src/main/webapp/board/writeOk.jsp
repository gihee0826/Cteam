<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project1.loginUser"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	loginUser loginUser = (loginUser)session.getAttribute("loginUser");
	
	MultipartRequest multi = new MultipartRequest(request, "C:/Users/gihee/git/repository/Cteam/src/main/webapp/upload", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();
	String file1 = (String)files.nextElement();
	String filename1 = multi.getFilesystemName(file1);
	String file2 = (String)files.nextElement();
	String filename2 = multi.getFilesystemName(file2);
	String file3 = (String)files.nextElement();
	String filename3 = multi.getFilesystemName(file3);

	out.print(filename1);
	out.print(filename2);
	out.print(filename3);
	
	String category = (String)multi.getParameter("category");
	String title = (String) multi.getParameter("title");
	String content = (String)multi.getParameter("content");
	String Img1 = (String)multi.getParameter("Img1");
	String Img2 = (String)multi.getParameter("Img2");
	String Img3 = (String)multi.getParameter("Img3");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	System.out.println(loginUser.getId());
	System.out.println(loginUser.getName());
	System.out.println(loginUser.getType());
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		String user = "tester2";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql = "";
		
		sql += "insert into board(bno,bCategory,btitle,bdate,bcontent,Img1,Img2,Img3,mno) ";
		//sql += "values(SEQ_BOARD_BNO.nextval,'"+category+"','"+title+"',sysdate,'"+content+",'"+filename1+"','"+filename2+",'"+filename3+"',"+loginUser.getNo()+")";
		sql += "values(SEQ_BOARD_BNO.nextval,'"+category+"','"+title+"',sysdate,'"+content+"','"+filename1+"','"+filename2+"','"+filename3+"',"+loginUser.getNo()+")";
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