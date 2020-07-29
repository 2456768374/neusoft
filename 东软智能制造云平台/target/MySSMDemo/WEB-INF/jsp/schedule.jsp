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
                    <li><a href="/equipment/selecta.do">设备管理</a></li>
                    <li><a href="/order/selecta.do">订单管理</a></li>
                    <li><a href="/plan/selecta.do">生产计划管理</a></li>
                    <li class="active"><a href="/schedule/selecta.do">生产调度管理</a></li>
                    <li><a href="/track/selecta.do">生产订单跟踪</a></li>

                </ul>
            </div>
        </div>
    </nav>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
                <%--    分页功能，暂时未实现--%>

            <a href="/schedule/selecta.do"><button class="btn btn-primary" style="color: #ffffff">显示全部</button></a>

        </div>

            <%--                    下面是显示全部订单信息，用的老师教的jstl--%>
        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>计划编号</th>
                <th>产品编号</th>
                <th>计划数量</th>
                <th>工单号</th>
                <th>设备序列号</th>
                <th>开始日期</th>
                <th>结束日期</th>
                <th>工单状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有订单信息内容-->
            <c:forEach var="productSchedule" items="${productSchedules}">
                <tr>
                    <td class="text-center">
                        <input type="checkbox"></td>
                    <td class="text-center">${productSchedule.planNum}</td>
                    <td>${productSchedule.productNum}</td>
                    <td>${productSchedule.planCount}</td>
                    <td>${productSchedule.scheduleNum}</td>
                    <td>${productSchedule.equipmentNum}</td>
                    <td>${productSchedule.startDate}</td>
                    <td>${productSchedule.endDate}</td>
                        <%--                    用c:if来判断订单状态，然后显示不同状态--%>
                    <td><c:if test="${productSchedule.scheduleStatus eq 10}">未开始</c:if>
                        <c:if test="${productSchedule.scheduleStatus eq 20}">生产中</c:if>
                        <c:if test="${productSchedule.scheduleStatus eq 30}">已完成</c:if>
                    </td>
                        <%--                        用c:if来判断不同订单后应有哪些不同的操作--%>
                    <td>
                        <c:if test="${productSchedule.scheduleStatus eq 10}">
                            <div style="display: inline">
                            <button class="btn  btn-xs btn-primary ticketSet" style="color: white;">
                                <span class="glyphicon glyphicon-user"></span>
                                <a href="/schedule/updateByStatus.do?schedule_num=${productSchedule.scheduleNum}" style="color: white">启动</a>
                            </button>
                            </div>

                            <button class="btn  btn-xs btn-danger ticketDel">
                            <span class="glyphicon glyphicon-user">
                                <a href="/schedule/deleteByNum.do?schedule_num=${productSchedule.scheduleNum}&equipment_num=${productSchedule.equipmentNum}">
                                    删除</a></span>
                            </button>
                        </c:if>
                        <c:if test="${productSchedule.scheduleStatus eq 20}">

                            <button class="btn  btn-xs btn-info" data-toggle="modal" data-target="#myModa2" style="color: white;">
                                <span class="glyphicon glyphicon-list"></span>
                                订单跟踪
                            </button>
                            <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel2">
                                                订单跟踪
                                            </h4>
                                        </div>

                                        <div class="modal-body" style="width: auto;height: auto;">
                                            <form action="/schedule/transtrack.do" enctype="multipart/form-data">
                                                <div class="form-group ">
                                                    <label class="control-label">工单号</label>
                                                    <input type="text" style="width:auto;"
                                                           class="form-control" value="${productSchedule.scheduleNum}" name="schedule_num" readonly="readonly"/>
                                                </div>
                                                <div class="form-group ">
                                                    <label class="control-label">计划编号</label>
                                                    <input type="text" style="width: auto;"
                                                           class="form-control" value="${productSchedule.planNum}" name="plan_num" readonly="readonly"/>
                                                </div>
                                                <div class="form-group ">
                                                    <label class="control-label">工单状态</label>
                                                    <input type="text" style="width: auto;"
                                                           class="form-control"
                                                           value="${productSchedule.scheduleStatus}" name="schedule_status" readonly="readonly"/>
                                                </div>
                                                <div class="form-group ">
                                                    <label class="control-label">产品编号</label>
                                                    <input type="text" style="width: auto;"
                                                           class="form-control" value="${productSchedule.productNum}" name="product_num" readonly="readonly"/>
                                                </div>
                                                <div class="form-group ">
                                                    <label class="control-label">设备序列号</label>
                                                    <input type="text" style="width: auto;"
                                                           class="form-control" value="${productSchedule.equipmentNum}" name="equment_num" readonly="readonly"/>
                                                </div>

                                                <p class="col-lg-4 col-lg-offset-4">
                                                    <button class="btn"  style="background-color:#0b7285;color: white; width: auto;">提交</button>
                                                </p>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${productSchedule.scheduleStatus eq 30}">

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
            if (confirm("确定删除?")) {
                return true;
            }
            return false;
        });
    });
    var ItemId = "Item1_2";
    //使用jq弹出一个是否删除的提示框
    $(document).ready(function () {
        $(".ticketSet").click(function () {
            if (confirm("确定启动?")) {
                return true;
            }
            return false;
        });
    });

</script>

