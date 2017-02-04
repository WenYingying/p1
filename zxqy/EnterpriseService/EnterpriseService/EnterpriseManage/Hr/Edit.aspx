<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="EnterpriseManage_Hr_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .list .recruit_hide {
            display: block;
        }

        .head .end {
            width: 1.5rem;
        }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }

        .right .bottom li.bottom_table {
            width: 100%;
        }

            .right .bottom li.bottom_table > div {
                width: 80%;
                vertical-align: top;
                display: inline-block;
            }

                .right .bottom li.bottom_table > div > a {
                    width: 1.1rem;
                    height: 0.4rem;
                    line-height: 0.4rem;
                    text-align: center;
                    margin-bottom: 0.1rem;
                    border: 1px solid #dcdcdc;
                    background-color: #fff;
                    border-radius: 0.02rem;
                    display: inline-block;
                }

                    .right .bottom li.bottom_table > div > a.active {
                        border: 1px solid #f87730;
                        color: #f87730;
                        background-image: url(../../img/yes.png);
                        background-repeat: no-repeat;
                        background-position: center right;
                    }

            .right .bottom li.bottom_table > span {
                width: 14.5%;
                margin-right: 1%;
            }

        .content_center li.null::after {
            content: attr(title);
            color: red;
            opacity: 1;
        }

        .xhe_default {
            width: auto !important;
        }

        .right .bottom li > textarea {
            width: 60%;
            max-width: 70%;
            height: 2rem;
            max-height: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    发布招聘需求
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Default.aspx">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li title="请输入岗位">
                <span>职位名称</span>
                <input type="text" name="" id="PositionName" value="<%=hr.PositionName.Trim() %>" placeholder="请输入职位名称" />
                <b class="required">*</b>
            </li>
            <li>
                <span>最低学历</span>
                <select id="Degree">
                    <option value="不限">不限</option>
                    <option value="高中">高中</option>
                    <option value="大专">大专</option>
                    <option value="本科">本科</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
            </li>
            <li>
                <span>所属行业</span>
                <select id="Trade">
                    <option value="不限">不限</option>
                    <option value="计算机/互联网/通信/电子">计算机/互联网/通信/电子</option>
                    <option value="销售/客服/技术支持">销售/客服/技术支持</option>
                    <option value="会计/金融/银行/保险">会计/金融/银行/保险</option>
                    <option value="生产/营运/采购/物流">生产/营运/采购/物流</option>
                    <option value="生物/制药/医疗/护理">生物/制药/医疗/护理</option>
                    <option value="广告/市场/媒体/艺术">广告/市场/媒体/艺术</option>
                    <option value="建筑/房地产">建筑/房地产</option>
                    <option value="人事/行政/高级管理">人事/行政/高级管理</option>
                    <option value="咨询/法律/教育/科研">咨询/法律/教育/科研</option>
                    <option value="服务业">服务业</option>
                    <option value="公务员/翻译/其他">公务员/翻译/其他</option>
                </select>
            </li>
            <li title="请输入部门">
                <span>所属部门</span>
                <input type="text" name="" id="Depart" value="<%=hr.Depart.Trim() %>" placeholder="请输入所属部门" />
                <b class="required">*</b>
            </li>
            <li>
                <span>薪　　资</span>
                <select id="Salary">
                    <option value="面谈">面谈</option>
                    <option value="1000元以下">1000元以下</option>
                    <option value="1000元 - 2000元">1000元 - 2000元</option>
                    <option value="2000元 - 3000元">2000元 - 3000元</option>
                    <option value="3000元 - 5000元">3000元 - 5000元</option>
                    <option value="5000元 - 8000元">5000元 - 8000元</option>
                    <option value="8000元以上">8000元以上</option>
                </select>
            </li>
            <li>
                <span>专业要求</span>
                <input type="text" name="" id="Major" value="<%=hr.Major.Trim() %>" placeholder="请输入专业要求" />
            </li>
            <li class="bottom_table">
                <span>福利标签</span>
                <input type="hidden" id="Welfare" value="<%=hr.Welfare.Trim() %>" />
                <div id="divWelfare">
                    <a data-val="五险一金">五险一金</a>
                    <a data-val="免费班车">免费班车</a>
                    <a data-val="员工旅游">员工旅游</a>
                    <a data-val="餐饮补贴">餐饮补贴</a>
                    <a data-val="专业培训">专业培训</a>
                    <a data-val="出国机会">出国机会</a>
                    <a data-val="绩效奖金">绩效奖金</a>
                    <a data-val="年终奖金">年终奖金</a>
                    <a data-val="股票期权">股票期权</a>
                    <a data-val="弹性工作">弹性工作</a>
                    <a data-val="定期体检">定期体检</a>
                </div>
            </li>
            <li class="bottom_table" title="请输入详细的招聘信息">
                <span>职位描述</span>
                <textarea class="bottom_top" id="Detail"><%=hr.Detail.Trim() %></textarea>
                <b class="required">*</b>
            </li>
            <li class="bottom_table">
                <span></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">保存</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">返回</a>
            </li>
        </ul>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script src="../../js/jquery-1.9.1.min.js"></script>
    <script src="../../js/editor/xheditor-1.2.2.min.js"></script>
    <script src="../../js/editor/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Hr']").addClass("active");
            $("#Degree").val("<%=hr.Degree.Trim()%>");
            $("#Trade").val("<%=hr.Trade.Trim()%>");
            $("#Salary").val("<%=hr.Salary.Trim()%>");
            $("<%=hr.Welfare.Trim()%>".split(",")).each(function () {
                $("#divWelfare>a[data-val='" + this + "']").addClass("active");
            });

            $(".required").siblings("input[id!='xhe0_fixffcursor'],textarea").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            $("#divWelfare>a").click(function () {
                $(this).toggleClass("active");
                if ($(this).hasClass("active")) {
                    $("#Welfare").val($("#Welfare").val() + "," + $(this).text());
                    return;
                }
                $("#Welfare").val($("#Welfare").val().replace("," + $(this).text(), ""));
            });

            $("#Detail").xheditor({ tools: 'mini', forcePtag: false });

            var postFunc = function (e) {
                $(".required").not(":hidden").siblings("input,textarea").blur();
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }
                $(e.target).off().text("数据提交中...");
                var data = { "PositionName": escape($.trim($("#PositionName").val())), "Degree": escape($.trim($("#Degree").val())), "Trade": escape($.trim($("#Trade").val())), "Depart": escape($.trim($("#Depart").val())), "Salary": escape($.trim($("#Salary").val())), "Major": escape($.trim($("#Major").val())), "Welfare": escape($.trim($("#Welfare").val())), "Detail": escape($.trim($("#Detail").val())), "ID": "<%=hr.ID%>" };
                $.post("../../Handler/UpdateHrHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("招聘信息修改成功！");
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