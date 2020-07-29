<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="#"/>
    <title>工厂首页</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/dist/css/bootstrap.css"/>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <style>
        .page{
            /* 网页整体宽度 */
            width: 1200px;
            /* 网页局中 */
            margin:  0px auto;
            height: 100px;
        }
        .dv{
            float: left;
        }
    </style>
</head>
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
                <li class="active"><a href="/home.jsp">首页</a></li>
                <li><a href="/product/selecta.do">产品管理</a></li>
                <li><a href="/equipment/selecta.do">设备管理</a></li>
                <li><a href="/order/selecta.do">订单管理</a></li>
                <li><a href="/plan/selecta.do">生产计划管理</a></li>
                <li><a href="/schedule/selecta.do">生产调度管理</a></li>
                <li><a href="/track/selecta.do">生产订单跟踪</a></li>

            </ul>
        </div>
    </div>
</nav>
<div class="page" >
    <!--为echarts准备显示区域DOM-->
    <div id = "main2" style = "width: 300px;height: 200px;" class="dv"></div>
    <script type = "text/javascript">
        $(function() {
            var myChart = echarts.init(document.getElementById("main2"));
            var option = {
                // 标题组件，包含主标题和副标题
                title:{
                    show:true,
                    x:"center",
                    textStyle:{
                        fontSize:"15",
                        color:"green",
                        fontWeight:"bold",
                    }


                },
                //  提示框组件
                tooltip: {
                    //是否显示提示框组件，包括提示框浮层和 axisPointe
                    show:false,
                    // 触发类型: item:数据项触发，axis：坐标轴触发
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                // 系列列表。每个系列通过 type 决定自己的图表类型
                series: [
                    {
                        // 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
                        name:'设备状态',
                        type:'pie',
                        // 饼图的半径，数组的第一项是内半径，第二项是外半径
                        radius: ['50%', '70%'],
                        // 是否启用防止标签重叠策略，默认开启
                        avoidLabelOverlap: false,
                        hoverAnimation: false,
                        // 标签的视觉引导线样式，在 label 位置 设置为'outside'的时候会显示视觉引导线
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[]

                    }
                ]
            };
            $.ajax({
                url: 'http://localhost:8080/home/get.do',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.Status);
                        nums.push(obj.sum);
                    })
                    x=nums[0]+nums[1];
                    y=nums[2];
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        series: [{
                            name: '工厂订单',
                            type: 'pie', // 设置图表类型为柱状图
                            data:[
                                {   // 数据值
                                    value:x,
                                    // 数据项名称
                                    name:'开机率',
                                    //该数据项是否被选中
                                    selected:false,
                                    // 单个扇区的标签配置
                                    label: {
                                        normal: {
                                            // 是显示标签
                                            show: true,
                                            position: 'center',
                                            fontSize: 20,
                                            // 标签内容格式器，支持字符串模板和回调函数两种形式，字符串模板与回调函数返回的字符串均支持用 \n 换行
                                            formatter:'{b}\n{d}%',
                                        }

                                    },

                                },
                                {
                                    value:y,
                                    label:{
                                        normal:{
                                            show:false,

                                        }
                                    }

                                },

                            ]
                        }]
                    });
                }
            });
            myChart.setOption(option);
        });
    </script>
    <div id = "main3" class="dv" style = "width: 300px;height: 200px;"></div>
    <script type = "text/javascript">
        $(function() {
            var myChart = echarts.init(document.getElementById("main3"));
            var option = {
                // 标题组件，包含主标题和副标题
                title: {
                    show: true,
                    x: "center",
                    textStyle: {
                        fontSize: "15",
                        color: "green",
                        fontWeight: "bold",
                    }


                },
                //  提示框组件
                tooltip: {
                    //是否显示提示框组件，包括提示框浮层和 axisPointe
                    show: false,
                    // 触发类型: item:数据项触发，axis：坐标轴触发
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                // 系列列表。每个系列通过 type 决定自己的图表类型
                series: [
                    {
                        // 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
                        name: '设备状态',
                        type: 'pie',
                        // 饼图的半径，数组的第一项是内半径，第二项是外半径
                        radius: ['50%', '70%'],
                        // 是否启用防止标签重叠策略，默认开启
                        avoidLabelOverlap: false,
                        hoverAnimation: false,
                        // 标签的视觉引导线样式，在 label 位置 设置为'outside'的时候会显示视觉引导线
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: []

                    }
                ]
            };
            $.ajax({
                url: 'http://localhost:8080/home/get.do',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function (index, obj) {
                        names.push(obj.Status);
                        nums.push(obj.sum);
                    })
                    y = nums[0] + nums[1];
                    x = nums[2];
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        series: [{
                            name: '工厂订单',
                            type: 'pie', // 设置图表类型为柱状图
                            data: [
                                {   // 数据值
                                    value: x,
                                    // 数据项名称
                                    name: '故障率',
                                    //该数据项是否被选中
                                    selected: false,
                                    // 单个扇区的标签配置
                                    label: {
                                        normal: {
                                            // 是显示标签
                                            show: true,
                                            position: 'center',
                                            fontSize: 20,
                                            // 标签内容格式器，支持字符串模板和回调函数两种形式，字符串模板与回调函数返回的字符串均支持用 \n 换行
                                            formatter: '{b}\n{d}%',
                                        }

                                    },

                                },
                                {
                                    value: y,
                                    label: {
                                        normal: {
                                            show: false,

                                        }
                                    }

                                },

                            ]
                        }]
                    });
                }
            });
            myChart.setOption(option);
        });
    </script>
    <div id = "main4" class="dv" style = "width: 300px;height: 200px;"></div>
    <script type = "text/javascript">
        $(function() {
            var myChart = echarts.init(document.getElementById("main4"));
            var option = {
                // 标题组件，包含主标题和副标题
                title: {
                    show: true,
                    x: "center",
                    textStyle: {
                        fontSize: "15",
                        color: "green",
                        fontWeight: "bold",
                    }


                },
                //  提示框组件
                tooltip: {
                    //是否显示提示框组件，包括提示框浮层和 axisPointe
                    show: false,
                    // 触发类型: item:数据项触发，axis：坐标轴触发
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                // 系列列表。每个系列通过 type 决定自己的图表类型
                series: [
                    {
                        // 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
                        name: '设备状态',
                        type: 'pie',
                        // 饼图的半径，数组的第一项是内半径，第二项是外半径
                        radius: ['50%', '70%'],
                        // 是否启用防止标签重叠策略，默认开启
                        avoidLabelOverlap: false,
                        hoverAnimation: false,
                        // 标签的视觉引导线样式，在 label 位置 设置为'outside'的时候会显示视觉引导线
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: []

                    }
                ]
            };
            $.ajax({
                url: 'http://localhost:8080/home/get.do',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function (index, obj) {
                        names.push(obj.Status);
                        nums.push(obj.sum);
                    })
                    x = nums[0];
                    y = nums[2] + nums[1];
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        series: [{
                            name: '工厂订单',
                            type: 'pie', // 设置图表类型为柱状图
                            data: [
                                {   // 数据值
                                    value: x,
                                    // 数据项名称
                                    name: '运行率',
                                    //该数据项是否被选中
                                    selected: false,
                                    // 单个扇区的标签配置
                                    label: {
                                        normal: {
                                            // 是显示标签
                                            show: true,
                                            position: 'center',
                                            fontSize: 20,
                                            // 标签内容格式器，支持字符串模板和回调函数两种形式，字符串模板与回调函数返回的字符串均支持用 \n 换行
                                            formatter: '{b}\n{d}%',
                                        }

                                    },

                                },
                                {
                                    value: y,
                                    label: {
                                        normal: {
                                            show: false,

                                        }
                                    }

                                },

                            ]
                        }]
                    });
                }
            });
            myChart.setOption(option);
        });
    </script>
    <div id = "main5" class="dv" style = "width: 300px;height: 200px;"></div>
    <script type = "text/javascript">
        $(function() {
            var myChart = echarts.init(document.getElementById("main5"));
            var option = {
                // 标题组件，包含主标题和副标题
                title: {
                    show: true,
                    x: "center",
                    textStyle: {
                        fontSize: "15",
                        color: "green",
                        fontWeight: "bold",
                    }


                },
                //  提示框组件
                tooltip: {
                    //是否显示提示框组件，包括提示框浮层和 axisPointe
                    show: false,
                    // 触发类型: item:数据项触发，axis：坐标轴触发
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                // 系列列表。每个系列通过 type 决定自己的图表类型
                series: [
                    {
                        // 系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
                        name: '设备状态',
                        type: 'pie',
                        // 饼图的半径，数组的第一项是内半径，第二项是外半径
                        radius: ['50%', '70%'],
                        // 是否启用防止标签重叠策略，默认开启
                        avoidLabelOverlap: false,
                        hoverAnimation: false,
                        // 标签的视觉引导线样式，在 label 位置 设置为'outside'的时候会显示视觉引导线
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: []

                    }
                ]
            };
            $.ajax({
                url: 'http://localhost:8080/home/get.do',
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function (index, obj) {
                        names.push(obj.Status);
                        nums.push(obj.sum);
                    })
                    x = nums[0];
                    y = nums[1];
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        series: [{
                            name: '工厂订单',
                            type: 'pie', // 设置图表类型为柱状图
                            data: [
                                {   // 数据值
                                    value: x,
                                    // 数据项名称
                                    name: '综合效率',
                                    //该数据项是否被选中
                                    selected: false,
                                    // 单个扇区的标签配置
                                    label: {
                                        normal: {
                                            // 是显示标签
                                            show: true,
                                            position: 'center',
                                            fontSize: 20,
                                            // 标签内容格式器，支持字符串模板和回调函数两种形式，字符串模板与回调函数返回的字符串均支持用 \n 换行
                                            formatter: '{b}\n{d}%',
                                        }

                                    },

                                },
                                {
                                    value: y,
                                    label: {
                                        normal: {
                                            show: false,

                                        }
                                    }

                                },

                            ]
                        }]
                    });
                }
            });
            myChart.setOption(option);
        });
    </script>
