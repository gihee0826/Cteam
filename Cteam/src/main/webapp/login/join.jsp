<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/57da38e2a5.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>Document</title>
    <script>
    //유효성 검사 : text창에서 마우스가 바깥을 눌렀을 때 그때의 유효성검사
        function checkFn(type){
				if(type == 'id'){
					var checkId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/g;
					var value = document.frm.id.value;
					var span = document.getElementsByClassName("idT")[0].getElementsByTagName("span")[0];
					if(value == ""){
						span.textContent = "*필수";
						span.style.color = "red";
						span.style.display = "inline";
					}else if(!checkId.test(value)){
						span.textContent = "*형식오류";
						span.style.color = "red";
						span.style.display = "inline";
					}else{
						span.textContent = "";
						span.style.display = "none";
					}
				}else if(type == 'pass'){
					var checkPass = /^.*(?=^.{4,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
					var value = document.frm.password.value;
					var span = document.getElementsByClassName("passwordT")[0].getElementsByTagName("span")[0];
					if(value == ""){
						span.textContent = "*필수";
						span.style.color = "red";
						span.style.display = "inline";
					}else if(!checkId.test(value)){
						span.textContent = "*형식오류";
						span.style.color = "red";
						span.style.display = "inline";
					}else{
						span.textContent = "";
						span.style.display = "none";
					}
				}else if(type == 'name'){
					var checkName = /^[가-힣]/g;
					var value = document.frm.name.value;
					var span = document.getElementsByClassName("nameT")[0].getElementsByTagName("span")[0];
					if(value == ""){
						span.textContent = "*필수";
						span.style.color = "red";
						span.style.display = "inline";
					}else if(!checkName.test(value)){
						span.textContent = "*형식오류";
						span.style.color = "red";
						span.style.display = "inline";
					}else{
						span.textContent = "";
						span.style.display = "none";
					}
				}
            }
		//만들기버튼을 눌렀을때 유효성검사하는거
            function sumbitFn(){
				var result = true;
				var checkId = /^[a-z]+[a-z0-9]{5,15}/g;
				var value = document.frm.id.value;
				var span = document.getElementsByClassName("idT")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "*필수";
					span.style.color = "red";
					span.style.display = "inline";
					 result = false;
				}else if(!checkId.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
					result = false;
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
				
				
				var checkPass = /^.*(?=^.{4,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
				value = document.frm.password.value;
				span = document.getElementsByClassName("passwordT")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "*필수";
					span.style.color = "red";
					span.style.display = "inline";
					result = false;
				}else if(!checkPass.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
					result = false;
				}else{
					span.textContent = "";
					span.style.display = "none";
				}

                var checkName = /^[가-힣]/g;
				value = document.frm.name.value;
				span = document.getElementsByClassName("nameT")[0].getElementsByTagName("span")[0];
				if(value == ""){
					span.textContent = "*필수";
					span.style.color = "red";
					span.style.display = "inline";
					result = false;
				}else if(!checkName.test(value)){
					span.textContent = "*형식오류";
					span.style.color = "red";
					span.style.display = "inline";
					result = false;
				}else{
					span.textContent = "";
					span.style.display = "none";
				}
				if(result){
					document.frm.submit();
				}
            }
    </script>
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
        .join{
            font-size: 28px;
            color: rgb(85, 83, 83);
        }
        .joinBox{
            width: 440px;
            height: 440px;
            background-color: #dad8ec;
            padding: 40px;
            text-align: center;
            border-radius: 8px;
            margin: 15vh auto;
        }
        
        .idN{
            width: 80px;
            height: 30px;
            text-align: center;
        }
        .idT{
            
        }
        .passwordN{
            width: 350px;
            height: 30px;
            margin-left: 0px;
            text-align: center;
        }
        .impor{
            
        }
        .nameN{
            width: 80px;
            height: 30px;
            text-align: center;
            margin-left: -5px;
        }
        .nameT{
            
        }
       
        input[type=text],
        input[type=password]{
            width: 330px;
            height: 50px;
            border-radius: 5px;
            outline: none;
            border: none;
            background-color: #f4d4d4;
            font-size: 16px;
        }
        
        input[type=submit] {
            text-align: right;
            margin-top: 30px;
            margin-left: 380px;
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
    <form name="frm" action="joinOk.jsp" method="post" onsubmit="return false;">
    <nav class="joinBox">
        <div class="logo">
            <a href="" class="logoI" style="color: rgb(85, 83, 83);">
                <i class="fas fa-paw"></i>
            </a>
            <a href="" class="head">나만 없어 고양이</a>
        </div>
        <div class="join">
            회원가입
        </div>
        <br>
        <br>
            <div class="idN">
                <label for="id">아이디<span class="red">*</span></label>
            </div>
            <div class="idT">
                <input type="text" class="id impor" name="id" id="id" placeholder="이메일계정을 입력하세요." onblur="checkFn('id')">
				<span class="check"></span>
            </div>
        <br>
            <div class="passwordN">
                <label for="password">비밀번호(4~15자리/영어,숫자,특수문자 사용)<span class="red">*</span></label>
            </div>
            <div class="passwordT">
                <input type="password" class="impor" name="password" id="password" placeholder="비밀번호를 입력하세요." onblur="checkFn('pass')">
				<span class="check"></span>
            </div>
        
        <br>
            <div class="nameN">
                <label for="name">이름<span class="red">*</span></label>
            </div>
            <div class="nameT">
                <input type="text" class="impor" name="name" id="name" placeholder="이름을 입력하세요." onblur="checkFn('name')">
				<span class="check"></span>
            </div>
        
        
        <div class="userbar">
            <div class="loginBtn">
                <input type="submit" onclick="sumbitFn()" value="만들기">
            </div>   
        </div>
    </nav>
</form>
</body>
</html>