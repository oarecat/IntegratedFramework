/**
 * Created by hanchangming on 2017/5/17.
 */
var webSocket;
var username;
var webSocketUrl;

function getUsername() {
    username = navigator.appName + ":" + new Date().getTime();
    // webSocketUrl = "ws://localhost:8080/IntegratedFramework/notification/" + username;
    webSocketUrl = "ws://localhost:8080/notification/" + username;
}

function webSocketInit() {
    getUsername();
    if (typeof WebSocket !== 'undefined') {
        webSocket = new WebSocket(webSocketUrl);
        //连接发生错误的回调方法
        webSocket.onerror = function () {
            showNotification("通知系统出现错误。", "danger")
        };
        //连接成功建立的回调方法
        webSocket.onopen = function () {
            showNotification("通知系统已连接。", "info");
        }
        //接收到消息的回调方法
        webSocket.onmessage = function (event) {
            showNotification(event.data, "info");
        }
        //连接关闭的回调方法
        webSocket.onclose = function () {
            showNotification("closed", "info");
        }
        window.onbeforeunload = function () {
            webSocket.close();
        }
    } else {
        showNotification("您的浏览器不支持消息通知模块，请升级浏览器。", "danger");
    }
}

function showNotification(message, status) {
    if (status == null) {
        status = "info";
    }
    UIkit.notify({
        message: message,
        status: status,
        pos: 'top-right',
        timeout: 5000
    });
}