</div>
<br>
<br>
<br>
<br>
<div class="page">
    <!-- 柱状图容器 -->
    <div id="main" class="dv" style="width:600px; height:400px;"></div>
    <script type="text/javascript">
        $(function() {
            // 初始化
            //var myChart = echarts.init(document.getElementById('main'));
            var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

            // 配置图标参数
            var options = {
                title: {
                    text: '订单数量',
                    show: true, // 是否显示标题
                    textStyle: {
                        fontSize: 18 // 标题文字大小
                    }
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    data: ['数量']
                },
                // X轴
                xAxis: {
                    data: [] // 异步请求时,这里要置空
                },
                // Y轴
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar', // 设置图表类型为柱状图
                    data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
                }]
            };
            // 给图标设置配置的参数
            myChart.setOption(options);
            myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
            $.ajax({
                url: 'http://localhost:8080/home/queryForList.do',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.month+'月');
                        nums.push(obj.sum);
                    })

                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: ['数量']
                        },
                        xAxis: {
                            data: names
                        },
                        series: [{
                            name: '数量',
                            type: 'bar', // 设置图表类型为柱状图
                            data: nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>
    <!-- 饼状图容器 -->
    <div id="pid-div" class="dv" style="width:600px; height:400px;"></div>
    <script type="text/javascript">
        $(function() {
            //var echarts = echarts.init($('#pid-div')[0]);
            var myChart = echarts.init($('#pid-div')[0]);
            var option = {
                title : {
                    text: '订单信息',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: []
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%', // 饼状图的大小
                        center: ['50%', '60%'], // 饼状图的位置
                        data:[],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            myChart.setOption(option);
            myChart.showLoading(); // 显示动画

            $.ajax({
                url: 'http://localhost:8080/home/pie.do',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {
                        names.push(obj.Status);
                        nums.push({name:obj.Status, value:obj.sum});
                    })

                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: names
                        },
                        series: [{
                            name: '工厂订单',
                            type: 'pie', // 设置图表类型为柱状图
                            data:  nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
    </script>

</div>
</body>
</html>


