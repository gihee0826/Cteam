<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <script src="https://kit.fontawesome.com/57da38e2a5.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <style>
        body{
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center; 
            width: 100%;
            height: 100%;
        }
        a{
            text-decoration: none;
            color:rgb(85, 83, 83);
        }
        .logo{
            font-size: 20px;
        }
        .login{
            font-size: 28px;
            color: rgb(85, 83, 83);
        }
        .loginBox{
            width: 340px;
            height: 380px;
            background-color: #dad8ec;
            padding: 40px;
            text-align: center;
            border-radius: 8px;
            margin: 15vh auto;
        }
       .emailSearch{
           font-size: 15px;
           text-align: left;
           margin-top: 10px;
       }
       .passwordSearch{
           font-size: 15px;
           text-align: left;
           margin-top: 10px;
       }
        input[type=text],
        input[type=password]{
            width: 340px;
            height: 50px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #f4d4d4;
            font-size: 16px;
        }
        .user {
            text-align: left;
            margin-top: 80px;
            font-size: 15px;
            color: rgb(85, 83, 83);
        }
        input[type="submit"] {
            text-align: right;
            margin-top: 80px;
            margin-left: 180px;
            background-color: #f4d4d4;
            border-radius: 6px;
            border: none;
            width: 70px;
            height: 30px;
            text-align: center;
            color: rgb(85, 83, 83);
        }
        .userbar{
            display:flex;
        }
    </style>
</head>
<body>
	<form action="loginOk.jsp" method="post">
    <nav class="loginBox">
        <div class="logo">
            <a href="" class="logoI" style="color: #f4d4d4;">
                <i class="fas fa-paw"></i>
            </a>
            <a href="" class="name">?????? ?????? ?????????</a>
        </div>
        <div class="login">
            ?????????
        </div>
        <br>
        <br>
        <div class="email">
                <input type="text" name="id" placeholder="????????? ??????" onfocus="this.placeholder=''" onblur="this.placeholder='????????? ??????'">
        </div>
        <div class="emailSearch">
               <!--   <a href="" style="color: rgb(85, 83, 83)">???????????? ???????????????? </a>-->
        </div>
        <br>
        <div class="password">
            <input type="password" name="password" placeholder="????????????" onfocus="this.placeholder=''" onblur="this.placeholder='????????????'">
        </div>
        <div class="passwordSearch">
            <!--  <a href="" style="color: rgb(85, 83, 83)">??????????????? ???????????????? </a>-->
        </div>
        
        <div class="userbar">
            <div class="user">
                <a href="join.jsp">?????? ?????????</a>
            </div>
                <input type="submit" value="?????????">
            
        </div>
    </nav>
    </form>
</body>
</html>