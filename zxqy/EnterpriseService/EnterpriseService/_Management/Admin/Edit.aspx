<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="_Management_Admin_Edit" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加账户</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        body {
            overflow-y: auto;
        }

        .enter_info li {
            width: 100%;
        }

            .enter_info li > span {
                width: 11%;
                vertical-align: middle;
            }

            .enter_info li.gender input {
                width: 0.2rem;
                height: 0.2rem;
                margin: 0 0.1rem;
                vertical-align: middle;
            }

            .enter_info li > input, .enter_info li > select {
                height: 0.42rem;
            }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>修改账户</h2>
        </div>
        <div class="enter_info">
            <ul>
                <li>
                    <span>登录账号</span>
                    <input type="text" name="" id="LoginName" value="<%=admin.LoginName.Trim() %>" placeholder="请输入登录账号" />
                </li>
                <li>
                    <span>密　　码</span>
                    <input type="password" name="" id="Password" value="<%=admin.Password.Trim() %>" placeholder="请输入密码" />
                </li>
                <li>
                    <span>确认密码</span>
                    <input type="password" name="" id="cmPassword" value="<%=admin.Password.Trim() %>" placeholder="请确认密码" />
                </li>
                <li>
                    <span>电子邮件</span>
                    <input type="text" name="" id="Email" value="<%=admin.Email.Trim() %>" placeholder="请输入公司Email" />
                </li>
                <li>
                    <span>姓　　名</span>
                    <input type="text" name="" id="Name" value="<%=admin.Name.Trim() %>" placeholder="请输入姓名" />
                </li>
                <li class="gender">
                    <span>性　　别</span>
                    <input type="radio" name="Gender" id="" value="1" <%=admin.Gender==1?"checked":"" %> />男
					<input type="radio" name="Gender" id="" value="0" <%=admin.Gender==0?"checked":"" %> />女
                </li>
                <li>
                    <span>公司职位</span>
                    <input type="text" name="" id="Position" value="<%=admin.Position.Trim() %>" placeholder="请输入公司职位" />
                </li>
                <li>
                    <span>手机号码</span>
                    <input type="text" name="" id="Mobile" value="<%=admin.Mobile!=null?admin.Mobile.Trim():string.Empty %>" placeholder="请输入手机号码" />
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
                        <a href="Default.aspx" class="btn">取消</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            var postFunc = function (e) {
                var LoginName = $.trim($("#LoginName").val());
                var Password = $.trim($("#Password").val());
                var Email = $.trim($("#Email").val());
                var Name = $.trim($("#Name").val());
                var Gender = $.trim($("input[name='Gender']:checked").val());
                var Position = $.trim($("#Position").val());
                var Mobile = $.trim($("#Mobile").val());

                if (LoginName.length == 0 || Password.length == 0) {
                    alert("请输入登录账号和密码");
                    return;
                }
                if (Password.length < 6 || Password.length > 16) {
                    alert("密码长度在6-16个字符之间");
                    return;
                }
                if (Password != $.trim($("#cmPassword").val())) {
                    alert("两次输入的密码不一致");
                    return;
                }
                if (Name.length == 0) {
                    alert("姓名不能为空");
                    return;
                }
                if (!(/^1([0-9]{10})$/.test(Mobile))) {
                    alert("请输入正确的手机号码");
                    return;
                }
                $(e.target).off().text("数据提交中...");
                $.post("../../Handler/UpdateAdminHandler.ashx", { LoginName: escape(LoginName), Password: Password, Email: Email, Name: escape(Name), Gender: Gender, Position: escape(Position), Mobile: Mobile,ID:<%=admin.ID%> }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("修改管理员成功!")
                        location.href = "Default.aspx";
                        return;
                    }
                    alert(json.Message);
                    $(e.target).off().text("提交").click(postFunc);
                });
            };
            $("#submitBtn").off().click(postFunc);
        });
    </script>
</body>
</html>
