<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Info.aspx.cs" Inherits="_Management_Finance_Info" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核申请融资企业</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        body {
            overflow-y: auto;
        }

        .btn_box {
            width: 100%;
            text-align: center;
        }

        .btn {
            padding: 0.15rem 0.5rem;
        }

        .alert_box div {
            width: 4.7rem;
        }

        .alert {
            top: 2rem;
        }

        .enter_info span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>融资信息</h2>
            <a href="javascript:history.back(-1)" class="add">返回</a>
        </div>
        <div class="enter_info">
            <ul>
                <li>
                    <span>融资阶段</span>
                    <div><%=fi.Stage %></div>
                </li>
                <li>
                    <span>联系电话</span>
                    <div><%=fi.Mobile %></div>
                </li>
                <li>
                    <span>融资规模</span>
                    <div><%=fi.Money %>万</div>
                </li>
                <li>
                    <span>让出股权</span>
                    <div><%=fi.Stock %></div>
                </li>
                <li>
                    <span>预期收益</span>
                    <div><%=fi.Profit %></div>
                </li>
                <li>
                    <span>发布时间</span>
                    <div><%=fi.PostTime %></div>
                </li>
                <li class="last">
                    <span>融资说明</span>
                    <div>
                        <%=fi.Detail %>
                    </div>
                </li>
                <li class="last">
                    <span>操作</span>
                    <div>
                        <%if (fi.State == 0)
                            { %>
                        <a href="javascript:void(0)" class="btn" data-val="1" data-id="<%=fi.ID %>" data-role="updatestate">通过</a>
                        <a href="javascript:void(0)" class="btn reject" data-val="-1" data-id="<%=fi.ID %>" data-role="updatestate">驳回</a>
                        <%}
                        else if (fi.State > 0)
                        { %>
                        <a href="javascript:void(0)" class="btn reject" data-val="-1" data-id="<%=fi.ID %>" data-role="updatestate">发布中，让信息下线</a>
                        <%}
                        else
                        { %>
                        <a href="javascript:void(0)" class="btn" data-val="1" data-id="<%=fi.ID %>" data-role="updatestate">信息下线中，让信息上线</a>
                        <%} %>
                    </div>
                </li>
            </ul>
        </div>
        <div class="enter_info">
            <ul>
                <li>
                    <span>融资企业</span>
                    <div><%=fi.CompanyName %></div>
                </li>
                <li class="last">
                    <span>公司介绍</span>
                    <div>
                        <%=fi.CompanyIntr %>
                    </div>
                </li>
                <li class="last">
                    <span>项目介绍</span>
                    <div>
                        <%=fi.ProjectIntr %>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[data-role='updatestate']").click(function () {
                var State = Number($(this).attr("data-val"));
                var ID = $(this).attr("data-id");
                if (!confirm("确定执行此操作吗?")) return;
                $.post("../../Handler/UpdateFinancingStateHandler.ashx", { State: State, ID: ID }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                });
            });
        });
    </script>
</body>
</html>
