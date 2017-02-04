<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="EnterpriseManage_User_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style>
        .head .end {
            width: 1.5rem;
        }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }

        .right .bottom li {
            vertical-align: middle;
        }

            .right .bottom li.bottom_table {
                width: 100%;
            }

                .right .bottom li.bottom_table > span {
                    width: 14.5%;
                    margin-right: 1%;
                }

                .right .bottom li > input[type="radio"], .right .bottom li.bottom_table input[type="checkbox"] {
                    width: 0.15rem;
                    height: 0.15rem;
                    margin-right: 0.1rem;
                    vertical-align: middle;
                    display: inline-block;
                }

                    .right .bottom li > input[type="radio"]:last-child {
                        margin-left: 0.3rem;
                    }

        .right .bottom .bottom_table > div.bottom_tr {
            width: 7.4rem;
            display: inline-block;
            vertical-align: top;
        }

        .right .bottom .bottom_table div.bottom_tr li {
            width: 3.55rem;
            background-color: #fff;
            line-height: 0.4rem;
            margin-top: 0;
            margin-right: 0.1rem;
            border-radius: 0.02rem;
            text-indent: 0.1rem;
            vertical-align: top;
        }

        .right .bottom .bottom_table div.bottom_td > ul > li {
            display: block;
            line-height: 0.2rem;
            text-indent: 0.3rem;
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

        li#Permission.null::after {
            content: attr(title);
            margin-left:15.5%;
            color: red;
            opacity: 1;
        }

        .content_center .right li .bottom_tr li:after{
            content:'';
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    用户管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="javascript:history.back(-1)">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li title="必填">
                <span>手机号码</span>
                <input type="text" name="" id="Mobile" value="" placeholder="请输入登录账号" />
                <b class="required">*</b>
            </li>
            <li title="必填">
                <span>真实姓名</span>
                <input type="text" name="" id="Name" value="" placeholder="请输入真实姓名" />
                <b class="required">*</b>
            </li>
            <li title="必填">
                <span>密　　码</span>
                <input type="password" name="" id="Password" value="" placeholder="请输入密码" />
                <b class="required">*</b>
            </li>
            <li title="不一致">
                <span>确认密码</span>
                <input type="password" name="" id="cmPassword" value="" placeholder="再次输入密码" />
                <b class="required">*</b>
            </li>
            <li title="必填">
                <span>公司职位</span>
                <input type="text" name="" id="Post" value="" placeholder="请输入公司职位" />
                <b class="required">*</b>
            </li>
            <li class="bottom_table" title="请选择权限" id="Permission">
                <span>用户权限</span>
                <div class="bottom_tr">
                    <ul>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="EnterpriseInfo" id="" value="EnterpriseInfo/Edit.aspx" />企业管理信息管理 
                            </div>
                        </li>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="Conference" id="" value="Conference/Add.aspx" />会议室管理
                            </div>
                        </li>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="Financing" id="" value="Financing" data-role="parentPermission" />融资管理
                            </div>
                            <div class="bottom_td">
                                <ul>
                                    <li>
                                        <input type="checkbox" name="Financing" id="" value="Financing/Add.aspx" />增加融资
                                    </li>
                                    <li>
                                        <input type="checkbox" name="Financing" id="" value="Financing/Edit.aspx" />修改融资
                                    </li>
                                    <li>
                                        <input type="checkbox" name="Financing" id="" value="Financing/Delete" />删除融资
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="" id="News" value="News" data-role="parentPermission" />新闻管理
                            </div>
                            <div class="bottom_td">
                                <ul>
                                    <li>
                                        <input type="checkbox" name="News" id="" value="News/Add.aspx" />增加新闻
                                    </li>
                                    <li>
                                        <input type="checkbox" name="News" id="" value="News/Edit.aspx" />修改新闻
                                    </li>
                                    <li>
                                        <input type="checkbox" name="News" id="" value="News/Delete" />删除新闻
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="Hr" id="" value="Hr" data-role="parentPermission" />招聘管理
                            </div>
                            <div class="bottom_td">
                                <ul>
                                    <li>
                                        <input type="checkbox" name="Hr" id="" value="Hr/Add.aspx" />新增职位
                                    </li>
                                    <li>
                                        <input type="checkbox" name="Hr" id="" value="Hr/Edit.aspx" />修改职位
                                    </li>
                                    <li>
                                        <input type="checkbox" name="Hr" id="" value="Hr/Delete" />删除职位
                                    </li>
                                    <li>
                                        <input type="checkbox" name="Hr" id="" value="Hr/Resum.aspx" />人才库
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="bottom_box">
                                <input type="checkbox" name="User" id="" value="User" data-role="parentPermission" />用户管理
                            </div>
                            <div class="bottom_td">
                                <ul>
                                    <li>
                                        <input type="checkbox" name="User" id="" value="User/Add.aspx" />新增用户
                                    </li>
                                    <li>
                                        <input type="checkbox" name="User" id="" value="User/Edit.aspx" />修改用户
                                    </li>
                                    <li>
                                        <input type="checkbox" name="User" id="" value="User/Delete" />删除用户
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <b class="required">*</b>
            </li>
            <li class="bottom_table">
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
            $("a[data-menu='User']").addClass("active");
            $("input[type='checkbox']").prop("checked", true);

            $("input[type='checkbox'][data-role='parentPermission']").click(function () {
                $(this).parent().siblings("div").find("input[type='checkbox']").prop("checked", $(this).prop("checked"));
            });

            $(".required").siblings("input[type!='checkbox']").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            var postFunc = function (e) {

                $(".required").not(":hidden").siblings("input").blur();
                if ($.trim($("#Password").val()) != $.trim($("#cmPassword").val()))
                {
                    $("#cmPassword").parent().addClass("null");
                }
                if ($("input[type='checkbox']:checked").length == 0)
                {
                    $("#Permission").addClass("null");
                } else {
                    $("#Permission").removeClass("null");
                }

                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }

                var Permission = {};
                if ($("input[type='checkbox']:not(:checked):not([data-role])").length == 0) {
                    Permission = "all";
                } else {
                    $("input[type='checkbox']:checked:not([data-role])").each(function () {
                        if (Permission[$(this).prop("name")]) {
                            var arr = Permission[$(this).prop("name")];
                            if (arr.indexOf($(this).val()) > -1) {
                                return;
                            }
                            arr.push($(this).val());
                            return;
                        }
                        Permission[$(this).prop("name")] = [];
                        Permission[$(this).prop("name")].push($(this).val());
                    });
                    Permission = JSON.stringify(Permission);
                }

                $(e.target).off().text("数据提交中...");
                var data = { Mobile: $.trim($("#Mobile").val()), Password: $.trim($("#Password").val()), Name: escape($.trim($("#Name").val())), Permission: Permission, Post: escape($.trim($("#Post").val())), "EnterpriseId": "<%=((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId%>" };
                $.post("../../Handler/PostEntUserHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("增加用户成功！");
                        location.href = "Default.aspx";
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

