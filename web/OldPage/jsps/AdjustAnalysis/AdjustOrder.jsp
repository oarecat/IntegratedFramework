<%--
  Created by IntelliJ IDEA.
  User: XY
  Date: 2017/6/2
  Time: 09:21
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="mycss/mycss.css" type="text/css" rel="stylesheet">

<style type="text/css">
    .uk-table td {
        vertical-align: top;
        width: 85px;
        margin-left: 11px;
    }

    .ui-tabs {
        position: unset;
        padding: .2em;
    }

</style>


<script>
    function changeColor(obj) {
        var f = obj.checked;
        var chkColor = "#c1edfa"; //选中后颜色
        var ouColor = "#f3f8fb";  //偶数行取消选中后的颜色
        var jiColor = "#FFFFFF";
        if (f)
            obj.parentElement.parentElement.style.backgroundColor = chkColor;
        else
            obj.parentElement.parentElement.style.backgroundColor = jiColor;
    }
</script>

<div class="block" style="/*height: 8%;margin-top: 10px;background-color: white;margin-left: 0px;width: 100%;*/">

    <div class="leftpic">
        <img src="images/bom_img/shu.png" style="width: 5px;float: left;height: 35px;">
    </div>

    <div class="title">
        &nbsp;
        <span style="font-size: 18px;font-weight: 700;margin-top: 10px;font-family: 微软雅黑">调整订单任务</span>
    </div>

    <div class="search">
        <form class="uk-search" data-uk-search style="margin-left: 2%;margin-top: 5px;background-color: #e8edf1;">
            <input class="uk-search-field" type="search" placeholder="请输入搜索项"
                   style="width: 150px;border: 1px solid lightgray;">
        </form>
    </div>


    <%--</div>--%>

    <!--下拉框-->
    <div class="orderselect">
        <form class="uk-form" style="margin-left: 2%;">
            <div class="" style="margin-top: 4px;">
                <select class="uk-grid" style="height: 30px;">
                    <option value="1">所有异常</option>
                    <option value="2">异常1</option>
                </select>
            </div>
        </form>
    </div>


    <!--异常模拟-->
    <div class="uk-width-1-4" style="float: right;margin-top: 5px;">
        <div class="uk-clearfix">
            <button class="uk-button uk-float-right " <%--id="create-order"--%>
                    data-uk-toggle="{target:'#button'}" style="border-radius:15px; "
                    data-uk-tooltip="{pos:'top'}" title="快捷菜单">异常模拟
            </button>
            <div class=" uk-hidden uk-float-right" id="button">
                <div class="uk-panel uk-panel-box">
                    <div class="data-uk-button-radio">
                        <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">MES</button>
                        <br>
                        <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">手工模拟</button>
                        <%--<br>
                        <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">异常3</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<hr class="uk-article-divider">--%>
<br/>
<%--<div class="uk-grid" style="margin-top: -25px;">--%>

