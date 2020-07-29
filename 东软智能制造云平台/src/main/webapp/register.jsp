<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    .a{
        height:70px;
        line-height: 70px;
        font-family: 仿宋;
        font-size: 30px;
        font-weight: bold;
        color: #F1F1D8;
    }
    .b{
        height:70px;
        line-height: 70px;
        font-family: 仿宋;
        font-size: 20px;
        font-weight: bold;
        float: right;
        color: #F1F1D8;
    }
</style>
<body style="width:1000px; margin:0 auto; overflow-y:hidden; ">
<div class="row">
    <div class="col-lg-4 a">东软智能制造云平台</div>
    <div class="col-lg-3 col-md-offset-5 b" id="showTime"></div>
</div>
<!-- <div class="row" style="margin: 70px auto; width: 700px; height: 800px;background-color: #F1F1D8;"> -->
<div style="border-style: solid; width: 350px; height: 90px;
				border-top-right-radius:9px; border-top-left-radius: 9px; background-color: #337ab7; margin: 70px auto;">
    <div class="col-lg-12" style="height: 120px;line-height: 100px;text-align: center; margin-top: -7px;
				font-family: times new roman;font-weight: 400;font-size: 300%; color: aliceblue;">企业注册</div>
</div>
<div style="border-style: solid; width: 350px; border-top-width: 0px; height: 400px;
			border-bottom-right-radius:9px; border-bottom-left-radius: 9px; background-color: aliceblue; margin: -73px auto;">
    <div style="margin-top: 5px;">
        <form class="bs-example bs-example-form" role="form"
              action="/user/registerservice.do" method="post"
              onsubmit="return submitFrm();">
            <div class="input-group" style="width: 250px; margin: 20px auto;">
                <label for="ufty">工厂名:</label>
                </br>
                <input type="text" id="ufty" name="ufty" class="form-control"/>
            </div>
            <div class="input-group" style="width: 250px; margin: 20px auto;">
                <label for="uname">用户名:</label>
                </br>
                <input type="text" id="uname" name="uname" class="form-control"
                       onblur="checkInputforReg(this.id,regUserName,'用户名格式不正确')"/>
                <span id="unameTip"></span>
            </div>
            <div class="input-group" style="width: 250px; margin: 20px auto;">
                <label for="upwd">密码:</label>
                </br>
                <input type="password" id="upwd" name="upwd" class="form-control"
                       onblur="checkInputforReg(this.id,regUserName,'用户名格式不正确')"/>
                <span id="upwdTip"></span>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit"
                    style="width: 250px; margin: 30px auto; background-color: #337ab7;
							border-width: 0.5px; border-color: #40E0D0;">注册</button>
        </form>
    </div>
</div>
<script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery-backstretch/2.1.18/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("http://localhost:8080/img/login-bg.jpg", {
        speed: 500
    });
</script>
</body>
</html>
<script>
    //正则表达式
    var regUserName=/^[a-z]\w{1,11}$/;
    var regPwd=/^\d{5,11}$/;

    function $(id){
        return document.getElementById(id);
    }

    //(元素的id,验证的正则表达式,错误提示信息)
    function checkInputforReg(id,reg,msg){
        var input=$(id);
        if(!reg.test(input.value)){
            $(id+"Tip").innerHTML=msg;
            $(id+"Tip").className="text-danger";
            return false;
        }
        else{
            $(id+"Tip").innerHTML="√ ok";
            $(id+"Tip").className="text-success";
            return true;
        }
    }


    function submitFrm(){
        if(checkInputforReg("uname",regUserName,'用户名格式不正确')&&
            checkInputforReg("upwd",regPwd,'密码格式不正确'))
        {
            return true;
        }
        else{
            return false;
        }
    }
    function showTime(){
        //实例化日期对象
        var d=new Date();
        var dateTime=d.getFullYear()+"-"
            +(d.getMonth()+1)+"-"
            +d.getDate()+" "
            +d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();

        document.getElementById("showTime").innerHTML=dateTime;
    }

    var sid;
    //页面加载事件
    window.onload=function(){

        //每隔一段时间执行一次，周期
        sid=setInterval("showTime()",1000);


    }



</script>