<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Management_Admin_Default" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>后台账户列表</title>
		<meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
	    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
	    <style type="text/css">
	    	.iframe_right .list li>div:nth-child(1){
	    		width: 10%;
	    		text-indent: 0.2rem;
	    	}
	    	.iframe_right .list li>div:nth-child(2){
	    		width: 13%;
	    	}
	    	.iframe_right .list li>div:nth-child(3){
	    		width: 13%;
	    	}
	    	.iframe_right .list li>div:nth-child(4){
	    		width: 12%;
	    	}
	    	.iframe_right .list li>div:nth-child(5){
	    		width: 13%;
	    	}
	    	.iframe_right .list li>div:nth-child(6){
	    		width: 15%;
	    	}
	    	.iframe_right .list li>div:nth-child(7){
	    		width: 20%;
	    	}
	    	.alert_box div {
			    width: 4.7rem;
			}
	    </style>
	</head>
	<body>
		<div class="iframe_right">
			<div class="title" style="position: relative;">
            <h2>管理员列表</h2>
            <a href="Add.aspx" class="btn post" style="position: absolute; right: 0.2rem; top: 0.08rem;">新建管理员账户</a>
        </div>
			<div class="list">
				<ul>
					<li>
						<div>序列</div>
						<div>登录账户</div>
						<div>姓名</div>
						<div>手机号码</div>
						<div>最后登录时间</div>
						<div>最后登录IP</div>
						<div>操作</div>
					</li>
                    <asp:Repeater ID="rpList" runat="server">
                        <ItemTemplate>
					<li>
						<div><%#Eval("ID") %></div>
						<div><%#Eval("LoginName") %></div>
						<div><%#Eval("Name") %></div>
						<div><%#Eval("Mobile") %></div>
						<div><%#Eval("LastLoginTime") %></div>
						<div><%#Eval("LastLoginIp") %></div>
						<div>
							<a href="Edit.aspx?ID=<%#Eval("ID") %>" class="btns">修改</a>
							<a href="javascript:void(0)" class="btns delete" data-role="delete" data-id="<%#Eval("ID") %>">删除</a>
						</div>
					</li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
			</div>
		</div>
		<script type="text/javascript" src="../js/jquery-3.1.0.min.js" ></script>
		<script type="text/javascript" src="../js/common.js" ></script>
		<script type="text/javascript">
			$(function(){
			    $("[data-role='delete']").click(function () {
			        if (confirm("确定删除此管理员吗?")) {
			            var item = $(this).parent().parent();
			            item.fadeOut(500);
			            $.post("../../Handler/DeleteAdminHandler.ashx", { "ID": $(this).attr("data-id") }, function (res) {
			                var json = JSON.parse(res);
			                if (!json.Result) {
			                    alert(json.Message);
			                    item.show();
			                    return;
			                }
			            });
			        }
			    });
			});
		</script>
	</body>
</html>