<!--右侧表格-->
<div class="uk-width-1-1 tb"
     style="/*width: 98%;border: 1px solid lightgray;margin-left: 1%;height: 85%;background-color: white;*/">
    <div class="tbfir">

        <!--tab-->
        <div class="tbsec" id="tabs" style="height:98%;width: 99%;/*border: 0px;margin-top: -10px;height: 98%;*/">
            <ul>
                <li><a href="#tabs-1">交期承诺分析</a></li>
                <li><a href="#tabs-2">紧急插单分析</a></li>

            </ul>
            <div id="tabs-1" style="width: 99%;height: 86%;margin-left: -2%;">

                <!--表格-->
                <div class="uk-overflow-container" style="height: 96%;width: 101%;">
                    <div class="fixtable-head" style="/*height: 15%;*/">
                        <table class="uk-table uk-table-striped uk-table-hover ">
                            <thead class="uk-text-center">
                            <tr style="background-color: #e1eaf1;">
                                <td style="width: 80px;">
                                    <div class="selectpng" style="/*margin-left: 20%;*/">
                                        <img src="images/bom_img/select.png"
                                             style="width: 15px;width: 12px;margin-left: 16px;margin-top: 3px;">
                                    </div>

                                </td>
                                <td>状态</td>
                                <td>编码</td>
                                <td>名称</td>
                                <td>产品名</td>
                                <td>数量</td>
                                <td>优先级</td>
                                <%--<td>最早下单时间</td>
                                <td>最晚开工时间</td>
                                <td>交付时间</td>--%>
                                <td>租户名</td>
                                <td>操作</td>
                                <td>来源</td>

                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="fixtable-body" style="top: 110px;width: 99%;">
                        <table class="uk-table uk-table-striped uk-table-hover ">

                            <tbody class="uk-text-center">

                            </tbody>

                        </table>


                    </div>

                </div>

                <br/>

                <!--底部页码-->
                <%--<div style="margin-top: -25px;">
                    <ul class="uk-pagination" &lt;%&ndash;style="margin-top: 7%;"&ndash;%&gt; data-uk-pagination="{currentPage:50}">
                        <li><button class="uk-button" style="background-image: url('../../images/bom_img/ye1.png');color: white;"><a href="" style="color: white;">首页</a></button></li>
                        <li><button class="uk-button my"><a href="">上一页</a></button></li>
                        <li><button class="uk-button my"><a href="">下一页</a></button></li>
                        <li><button class="uk-button my"><a href="">尾页</a></button></li>
                        <li>共10页</li>&nbsp;
                        <li>
                            到第<input type="text" value="1" style="width: 28px;background-color: #EEF7FC;">页
                        </li>
                        <li>
                            <button class="uk-button" style="background-image: url('../../images/bom_img/ye2.png');color: white;">确定</button>
                        </li>
                    </ul>
                </div>--%>

            </div>
            <div id="tabs-2" style="width: 99%;height: 86%;margin-left: -2%;">

                <!--表格-->
                <div class="uk-overflow-container" style="height: 92%;width: 101%;">
                    <div class="fixtable-head" style="/*height: 15%;*/">
                        <table class="uk-table uk-table-striped uk-table-hover ">
                            <thead class="uk-text-center">
                            <tr style="background-color: #e1eaf1;">
                                <td>
                                    <div class="selectpng" style="/*margin-left: 33%;*/">
                                        <img src="images/bom_img/select.png"
                                             style="width: 15px;width: 12px;margin-left: 16px;margin-top: 3px;">
                                    </div>

                                </td>
                                <td>编码</td>
                                <td>名称</td>
                                <td>资源类型</td>
                                <td>移动速度</td>
                                <%--<td>串行能力</td>
                                <td>并行能力下限</td>
                                <td>并行能力上限</td>--%>
                                <td>能力恢复</td>
                                <td>正常班次</td>
                                <td>状态信息</td>

                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="fixtable-body" style="top: 110px;width: 99%;">
                        <table class="uk-table uk-table-striped uk-table-hover " id="order">

                            <tbody class="uk-text-center">
                            <tr>
                                <td><input type="checkbox" onclick="changeColor(this)"></td>
                                <td>1001</td>
                                <td>未知</td>
                                <td>未知</td>
                                <td>100</td>
                                <td>50</td>
                                <td>待定</td>
                                <td>未知</td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" onclick="changeColor(this)"></td>
                                <td>1001</td>
                                <td>未知</td>
                                <td>未知</td>
                                <td>100</td>
                                <td>50</td>
                                <td>待定</td>
                                <td>未知</td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" onclick="changeColor(this)"></td>
                                <td>1001</td>
                                <td>未知</td>
                                <td>未知</td>
                                <td>100</td>
                                <td>50</td>
                                <td>待定</td>
                                <td>未知</td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" onclick="changeColor(this)"></td>
                                <td>1001</td>
                                <td>未知</td>
                                <td>未知</td>
                                <td>100</td>
                                <td>50</td>
                                <td>待定</td>
                                <td>未知</td>

                            </tr>

                            </tbody>

                        </table>


                    </div>


                </div>

                <br/>

                <!--底部页码-->
                <%--<div style="margin-top: -25px;">
                    <ul class="uk-pagination" &lt;%&ndash;style="margin-top: 7%;"&ndash;%&gt; data-uk-pagination="{currentPage:50}">
                        <li><button class="uk-button" style="background-image: url('../../images/bom_img/ye1.png');color: white;"><a href="" style="color: white;">首页</a></button></li>
                        <li><button class="uk-button my"><a href="">上一页</a></button></li>
                        <li><button class="uk-button my"><a href="">下一页</a></button></li>
                        <li><button class="uk-button my"><a href="">尾页</a></button></li>
                        <li>共10页</li>&nbsp;
                        <li>
                            到第<input type="text" value="1" style="width: 28px;background-color: #EEF7FC;">页
                        </li>
                        <li>
                            <button class="uk-button" style="background-image: url('../../images/bom_img/ye2.png');color: white;">确定</button>
                        </li>
                    </ul>
                </div>--%>

            </div>

        </div>

    </div>

    <!--快捷键-->
    <%--<div class="uk-clearfix" style="margin-top: -3%;">
        <button class="uk-button uk-float-right " id="create-order"
                style="background-image: url('../../images/kuaijie.png');background-size: 100% 100%;"
                title="快捷菜单">
        </button>
        <div class=" uk-hidden uk-float-right" &lt;%&ndash;id="button"&ndash;%&gt;>
            <div class="uk-panel uk-panel-box">
                <div class="data-uk-button-radio">
                    <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">DAG面板</button>
                </div>
            </div>
        </div>
    </div>--%>
</div>
<%--</div>--%>

<script>
    $(function () {
        $("#tabs").tabs();
    });
</script>

<script>
    $(function () {
        $("#Order").tabs();
    });
</script>