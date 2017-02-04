<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Resum.aspx.cs" Inherits="EnterpriseManage_Hr_Resum" %>

<%@ Register Src="~/UserControls/ucPager.ascx" TagPrefix="uc" TagName="Pager" %>

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

        .bottom_list li {
            padding: 0.1rem 0;
        }

            .bottom_list li:first-child {
                padding: 0;
            }

            .bottom_list li > a:first-child {
                text-indent: 0.2rem;
            }

            .bottom_list li > div, .bottom_list li > a {
                width: 14%;
                font-weight: bold;
                vertical-align: middle;
                display: inline-block;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

                .bottom_list li > div:last-child {
                    width: 13%;
                }

                .bottom_list li > a.blue {
                    color: #0068b7;
                }

        .look {
            color: #a40000;
        }

        .dialog li.breadth {
            width: 5.2rem;
        }

            .dialog li.breadth > label {
                width: 4.1rem;
            }

        .btn {
            width: 1.08rem;
            height: 0.4rem;
            line-height: 0.4rem;
            border-radius: 0.03rem;
            display: inline-block;
            margin: 0.1rem 0.2rem;
        }

            .btn:last-child {
                background-color: #a0a0a0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    人才库
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="javascript:history.back(-1)">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom_list">
        <ul>
            <li>
                <a class="blue">应聘者姓名</a>
                <a class="blue">职位名称</a>
                <a class="blue">学历</a>
                <a class="blue">工作年限</a>
                <a class="blue">投递时间</a>
                <div>结果</div>
                <div>操作</div>
            </li>
            <asp:Repeater ID="rpList" runat="server">
                <ItemTemplate>
                    <li>
                        <div><%#Eval("Name") %></div>
                        <div><%#Eval("PositionName") %></div>
                        <div><%#Eval("Degree") %></div>
                        <div><%#Eval("WorkYears") %>年</div>
                        <div><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy/MM/dd") %></div>
                        <div class="look" id="State<%#Eval("ID") %>"><%#(StateTxt)Eval("State") %></div>
                        <div>
                            <a href="javascript:void(0)" class="edit" onclick="ShowDetail({ID:<%#Eval("ID") %>,Name:'<%#Eval("Name")%>',BirthDay:'<%#Convert.ToDateTime(Eval("BirthDay")).ToString("yyyy/MM/dd")%>',Mobile:'<%#Eval("Mobile")%>',WorkYears:'<%#Eval("WorkYears")%>年',Addr:'<%#Eval("Addr")%>',Introduce:'<%#Eval("Introduce")%>',Degree:'<%#Eval("Degree")%>',OfflinePath:'<%#Eval("OfflinePath")%>',PositionName:'<%#Eval("PositionName")%>',State:<%#Eval("State") %>})">查看</a>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            <uc:Pager ID="pager" runat="server" />
        </ul>
    </div>
    <div class="alert">
        <div class="dialog">
            <ul>
                <li class="tit">应聘者简历
						<a href="javascript:void(0)" onclick="$('.alert').hide();">X</a>
                </li>
                <li>
                    <span>姓名</span>
                    <label data-role="Name">李生</label>
                </li>
                <li>
                    <span>学历</span>
                    <label data-role="Degree">343417839@qq.com</label>
                </li>
                <li>
                    <span>应聘职位</span>
                    <label data-role="PositionName">销售经理</label>
                </li>
                <li>
                    <span>手机号码</span>
                    <label data-role="Mobile">13888888888</label>
                </li>
                <li>
                    <span>出生日期</span>
                    <label data-role="BirthDay">1992/06/25</label>
                </li>
                <li>
                    <span>附件简历</span>
                    <label><a href="javascript:void(0)" data-role="OfflinePath">下载</a></label>
                </li>
                <li class="breadth">
                    <span>工作年限</span>
                    <label data-role="WorkYears">2年</label>
                </li>
                <li class="breadth">
                    <span>居住地点</span>
                    <label data-role="Addr">北京市朝阳区分钟寺四道口</label>
                </li>
                <li class="breadth">
                    <span>自我介绍</span>
                    <label data-role="Introduce">
                        <p>1.诚实正直、稳重乐观、积极向上，有很好的上进心和自学能力；</p>
                        <p>2.对待工作有强烈的责任心，严谨认真、吃苦耐劳，具有很强的抗压能力；</p>
                        <p>3.具有很强的执行能力、沟通能力和团队精神，同时具备独立完成任务的能力；</p>
                        <p>4.逻辑思维能力强，对事物具有敏锐的观察力</p>
                    </label>
                </li>
                <li class="breadth" style="text-align: center;">
                    <a href="javascript:void(0)" class="btn" data-role="updateState" data-val="1">面试通过</a>
                    <a href="javascript:void(0)" class="btn" data-role="updateState" data-val="-1">面试失败</a>
                </li>
            </ul>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script type="text/javascript">
        $("a[data-menu='Hr']").addClass("active");
        function ShowDetail(data)
        {
            $(".alert").show();
            $(".alert data-role").text("");
            for (var i in data)
            {
                $("[data-role='" + i + "']").html(data[i]);
            }
            if ($.trim(data.OfflinePath).length > 0) {
                var path = $.trim(data.OfflinePath);
                $("[data-role='OfflinePath']").text("下载").prop("href", "<%=ConfigurationManager.AppSettings["FileUrl"]%>OfflineResum/" + path.substr(0, 4) + "/" + path.substr(4, 2) + "/" + path.substr(6, 2) + "/" + path);
            } else {
                $("[data-role='OfflinePath']").text("无离线简历").prop("href","javascript:");
            }
            if (data.State != 0) { $("[data-role='updateState'][data-val='" + data.State + "']").show().off().siblings("a").hide(); return;}
            $("[data-role='updateState']").show().off().click(function () {
                var State = $(this).attr("data-val");
                $.post("../../Handler/UpdateResumStateHandler.ashx", { ID: data.ID, State:State }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result)
                    {
                        $("#State" + data.ID).text(State == 1 ? "面试通过" : "面试失败");
                        data.State = State;
                        $(".alert").hide();
                        return;
                    }
                    alert(json.Message);
                });
            });
        }
    </script>
</asp:Content>

