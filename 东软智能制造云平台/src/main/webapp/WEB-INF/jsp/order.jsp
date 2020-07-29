<template:user_backend htmlTitle="订单信息表" bodyTitle="查看订单信息">
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
                    <li class="active"><a href="/order/selecta.do">订单管理</a></li>
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
                <%--    分页功能，暂时未实现--%>
                <%--               下面是“新建”功能，主要是弹出一个模态框，在模态框里填数据     --%>
            <div class="pull-left">
                <!-- 按钮触发模态框 -->
                <button class="btn btn-primary" style="color: #ffffff;float: left" data-toggle="modal" data-target="#myModal">
                    新建订单
                </button>
                <a href="/order/selecta.do">
                    <button class="btn btn-primary" style="color: #ffffff;float: left;margin-left: 10px">
                        显示全部
                    </button></a>
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
                                    新建订单
                                </h4>
                            </div>
                                <%--                            模态框主体部分--%>
                            <div class="modal-body" style="width: auto;height: auto;">
                                <form action="/order/add.do" enctype="multipart/form-data">
                                    <div class="form-group ">
                                        <label class="control-label">订单编号</label>
                                        <input type="text" style="width:auto;"
                                               class="form-control" placeholder="请输入订单编号" name="order_num"/>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label">订单来源</label>
                                        <input type="text" style="width: auto;"
                                               class="form-control" value="线下平台" name="order_source"
                                               readonly="readonly"/>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label">产品编号</label>
                                        <input type="text" style="width: auto;"
                                               class="form-control" placeholder="请输入产品编号" name="product_num"/>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label">订单数量</label>
                                        <input type="text" style="width: auto;"
                                               class="form-control" placeholder="请输入产品数量" name="product_count"/>
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label">截止日期</label>
                                        <input type="date" name="end_date" />
                                    </div>
                                    <div class="form-group ">
                                        <label class="control-label">订单状态</label>
                                        <input type="text" style="width: auto;"
                                               class="form-control"  name="order_status" value="10" readonly="readonly"/>
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
        </div>

            <%--                    下面是显示全部订单信息，用的老师教的jstl--%>
        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>订单编号</th>
                <th>订单来源</th>
                <th>产品编号</th>
                <th>产品数量</th>
                <th>订单截至日期</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有订单信息内容-->
            <c:forEach var="productOrder" items="${productOrders}">
                <tr>
                    <td class="text-center">
                        <input type="checkbox"></td>
                    <td class="text-center">${productOrder.orderNum}</td>
                    <td>${productOrder.orderSource}</td>
                    <td>${productOrder.productNum}</td>
                    <td>${productOrder.productCount}</td>
                    <td>${productOrder.endDate}</td>
                        <%--                    用c:if来判断订单状态，然后显示不同状态--%>
                    <td><c:if test="${productOrder.orderStatus eq 10}">未接单</c:if>
                        <c:if test="${productOrder.orderStatus eq 20}">已接单</c:if>
                        <c:if test="${productOrder.orderStatus eq 30}">已完成</c:if>
                        <c:if test="${productOrder.orderStatus eq 40}">生产中</c:if>
                        <c:if test="${productOrder.orderStatus eq 50}">已拒单</c:if>
                    </td>
                        <%--                        用c:if来判断不同订单后应有哪些不同的操作--%>
                    <td>
                        <c:if test="${productOrder.orderStatus eq 10}">
                            <%--                            注意:我在按钮里加了个a标签，这样可以加href来跳转网页，而href里的数据就可以用来传递参数，--%>
                            <%--                            我准备大部分前端的参数都有href来传递，虽然这样做会暴露各种参数，但这是我能想到的最简单的传参方法了--%>

                            <button class="btn  btn-xs btn-primary ticketAdd">
                                <span class="glyphicon glyphicon-user"></span>
                                <a href="/order/updateByStatus.do?order_num=${productOrder.orderNum}" style="color: white">
                                    接单</a>
                            </button>
                            <button class="btn  btn-xs btn-danger ticketDel">
                            <span class="glyphicon glyphicon-user">
                                <a href="/order/updateByStatus2.do?order_num=${productOrder.orderNum}">
                                    拒单</a></span>
                            </button>
                        </c:if>
                        <c:if test="${productOrder.orderStatus eq 20}">
                            <div style="display: inline">
                            </div>
                            <div style="display: inline">
                                <button  class="btn  btn-xs btn-primary" data-toggle="modal" data-target="#myModa2">
                                    <span class="glyphicon glyphicon-user"></span>
                                    转为生产计划
                                </button>
                                <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel2">
                                                    生产计划
                                                </h4>
                                            </div>

                                            <div class="modal-body" style="width: auto;height: auto;">
                                                <form action="/order/transplan.do" enctype="multipart/form-data">
                                                    <div class="form-group ">
                                                        <label class="control-label">计划编号</label>
                                                        <input type="text" style="width:auto;"
                                                               class="form-control" placeholder="请输入计划" name="plan_num"/>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">计划数量</label>
                                                        <input type="text" style="width: auto;"
                                                               class="form-control" placeholder="请输入计划数量" name="plan_count"/>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">订单编号</label>
                                                        <input type="text" style="width: auto;"
                                                               class="form-control"
                                                               value="${productOrder.orderNum}" name="order_num" readonly="readonly"/>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">产品编号</label>
                                                        <input type="text" style="width: auto;" readonly="readonly"
                                                               class="form-control" value="${productOrder.productNum}" name="product_num"/>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">计划状态</label>
                                                        <input type="text" style="width: auto;"
                                                               class="form-control" value="1" name="plan_status"
                                                               readonly="readonly"/>
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">开始时间</label>
                                                        <input type="date" name="plan_start_date" />
                                                    </div>
                                                    <div class="form-group ">
                                                        <label class="control-label">结束时间</label>
                                                        <input type="date" name="plan_end_date" />
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
                            </div>
                        </c:if>
                        <c:if test="${productOrder.orderStatus eq 30}">
                        </c:if>
                        <c:if test="${productOrder.orderStatus eq 40}">
                            <button class="btn  btn-xs btn-primary">
                                <span class="glyphicon glyphicon-user"></span>
                                <a href="/order/updateByStatus3.do?order_num=${productOrder.orderNum}" style="color: white">
                                    完成订单</a>
                            </button>
                        </c:if>
                        <c:if test="${productOrder.orderStatus eq 50}">
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


    <%--    生产计划模态框--%>

    </body>
</template:user_backend>
<script>
    var ItemId = "Item1_2";
    //使用jq弹出一个是否拒单的提示框
    $(document).ready(function () {
        $(".ticketDel").click(function () {
            if (confirm("确定拒接订单?")) {
                return true;
            }
            return false;
        });
    });
    var ItemId = "Item1_3";
    //使用jq弹出一个是否接单的提示框
    $(document).ready(function () {
        $(".ticketAdd").click(function () {
            if (confirm("确定接受订单?")) {
                return true;
            }
            return false;
        });
    });

</script>

