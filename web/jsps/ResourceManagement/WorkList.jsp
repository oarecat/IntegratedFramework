<%--
  Created by IntelliJ IDEA.
  User: zhaoqi
  Date: 2017/5/17
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="uk-grid">
    <div class="uk-width-1-4">
        <form class="uk-search" data-uk-search>
            <input class="uk-search-field" type="search" placeholder="请输入关键字">
        </form>
    </div>
    <div class="uk-width-1-4">
        <div class="uk-button uk-form-select uk-active" data-uk-form-select>
            <span>请选择</span>
            <select>
                <option value="1">选项一</option>
                <option value="2">选项二</option>
                <option value="2">选项三</option>
            </select>
        </div>
    </div>
    <div class="uk-width-1-4">
        <form class="uk-form">
            <input type="text" id="datepicker" class="uk-icon-calendar" data-uk-datepicker="{format:'DD.MM.YYYY'}"
                   placeholder="2017/5/17">
            <i class="uk-icon-calendar"></i>
        </form>
    </div>
    <div class="uk-width-1-4">
        <div class="data-uk-button-radio">
            <button class="uk-button uk-icon-edit" data-uk-modal="{target:'#edit'}">修改</button>
            <button class="uk-button uk-icon-plus">新增</button>
            <button class="uk-button uk-icon-trash">删除</button>
        </div>
    </div>
</div>
<hr class="uk-article-divider">
<div class="uk-overflow-container">
    <table class="uk-table uk-table-striped uk-table-hover " id="order">
        <thead>
        <tr>
            <th></th>
            <th>班次编码</th>
            <th>班次名称</th>
            <th>班次类型</th>
            <th>时间段</th>
            <th>加班</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><input type="checkbox"></td>
            <td>1</td>
            <td class="uk-grid">
                <select class="uk-grid">
                    <option value="1">08:30至17:00</option>
                    <option value="2">选项二</option>
                    <option value="3">选项三</option>
                </select>
            </td>
            <td class="uk-grid">
                <select class="uk-grid">
                    <option value="1">上午班</option>
                    <option value="2">中午班</option>
                    <option value="3">下午班</option>
                </select>
            </td>
            <!--<td><input type="text" class="uk-form-select" data-uk-form-select>
                <select>
                    <option value="1">上午班</option>
                    <option value="2">中午班</option>
                    <option value="2">下午班</option>
                </select>
            </td>
             <td>
                <form class="uk-form">
                    <input type="text" id="datepicker2" data-uk-datepicker="{format:'DD.MM.YYYY'}"
                           placeholder="请选择查找日期">
                </form>
            </td>-->

            <td class="uk-grid">
                <select class="uk-grid">
                    <option value="1">08:30-11:29</option>
                    <option value="2">11:29-05:00</option>
                </select>
            </td>

            <td class="uk-grid">
                <select class="uk-grid">
                    <option value="1">加班</option>
                    <option value="2">不加班</option>
                </select>
            </td>
        </tr>
        </tbody>

    </table>

    <div>
        <ul class="uk-pagination" style="margin-top:280px " data-uk-pagination="{currentPage:50}">
            <li><a href="#">首页</a></li>
            <li><a href="#">上一页</a></li>
            <li><a href="#">下一页</a></li>
            <li><a href="#">末页</a></li>
        </ul>
    </div>

</div>

<!--<div id="dialog-form" title="创建新表单">
<p class="validateTips">所有的表单字段都是必填的。</p>
<form>
<fieldset>
<lable for="number">编号</lable>
<br/>
<input type="text" name="number" id="number" clsss="text ui-widget-content ui-corner-all"><br/>
<label for="name">名字</label><br/>
<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all"><br/>
</fieldset>
</form>
</div>-->

<div class="uk-modal" id="edit">
    <div class="uk-modal-dialog">
        <button type="button" class="uk-modal-close uk-close"></button>
        <div class="uk-modal-header">
            <h2>修改</h2>
        </div>
        <table class="uk-table uk-table-striped uk-table-hover uk-overflow-container">
            <thead>
            <tr>
                <th></th>
                <th>项目一</th>
                <th>项目二</th>
                <th>项目三</th>
                <th>项目四</th>
                <th>项目五</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
            </tr>
            </tbody>
        </table>
        <div class="uk-modal-footer uk-text-right">
            <button type="button" class="uk-button">Cancel</button>
            <button type="button" class="uk-button" onclick="UIkit.modal.confirm('确定修改吗？',function(){UIkit.modal.alert('修改成功！');

            });">Edit
            </button>
        </div>
    </div>
</div>

<div class="uk-clearfix">
    <button class="uk-button uk-float-right " id="create-order" data-uk-sticky="{top:500,boundary:'#add-a-delay'}"
            data-uk-toggle="{target:'#button'}" style="border-radius:15px; "
            data-uk-tooltip="{pos:'top'}" title="快捷菜单">+
    </button>
    <div class=" uk-hidden uk-float-right" id="button">
        <div class="uk-panel uk-panel-box">
            <div class="data-uk-button-radio">
                <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">班次详情</button>
                <br>
                <button class="uk-button" style="margin: 3px" data-uk-modal="{target:'#group'}">班次时间设定</button>

            </div>
        </div>
    </div>
</div>

<div class="uk-modal" id="group">
    <div class="uk-modal-dialog" >
        <table class="uk-table uk-table-striped uk-table-hover uk-overflow-container">
            <thead>
            <tr>
                <th></th>
                <th>项目一</th>
                <th>项目二</th>
                <th>项目三</th>
                <th>项目四</th>
                <th>项目五</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
                <td>表格项目一</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>表格项目二</td>
                <td>表格项目二</td>
                <td>表格项目二</td>
                <td>表格项目二</td>
                <td>表格项目二</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function () {
        $("#datepicker").datepicker();
    });
</script>








