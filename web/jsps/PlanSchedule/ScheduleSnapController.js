/**
 * Created by zhaoqi on 2017/5/18.
 */
'use strict';
angular.module("IntegratedFramework.ScheduleSnapController", ['ngRoute'])
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider.when('/ScheduleSnap', {
            templateUrl: 'jsps/PlanSchedule/ScheduleSnap.jsp',
            controller: 'ScheduleSnapController'
        })
    }])
    .controller('ScheduleSnapController', function ($scope, $http, myHttpService, serviceList) {
        var setting = {
            view: {
                dblClickExpand: false,
                showIcon: false,
                showLine: false
            },
            check: {
                enable: false
            },
            callback: {
                onRightClick: OnRightClick
            },
            data: {
                keep: {
                    parent: true
                }
            },
            edit: {
                enable: true,
                showRenameBtn: false,
                showRemoveBtn: false
            },
        };
        var zNodes = [];
        var dataTrue = {"level": "top"};

        myHttpService.post(serviceList.isRootLevel, dataTrue).then(function successCallback(response) {
            console.log("*****" + response.status);
            console.log(response.data);
            zNodes = response.data;
        });


        /*var zNodes = [
            {
                id: 1, name: "右键菜单 1", open: true,
                children: [
                    {
                        id: 11, name: "节点 1-1",
                        children: [
                            {id: 21, name: "节点 1-11"},
                            {id: 22, name: "节点 1-12"},
                            {id: 23, name: "节点 1-13"},
                            {id: 24, name: "节点 1-14"}
                        ]
                    },
                    {id: 12, name: "节点 1-2"}
                ]
            },
            {
                id: 2, name: "右键操作 2", open: true,
                children: [
                    {id: 21, name: "节点 2-1"},
                    {id: 22, name: "节点 2-2"},
                    {id: 23, name: "节点 2-3"},
                    {id: 24, name: "节点 2-4"}
                ]
            }
         ];*/

        //右键操作
        function OnRightClick(event, treeId, treeNode) {
            if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
                zTree.cancelSelectedNode();
                showRMenu("root", event.clientX, event.clientY);
            } else if (treeNode && !treeNode.noR) {
                zTree.selectNode(treeNode);
                showRMenu("node", event.clientX, event.clientY);
            }
        }

        //显示右键操作
        function showRMenu(type, x, y) {
            $("#rMenu").show();
            rMenu.css({"top": (y - 70) + "px", "left": (x - 220) + "px", "visibility": "visible"});
            $("#container").bind("mousedown", onBodyMouseDown);
        }

        //隐藏右键操作
        function hideRMenu() {
            if (rMenu) rMenu.css({"visibility": "hidden"});
            $("#container").unbind("mousedown", onBodyMouseDown);
        }

        //鼠标按下操作
        function onBodyMouseDown(event) {
            if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
                rMenu.css({"visibility": "hidden"});
            }
        }

        var addCount = 1;
        //增加节点
        $scope.addTreeNode = function () {
            hideRMenu();
            var newNode = {name: "增加" + (addCount++)};
            if (zTree.getSelectedNodes()[0]) {
                zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
            } else {
                zTree.addNodes(null, newNode);
            }
        };

        //删除节点
        $scope.removeTreeNode = function () {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            if (nodes && nodes.length > 0) {
                if (nodes[0].children && nodes[0].children.length > 0) {
                    var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n确定删除？";
                    if (confirm(msg) == true) {
                        zTree.removeNode(nodes[0]);
                    }
                } else {
                    zTree.removeNode(nodes[0]);
                }
            }
        };

        //重命名节点
        $scope.renameTreeNode = function () {
            hideRMenu();
            var nodes = zTree.getSelectedNodes();
            zTree.editName(nodes[0]);
            var newName = nodes[0].name;
            if (newName.length == 0) {
                alert("节点不能为空！");
                return false;
            }
        };

        var zTree, rMenu;
        //初始化BOM树
        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            zTree = $.fn.zTree.getZTreeObj("treeDemo");
            rMenu = $("#rMenu");
        });

    });