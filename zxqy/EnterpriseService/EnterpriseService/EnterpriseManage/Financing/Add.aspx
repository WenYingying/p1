<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="EnterpriseManage_Financing_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .head .end {
            width: 1.5rem;
        }

        .right .bottom li > textarea {
            width: 46%;
            max-width: 46%;
        }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }

        .xhe_default {
            width: auto !important;
        }

        .content_center .right li::after {
            content: "青海大学国家大学科技园企业服务平台";
            margin-left: 1.45rem;
            opacity: 0;
        }

        .content_center li.null::after {
            content: attr(title);
            color: red;
            opacity: 1;
        }
        .content_center li.detail:after{
            margin-left:0;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    融资管理
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="javascript:history.back(-1);">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li>
                <span>融资阶段</span>
                <select id="Stage">
                    <option value="A轮">A轮</option>
                    <option value="B轮">B轮</option>
                    <option value="C轮">C轮</option>
                    <option value="D轮">D轮</option>
                    <option value="D轮以上">D轮以上</option>
                </select>
            </li>
            <li title="请输入联系电话">
                <span>联系电话</span>
                <input type="tel" name="" id="Mobile" value="" placeholder="请输入电话" />
                <b class="required">*</b>
            </li>
            <li title="请输入融资金额，输入数字即可">
                <span>融资规模</span>
                <input type="tel" name="" id="Money" value="" placeholder="请输入融资金额" />万元
                <b class="required">*</b>
            </li>
            <li title="请输入出让的股权百分比">
                <span>出让股权</span>
                <input type="tel" name="" id="Stock" value="" placeholder="请输入股权百分比，范围1-100" />%
			    <b class="required">*</b>
            </li>
            <li>
                <span>预期回报</span>
                <select id="Profit">
                    <option value="500万元及以下">500万元及以下</option>
                    <option value="500万元以上">500万元以上</option>
                    <option value="1000万元及以下">1000万元及以下</option>
                    <option value="5000万元及以下">5000万元及以下</option>
                    <option value="5000万元以上">5000万元以上</option>
                </select>
                <b class="required">*</b>
            </li>
            <li style="width: 100%;" title="请输入融资的用途等" class="detail">
                <span style="width: 14.5%; margin-right: 1%;">融资说明</span>
                <textarea id="Detail"></textarea>
                <b class="required">*</b>
            </li>
            <li style="width: 100%;">
                <span style="width: 14.5%; margin-right: 1%;"></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">返回</a>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script src="../../js/editor/xheditor-1.2.2.min.js"></script>
    <script src="../../js/editor/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Finance']").addClass("active");
            $("#Detail").xheditor({ tools: 'mini', forcePtag: false });
            $(".required").siblings("input[id!='xhe0_fixffcursor'],textarea").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            var postFunc = function (e) {
                $(".required").not(":hidden").siblings("input,textarea").blur();
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }
                $(e.target).off().text("数据提交中...");

                var data = { "EnterpriseId": "<%=((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId%>", "UserId": "<%=((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.ID%>", "Stage": escape($.trim($("#Stage").val())), "Mobile": escape($.trim($("#Mobile").val())), "Money": escape($.trim($("#Money").val())), "Stock": escape($.trim($("#Stock").val()) + "%"), "Profit": escape($.trim($("#Profit").val())), "Detail": escape($.trim($("#Detail").val())), "State": 0 };
                $.post("../../Handler/PostFinancingHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("融资申请发布成功！");
                        location.href = "Default.aspx";
                        return;
                    }
                    $(e.target).off().click(postFunc).text("保存");
                    alert(json.Message);
                });
                console.log(data);
            }

            $("#submitBtn").off().click(postFunc);
        });
    </script>
</asp:Content>

