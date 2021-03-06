<%--
  Created by IntelliJ IDEA.
  User: XY
  Date: 2017/5/31
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="mycss/mycss.css" type="text/css" rel="stylesheet">

<style type="text/css">


    .uk-table td {
        vertical-align: top;
        width: 63px;
        margin-left: 11px;
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

<div class="block">

    <div class="leftpic">
        <img src="images/bom_img/shu.png" style="width: 5px;float: left;height: 35px;">
    </div>

    <div class="title">
        &nbsp;
        <span style="font-size: 18px;font-weight: 700;margin-top: 10px;font-family: 微软雅黑">资源分类管理</span>
    </div>

    <div class="search">
        <form class="uk-search" data-uk-search style="margin-left: 2%;margin-top: 5px;background-color: #e8edf1;">
            <input class="uk-search-field" type="search" placeholder="请输入搜索项"
                   style="width: 150px;border: 1px solid lightgray;">
        </form>
    </div>


    <!--按钮-->

    <div class="data-uk-button-radio btngroup">
        <button class="uk-button uk-icon-plus uk-button-primary" data-uk-modal="{target:'#add'}" >新增</button>
        <button class="uk-button uk-icon-edit uk-button-primary"  ng-click="editTypeRecource()" data-uk-modal="{target:'#edit'}">修改</button>
        <button class="uk-button uk-icon-trash uk-button-primary" ng-click="deleteTypeRecource()">删除</button>
    </div>

</div>

<br/>


<!--右侧表格-->
<div class="uk-width-1-1 tb">
    <div class="tbfir">

        <div class="tbsec">


            <div id="tabs-2" style="width: 100%;height: 100%;">

                <!--表格-->
                <div class="uk-overflow-container" style="height: 96%;">
                    <div class="fixtable-head">
                        <table class="uk-table uk-table-striped uk-table-hover ">
                            <thead class="uk-text-center">
                            <tr style="background-color: #e1eaf1;">
                                <td>
                                    <div class="selectpng" style="/*margin-left: 42%;*/">
                                        <img src="../../images/bom_img/select.png"
                                             style="width: 15px;width: 12px;margin-left: 16px;margin-top: 3px;">
                                    </div>
                                </td>
                                <td>序号</td>
                                <td>资源类型编码</td>
                                <td>资源类型名称</td>
                                <td>资源属性</td>
                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="fixtable-body">
                        <table class="uk-table uk-table-striped uk-table-hover " id="table_value">
                            <tbody class="uk-text-center">
                            <tr ng-repeat="x in arr | orderBy: 'id':desc">
                                <td><input name="check" type="checkbox"  ng-checked="isSelected(x.id)"
                                           ng-click="updateSelection($event,x.id)" onclick="changeColor(this)"></td>
                                <td id="id">{{x.id}}</td>
                                <td id="name">{{x.name}}</td>
                                <td id="ratio">{{x.ratio}}</td>
                                <td id="attribute">{{x.attribute}}</td>
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
        <div class=" uk-hidden uk-float-right" id="button">
            <div class="uk-panel uk-panel-box">
                <div class="data-uk-button-radio">
                    <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">DAG面板</button>
                </div>
            </div>
        </div>
    </div>--%>
</div>
<!--填写新增订单信息-->
<div class="uk-modal uk-overflow-container" id="add">
    <div class="uk-modal-dialog">
        <button type="button" class="uk-modal-close uk-close"></button>
        <div id="dialog-form" title="资源分类信息">
            <form class="uk-form uk-form-horizontal">
                <fieldset>
                    <label for="add-id">序号</label> <br/>
                    <input type="text" name="add-id" id="add-id" class="text ui-widget-content ui-corner-all" ><br/>
                    <label for="add-name">资源类型名称</label><br/>
                    <input type="text" name="add-name" id="add-name" class="text ui-widget-content ui-corner-all" ><br/>
                    <label for="add-ratio">资源类系数</label><br/>
                    <input type="text" name="add-ratio" id="add-ratio" class="text ui-widget-content ui-corner-all"><br/>
                    <label for="add-attribute">资源属性</label><br/>
                    <input type="text" name="add-attribute" id="add-attribute" class="text ui-widget-content ui-corner-all"><br/>
                </fieldset>
            </form>
        </div>
        <div class="uk-modal-footer uk-text-right">
            <button type="button" class="uk-button" ng-click="reset()">Reset</button>
            <button type="button" class="uk-button" ng-click="formValidate()">Add</button>
        </div>
    </div>
</div>

<!--修改订单信息-->
<div class="uk-modal uk-overflow-container" id="edit">
    <div class="uk-modal-dialog">
        <button type="button" class="uk-modal-close uk-close"></button>
        <div id="dialog-form" title="资源分类信息">
            <form>
                <fieldset ng-repeat="x in form track by $index">
                    <label for="edit-id">序号</label> <br/>
                    <input type="text" name="edit-id" id="edit-id" class="text ui-widget-content ui-corner-all" value="{{x.id}}"><br/>
                    <label for="edit-name">资源类型编码</label><br/>
                    <input type="text" name="edit-name" id="edit-name" class="text ui-widget-content ui-corner-all" value="{{x.name}}"><br/>
                    <label for="edit-ratio">资源类型名称</label><br/>
                    <input type="text" name="edit-ratio" id="edit-ratio" class="text ui-widget-content ui-corner-all" value="{{x.ratio}}"><br/>
                    <label for="edit-attribute">资源属性</label><br/>
                    <input type="text" name="edit-attribute" id="edit-attribute" class="text ui-widget-content ui-corner-all" value="{{x.attribute}}"><br/>
                </fieldset>
            </form>
        </div>
        <div class="uk-modal-footer uk-text-right">
            <button type="button" class="uk-button" ng-click="reset()">Reset</button>
            <button type="button" class="uk-button" ng-click="update()">Edit</button>
        </div>
    </div>
</div>




