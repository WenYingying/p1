<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="RequestState.aspx.cs" Inherits="EnterpriseManage_EnterpriseInfo_RequestState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">入园申请状态</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .content_center > .right .bottom {
            width: 9.1rem;
            height: 3.94rem;
            background-color: #f5f5f5;
        }


        .btn {
            width: 3.5rem;
            margin: 0 auto;
            font-size: 0.16rem;
            border-radius: 0.03rem;
        }

        .no_btn {
            background-color: #eb6100;
        }

        .text {
            width: 100%;
            color: #556fb5;
            text-align: center;
            margin-top: 0.1rem;
            display: block;
            font-size: 0.14rem;
        }

        .right .bottom .progress {
            width: 7.2rem;
            margin: 1rem auto;
            font-size: 0;
        }

            .right .bottom .progress li {
                margin: 0;
            }

            .right .bottom .progress .node {
                width: 0.2rem;
                display: inline-block;
                height: 0.2rem;
                background-image: url(../../img/gray_circle.png);
            }

            .right .bottom .progress .activenode {
                background-image: url(../../img/red_circle.png);
            }

            .right .bottom .progress .successnode {
                background-image: url(../../img/tick.png);
            }

            .right .bottom .progress .failnode {
                background-image: url(../../img/fail.png);
            }


            .right .bottom .progress .line {
                width: 1.6rem;
                height: 0.2rem;
            }

                .right .bottom .progress .line > div {
                    width: 100%;
                    height: 0.01rem;
                    background-color: #c0c0c0;
                    margin: 0.09rem 0;
                }

                    .right .bottom .progress .line > div.active {
                        background-color: #a40000;
                    }

                    .right .bottom .progress .line > div.fail {
                        background-color: #eb6100;
                    }

            .right .bottom .progress .state {
                font-weight: 600;
                color: #000;
                width: 1.8rem;
                height: auto;
                text-align: center;
                font-size: 0.14rem;
                line-height: 0.5rem;
            }

            .right .bottom .progress .active {
                color: #a40000;
            }

            .right .bottom .progress .fail {
                color: #eb6100;
            }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">申请状态</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <div class="progress">
            <ul>
                <li class="line" style="width: 0.8rem;">
                    <div class="<%=ent.State == 0 || ent.State == 1 ? "active" : ent.State == -1 ? "fail" : "active" %>"></div>
                </li>
                <li class="node <%=ent.State > 0 ? "successnode" : ent.State == 0 ? "activenode" : ent.State == -1 ? "failnode" : "successnode" %>"></li>
                <li class="line">
                    <div class="<%=ent.State > 0 ? "active" : ent.State == -2 ? "fail" : ent.State < -1 ? "active" : string.Empty %>"></div>
                </li>
                <li class="node <%=ent.State > 1 ? "successnode" : ent.State == 1 ? "activenode" : ent.State == -2 ? "failnode" : Math.Abs((int)ent.State) > 1 ? "successnode" : string.Empty %>"></li>
                <li class="line">
                    <div class="<%=ent.State > 1 ? "active" : ent.State == -3 ? "fail" : ent.State < -2 ? "active" : string.Empty %>"></div>
                </li>
                <li class="node <%=ent.State > 2 ? "successnode" : ent.State == 2 ? "activenode" : ent.State == -3 ? "failnode" : Math.Abs((int)ent.State) > 2 ? "successnode" : string.Empty %>"></li>
                <li class="line">
                    <div class="<%=ent.State >= 3 ? "active" : string.Empty %>"></div>
                </li>
                <li class="node <%=ent.State >= 3 ? "successnode" : string.Empty %>"></li>
                <li class="line" style="width: 0.8rem;">
                    <div class="<%=ent.State >= 3 ? "active" : string.Empty %>"></div>
                </li>
            </ul>
            <ul>
                <li class="state <%=ent.State == 0 || ent.State == 1 ? "active" : ent.State == -1 ? "fail" : "active" %>">1<%=ent.State == 0 ? "审核中" : ent.State == 1 ? "审核通过" : ent.State == -1 ? "审核失败" : "审核通过" %></li>
                <li class="state <%=ent.State >= 1 ? "active" : ent.State == -2 ? "fail" : Math.Abs((int)ent.State) > 1 ? "active" : string.Empty %>">2<%=ent.State == 1 ? "等待签订协议" : ent.State == 2 ? "签订协议成功" : ent.State == -2 ? "签订协议失败" : Math.Abs((int)ent.State) > 2 ? "签订协议成功" : "等待签订协议" %></li>
                <li class="state <%=ent.State >= 2 ? "active" : ent.State == -3 ? "fail" : Math.Abs((int)ent.State) > 2 ? "active" : string.Empty %>">3<%=ent.State == 2 ? "审核营业执照" : ent.State == 3 ? "营业执照审核通过" : ent.State == -3 ? "营业执照审核失败" : Math.Abs((int)ent.State) > 3 ? "营业执照审核通过" : "审核营业执照" %></li>
                <li class="state <%=ent.State >= 3 ? "active" : string.Empty %>">4入驻成功</li>
            </ul>
            <ul>
                <li style="width: 100%; margin-top: 0.5rem;">
                    <%if (ent.State == 0)
                        {
                    %>
                    <a href="javascript:void(0)" class="btn">您当前正在评审中，评审时间为1-2天工作日</a>
                    <%} %>
                    <%if (ent.State == 1)
                        {
                    %>
                    <a href="javascript:void(0)" class="btn">您的申请已经通过，请尽快联系园区签订协议</a>
                    <%} %>
                    <%if (ent.State == 2)
                        {
                    %>
                    <a href="javascript:void(0)" class="btn">协议签订成功，请变更工商手续上传新营业执照</a>
                    <a href="Edit.aspx?State=2" class="text">点击上传营业执照>></a>
                    <%} %>
                    <%if (ent.State > 2)
                        {
                    %>
                    <a href="../../login.html" class="btn">成功入驻青海大学国家大学科技园区,重新登录后生效</a>
                    <%} %>
                    <%if (ent.State == -1)
                        { %>
                    <a href="javascript:void(0)" class="btn no_btn" title="<%=ent.Remark %>">您当前审核未通过</a>
                    <a href="Edit.aspx?State=0" class="text">点击修改入驻信息>></a>
                    <%} %>
                    <%if (ent.State == -2)
                        { %>
                    <a href="javascript:void(0)" class="btn no_btn" title="<%=ent.Remark %>">签订入园协议失败，请与园区协商</a>
                    <a href="javascript:void(0)" class="text" data-role="updatestate">经过协商，重新商谈协议>></a>
                    <%} %>
                    <%if (ent.State == -3)
                        { %>
                    <a href="javascript:void(0)" class="btn no_btn" title="<%=ent.Remark %>">您的营业执照审核未通过</a>
                    <a href="Edit.aspx?State=2" class="text">点击重新上传营业执照>></a>
                    <%} %>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='Ent']").addClass("active");
            $("[data-role='updatestate']").click(function(){
                $.post("../../Handler/UpdateEnterpriseStateHandler.ashx",{"ID":<%=ent.ID%>,"State":1},function(res){
                    var json=JSON.parse(res);
                    if(json.Result)
                    {
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                });
            });

        });
    </script>
</asp:Content>

