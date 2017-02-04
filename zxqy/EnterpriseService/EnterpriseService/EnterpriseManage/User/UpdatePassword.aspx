<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="EnterpriseManage_User_UpdatePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .list .account_hide {
            display: block;
        }

        .right .bottom li.breadth {
            width: 100%;
        }

            .right .bottom li.breadth > span {
                width: 14.5%;
                margin-right: 1%;
            }

            .right .bottom li.breadth > label {
                width: 80%;
            }

        .right .bottom li > input {
            width: 30%;
        }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }
           .content_center .right li::after {
            content: "发布新闻";
            opacity: 0;
        }

        .content_center li.null::after {
            content: attr(title);
            color: red;
            opacity: 1;
        }
 </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    修改密码
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="javascript:history.back(-1)">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li class="breadth">
                <span>登录账户</span>
                <label><%=user.Mobile %></label>
            </li>
            <li class="breadth" title="请输入旧密码">
                <span>旧密码</span>
                <input type="password" name="" id="OldPassword" value="" placeholder="请输入密码" />
                <b class="required">*</b>
            </li>
            <li class="breadth" title="密码长度为6-16位字符">
                <span>新密码</span>
                <input type="password" name="" id="Password" value="" placeholder="请输入密码" />
                <b class="required">*</b>
            </li>
            <li class="breadth" title="两次密码输入不一致">
                <span>再次确认</span>
                <input type="password" name="" id="cmPassword" value="" placeholder="请再次输入密码" />
                <b class="required">*</b>
            </li>
            <li class="breadth">
                <span></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">返回</a>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
<script type="text/javascript">
        $(function () {
            $("a[data-menu='Set']").addClass("active");

            $(".required").siblings("input[type!='checkbox']").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            var postFunc = function (e) {

                $(".required").not(":hidden").siblings("input").blur();
                if ($.trim($("#Password").val()).length > 16 || $.trim($("#Password").val()).length < 6)
                {
                    $("#Password").parent().addClass("null");
                }

                if ($.trim($("#Password").val()) != $.trim($("#cmPassword").val()))
                {
                    $("#cmPassword").parent().addClass("null");
                }
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }

                $(e.target).off().text("数据提交中...");
                var data = { OldPassword: $.trim($("#OldPassword").val()), Password: $.trim($("#Password").val()), "ID": "<%=user.ID%>" };
                $.post("../../Handler/UpdateEntUserPasswordHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("密码修改成功！");
                        $(e.target).off().click(postFunc).text("保存");
                        return;
                    }
                    $(e.target).off().click(postFunc).text("保存");
                    alert(json.Message);
                });
            };

            $("#submitBtn").off().click(postFunc);
        });
    </script>
</asp:Content>

