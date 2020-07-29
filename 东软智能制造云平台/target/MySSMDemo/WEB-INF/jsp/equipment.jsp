<template:user_backend htmlTitle="计划信息表" bodyTitle="查看计划信息">
    <%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link rel="stylesheet" type="text/css" href="bootstrap/dist/css/bootstrap.css"/>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <body background="http://localhost:8080/img/main-bg.jpg">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">东软智能制造云平台</a>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home.jsp">首页</a></li>
                    <li><a href="/product/selecta.do">产品管理</a></li>
                    <li class="active"><a href="/equipment/selecta.do">设备管理</a></li>
                    <li><a href="/order/selecta.do">订单管理</a></li>
                    <li><a href="/plan/selecta.do">生产计划管理</a></li>
                    <li><a href="/schedule/selecta.do">生产调度管理</a></li>
                    <li><a href="/track/selecta.do">生产订单跟踪</a></li>

                </ul>
            </div>
        </div>
    </nav>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
            <button class="btn btn-primary" style="color: #ffffff; float: left" data-toggle="modal" data-target="#myModal">
                新增设备
            </button>
            <a href="/equipment/selecta.do"><button class="btn btn-primary" style="color: #ffffff; float:left;margin-left: 10px">显示全部</button></a>
                <%--           用提交表单的形式，action里面写要提交给控制层的哪个方法        --%>
            <form class="bs-example bs-example-form" role="form"
                  action="/equipment/selectByNum.do"
                  onsubmit="return true;">
                <div class="input-group" style="width: 170px; float: left; margin-left: 50px">
                    <span class="input-group-addon">设备序列号</span>
                    <input type="text" id="" name="equipment_num" class="form-control">
                </div>
                <div>
                    <button type="submit" class="btn btn-primary"
                            style="margin-left: 20px; float: left; color: #ffffff;">查询</button>
                </div>
            </form>
            <!-- 模态框（Modal） 相当于class为model fade的div-->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                            <%--                            模态框标题位置     --%>
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                新增设备
                            </h4>
                        </div>
                            <%--                            模态框主体部分--%>
                        <div class="modal-body" style="width: auto;height: auto;">
                            <form action="/equipment/add.do" enctype="multipart/form-data">
                                <div class="form-group ">
                                    <label class="control-label">设备序列号</label>
                                    <input type="text" style="width:auto;"
                                           class="form-control" placeholder="请输入设备序列号" name="equipment_num"/>
                                </div>
<%--                                <div class="form-group ">--%>
<%--                                    <label class="control-label">设备图片</label>--%>
<%--                                    <input type="text" style="width: auto;"--%>
<%--                                           class="form-control"  name="equipment_img_url" />--%>
<%--                                </div>--%>
                                <div class="form-group ">
                                    <label class="control-label">设备状态</label>
                                    <input type="text" style="width: auto;"
                                           class="form-control" value="10" name="equipment_status" readonly="readonly"/>
                                </div>
                                <p class="col-lg-4 col-lg-offset-4">
                                    <button class="btn"  style="background-color:#0b7285;color: white; width: auto;">提交</button>
                                </p>
                            </form>
                        </div>
                            <%--                            模态框结束部分--%>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <%--                    下面是显示全部订单信息，用的老师教的jstl--%>
        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>设备序列号</th>
<%--                <th>设备图片</th>--%>
                <th>设备状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有订单信息内容-->
            <c:forEach var="equipment" items="${equipments}">
                <tr>
                    <td class="text-center">
                        <input type="checkbox"></td>
                    <td class="text-center">${equipment.equipmentNum}</td>
<%--                    <td>${equipment.equipmentImgUrl}</td>--%>
                        <%--                    用c:if来判断订单状态，然后显示不同状态--%>
                    <td><c:if test="${equipment.equipmentStatus eq 10}">启用</c:if>
                        <c:if test="${equipment.equipmentStatus eq 20}">停用</c:if>
                        <c:if test="${equipment.equipmentStatus eq 30}">故障</c:if>
                    </td>
                        <%--                        用c:if来判断不同订单后应有哪些不同的操作--%>
                    <td>
                        <c:if test="${equipment.equipmentStatus eq 10}">
                            <button class="btn  btn-xs btn-primary ticketDel" style="color: white;">
                                <span class="glyphicon glyphicon-user"></span>
                                <a href="/equipment/update.do?equipment_num=${equipment.equipmentNum}" style="color: white">
                                    停用</a>
                            </button>
                            <button class="btn  btn-xs btn-danger ticketDee">
                            <span class="glyphicon glyphicon-user">
                                <a href="/equipment/deleteByEqu.do?equipment_num=${equipment.equipmentNum}">
                                    删除</a></span>
                            </button>
                        </c:if>
                        <c:if test="${equipment.equipmentStatus eq 20}">
                            <button class="btn  btn-xs btn-primary ticketSet" style="color: white;">
                                <span class="glyphicon glyphicon-user"></span>
                                <a href="/equipment/update2.do?equipment_num=${equipment.equipmentNum}" style="color: white">
                                    启用</a>
                            </button>
                            <button class="btn  btn-xs btn-danger ticketDee">
                            <span class="glyphicon glyphicon-user">
                                <a href="/equipment/deleteByEqu.do?equipment_num=${equipment.equipmentNum}">
                                    删除</a></span>
                            </button>
                        </c:if>
                        <c:if test="${equipment.equipmentStatus eq 30}">
                            <button class="btn  btn-xs btn-danger ticketDee">
                            <span class="glyphicon glyphicon-user">
                                <a href="/equipment/deleteByEqu.do?equipment_num=${equipment.equipmentNum}">
                                    删除</a></span>
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-right">
            <zsc:page url="${cx}/student/list"/>
        </div>
    </div>

    </body>

</template:user_backend>
<script>
    var ItemId = "Item1_2";
    //使用jq弹出一个是否删除的提示框
    $(document).ready(function () {
        $(".ticketDel").click(function () {
            if (confirm("确定停用?")) {
                return true;
            }
            return false;
        });
    });
    var ItemId = "Item1_2";
    //使用jq弹出一个是否删除的提示框
    $(document).ready(function () {
        $(".ticketSet").click(function () {
            if (confirm("确定启用?")) {
                return true;
            }
            return false;
        });
    });
    var ItemId = "Item1_2";
    //使用jq弹出一个是否删除的提示框
    $(document).ready(function () {
        $(".ticketDee").click(function () {
            if (confirm("确定删除?")) {
                return true;
            }
            return false;
        });
    });

</script>

