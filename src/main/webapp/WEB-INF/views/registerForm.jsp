<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
        * {
            box-sizing: border-box;
        }

        form {
            width: 400px;
            height: 600px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 3px solid dodgerblue;
            border-radius: 10px;
        }

        .input-field {
            width: 300px;
            height: 40px;
            border: 1px solid rgb(89, 117, 196);
            border-radius: 5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            width: 300px;
            height: 30px;
            margin-top: 4px;
        }

        button {
            background-color: rgb(89, 117, 196);
            color: white;
            width: 300px;
            height: 50px;
            font-size: 17px;
            border: none;
            border-radius: 5px;
            margin: 20px 0 30px 0;
        }

        .title {
            font-size: 50px;
            margin: 40px 0 30px 0;
        }

        .msg {
            height: 30px;
            text-align: center;
            font-size: 16px;
            color: red;
            margin-bottom: 20px;
        }

        .sns-chk {
            margin-top: 5px;
        }
    </style>
    <title>Register</title>
</head>
<body>
<!--λν΄νΈλ method="get"-->
<!--    <form action="/ch2/registerInfo.jsp">-->
<!--                                                        μ΄λ²€νΈ λ±λ‘. thisλ form μκΈ° μμ -->
<!--                                                          trueμ΄λ©΄ νΌμ μ‘, falseμ΄λ©΄ μ μ‘x-->
<%--    <form action="/ch2/register/save" method="post" onsubmit="return formCheck(this)">--%>
<%--context root μλ μΆκ°νλλ‘ c:url νκ·Έ λΌμ΄λΈλ¬λ¦¬ λ£μ--%>
<%--<form action="<c:url value="/register/save"/>" method="post" onsubmit="return formCheck(this)">--%>
<form:form modelAttribute="user">
    <div class="title">νμκ°μ</div>
    <%--    <div id="msg" class="msg">${URLDecoder.decode(param.msg, "utf-8")}</div>--%>
    <div id="msg" class="msg"><form:errors path="id"/></div>
    <label for="">μμ΄λ</label>
    <input class="input-field" type="text" name="id" placeholder="8~12μλ¦¬μ μλμλ¬Έμμ μ«μ μ‘°ν©" autofocus>
    <label for="">λΉλ°λ²νΈ</label>
    <input class="input-field" type="text" name="pwd" placeholder="8~12μλ¦¬μ μλμλ¬Έμμ μ«μ μ‘°ν©">
    <label for="">μ΄λ¦</label>
    <input class="input-field" type="text" name="name" placeholder="νκΈΈλ">
    <label for="">μ΄λ©μΌ</label>
    <input class="input-field" type="text" name="email" placeholder="example@fastcampus.co.kr">
    <label for="">μμΌ</label>
    <input class="input-field" type="text" name="birth" placeholder="2020/12/31">
    <label for="">μ·¨λ―Έ</label>
    <input class="input-field" type="text" name="hobby">
    <div class="sns-chk">
        <label><input type="checkbox" name="sns" value="facebook"/>νμ΄μ€λΆ</label>
        <label><input type="checkbox" name="sns" value="kakaotalk"/>μΉ΄μΉ΄μ€ν‘</label>
        <label><input type="checkbox" name="sns" value="instagram"/>μΈμ€νκ·Έλ¨</label>
    </div>
    <button>νμ κ°μ</button>
</form:form>
<%--</form>--%>
<script>
    function formCheck(frm) {
        var msg = '';

        if (frm.id.value.length < 3) {
            setMessage('idμ κΈΈμ΄λ 3μ΄μμ΄μ΄μΌ ν©λλ€.', frm.id);
            return false;
        }

        // if (frm.pwd.value.length < 3) {
        //     setMessage('pwdμ κΈΈμ΄λ 3μ΄μμ΄μ΄μΌ ν©λλ€.', frm.pwd);
        //     return false;
        // }

        return true;
    }

    function setMessage(msg, element) {
        //                                                                                ν¬νλ¦Ώ λ¦¬ν°λ΄
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

        if (element) {
            element.select();   // κ°μ μλͺ» μλ ₯ν κ²½μ° λ€λ₯Έκ°μ μλ ₯ ν  μ μλλ‘ μλ μ ν
        }
    }
</script>
</body>
</html>