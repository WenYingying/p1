<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Hr_Request" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>申请表</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .content {
            height: 83.5%;
            top: 1.1rem;
        }

        .content_center {
            margin-top: 0 !important;
        }

        .content > div {
            width: 7rem;
        }

        .content_center li {
            width: 7rem;
            margin-bottom: 0.2rem;
            height: auto;
        }


        .enter {
            font-size: 0.22rem;
            text-align: center;
        }

        .content_center li > span {
            width: 1.5rem;
            text-align: right;
            margin-right: 0.1rem;
            display: inline-block;
        }

        .content_center li > div {
            display: inline-block;
            width: 4.1rem;
        }

        .content_center li input, select {
            width: 4rem;
            height: 0.35rem;
            line-height: 0.35rem;
            text-indent: 0.1rem;
            background-color: #fff;
            border: 1px solid #dcdcdc;
            font-size: 0.12rem;
            display: inline-block;
            border-radius: 0.03rem;
        }

        select {
            font-size: 0.14rem;
        }

        .btn {
            width: 1.08rem;
            border-radius: 0.02rem;
            z-index: 11;
        }

        .content_center li a.btn > input {
            position: absolute;
            right: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 0.35rem;
            filter: alpha(opacity=0);
            cursor: pointer;
        }

        textarea {
            width: 4rem;
            height: 1.3rem;
            max-width: 5rem;
            max-height: 1.3rem;
            border: 1px solid #dcdcdc;
            outline: none;
            line-height: 0.2rem;
            font-size: 0.16rem;
            border-radius: 0.05rem;
            vertical-align: top;
        }

        .content_center li::after {
            content: "发布新闻";
            opacity: 0;
        }

        .content_center li.null::after {
            content: attr(title);
            color: red;
            opacity: 1;
        }
    </style>
</head>
<body>
    <header>
        <div class="head">
            <ul>
                <li class="tit">青海大学科技园企业服务平台</li>
                <li class="nav">
                    <a href="../Default.aspx">首页</a>
                    <a href="../Enterprise/Default.aspx">企业</a>
                    <a href="../Finance/Default.aspx">融资</a>
                    <a href="Default.aspx">招聘</a>
                    <a href="../Information/Default.aspx">信息服务</a>
                </li>
                <li>
                    <%if (object.Equals(null, Request.Cookies["User"]))
                        { %>
                    <a href="../request.html" class="apply">申请入驻</a>
                    <a href="../login.html" class="login">登陆</a>
                    <%}
                        else
                        { %>
                    <a href="javascript:void(0)" class="end"><%=Server.UrlDecode(Request.Cookies["User"]["Name"]) %>/退出</a>
                    <div class="hide">
                        <a href="../EnterpriseManage/Default.aspx">管理</a>
                        <a href="../Enterprise/EntHome.aspx?ID=<%=Request.Cookies["User"]["EnterpriseID"] %>">我的企业</a>
                        <a href="../login.html">退出</a>
                    </div>
                    <%} %>
                </li>
            </ul>
        </div>
    </header>
    <div class="breadcrumbs">
        <div>
            <a href="../Default.aspx">首页</a>
            <span class="sep">/</span>
            <a href="Default.aspx">招聘</a>
            <span class="sep">/</span>
            <a href="Detail.aspx?ID=<%=hr.ID %>">招聘详情</a>
            <span class="sep">/</span>
            <a>应聘申请表</a>
        </div>
    </div>
    <div class="content">
        <div class="content_center">
            <ul>
                <li class="enter">应聘申请表</li>
                <li>
                    <span>企业名称</span>
                    <div><%=hr.CompanyName %></div>
                </li>
                <li>
                    <span>应聘职位</span>
                    <div><%=hr.PositionName %></div>
                </li>
                <li title="请输入">
                    <span>应聘者姓名</span>
                    <div>
                        <input type="text" name="" id="Name" value="" placeholder="请填写您的真实姓名" />
                    </div>
                    <b class="required">*</b>
                </li>
                <li title="请选择">
                    <span>出生日期</span>
                    <div>
                        <input type="date" name="" id="BirthDay" value="" placeholder="请填写您的出生日期" />
                    </div>
                    <b class="required">*</b>
                </li>
                <li title="请输入">
                    <span>手机号码</span>
                    <div>
                        <input type="tel" name="" id="Mobile" value="" placeholder="请填写您的联系方式" />
                    </div>
                    <b class="required">*</b>
                </li>
                <li>
                    <span>工作年限</span>
                    <div>
                        <select id="WorkYears">
                            <option value="0">应届毕业生</option>
                            <option value="1">1年</option>
                            <option value="2">2年</option>
                            <option value="3">3年</option>
                            <option value="4">4年</option>
                            <option value="5">5年</option>
                            <option value="6">5年以上</option>
                        </select>
                    </div>
                </li>
                <li>
                    <span>学　　历</span>
                    <div>
                        <select id="Degree">
                            <option value="初中及以下">初中及以下</option>
                            <option value="高中">高中</option>
                            <option value="中专">中专</option>
                            <option value="大专">大专</option>
                            <option value="本科">本科</option>
                            <option value="研究生">研究生</option>
                            <option value="博士">博士</option>
                        </select>
                    </div>
                </li>
                <li>
                    <span>附件简历 </span>
                    <div>
                        <a href="javascript:void(0)" class="btn" style="display: inline-block;" onclick="$(this).siblings('input[type=file]').click();">上传</a>
                        <input type="hidden" id="OfflinePath" value="" />
                        <input type="file" name="" id="" accept="application/pdf,application/msword" style="display: none;" />
                        <label style="display: inline-block;"></label>
                    </div>
                </li>
                <li title="请输入">
                    <span>家庭住址</span>
                    <div>
                        <input type="text" name="" id="Addr" value="" placeholder="您的家庭住址" />
                    </div>
                </li>
                <li>
                    <span>自我介绍</span>
                    <div>
                        <textarea id="Introduce" placeholder="您的简单自我介绍，以便招聘人员更了解您"></textarea>
                    </div>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:" class="btn" id="submitBtn">确定提交</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/Common.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".required").siblings("div").find("input").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().parent().addClass("null");
                    return;
                }
                $(this).parent().parent().removeClass("null");
            });
            var postFunc = function (e) {
                console.log($.trim($("#Introduce").val()).replace(/\n/g,"<br />"));
                return;
                $(".required").not(":hidden").siblings("div").find("input").blur();
                var reg=/^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$/i;
                if(!reg.test($("#Mobile").val()))
                {
                    $("#Mobile").parent().parent().addClass("null");
                }
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }

                $(e.target).off().text("数据提交中...");
                var data = { Name: escape($.trim($("#Name").val())), Addr: escape($.trim($("#Addr").val())), BirthDay: $("#BirthDay").val(), Mobile: $("#Mobile").val(), WorkYears: $("#WorkYears").val(), Degree: escape($("#Degree").val()), OfflinePath: $("#OfflinePath").val(), Introduce: escape($.trim($("#Introduce").val()).replace(/\\n/,"<br />")),"HrId":<%=hr.ID%> };
                $.post("../../Handler/PostResumHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("简历投递成功，请耐心等待企业与您联系");
                        location.href = "Detail.aspx?ID=<%=hr.ID%>";
                        return;
                    }
                    $(e.target).off().click(postFunc).text("确定提交");
                    alert(json.Message);
                });
            };

            $("#submitBtn").off().click(postFunc);

            $("#OfflinePath").siblings("input[type='file']").change(function () {
                handleFiles("OfflineResum", this, $("#OfflinePath"), $(this).siblings("a.btn"), false);
            });

            function handleFiles(path, obj, hostObj, process, isImg, wi, hi) {
                var files = obj.files;
                var desobj = $(hostObj);
                desobj.val("");
                if (isImg) {
                    if (window.URL) {
                        //File API
                        $(process).siblings("img").prop("src", window.URL.createObjectURL(files[0]))
                    } else if (window.FileReader) {
                        //opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理
                        var reader = new FileReader();
                        reader.readAsDataURL(files[0]);
                        reader.onload = function (e) {
                            $(process).siblings("img").prop("src", this.result);
                        }
                    } else {
                        //ie
                        obj.select();
                        obj.blur();
                        var nfile = document.selection.createRange().text;
                        document.selection.empty();
                        $(process).siblings("img").prop("src", nfile);
                    }
                }

                var fd = new FormData();
                fd.append("file", obj.files[0]);
                fd.append("fileDir", path);
                fd.append("isImg", isImg);
                if (isImg) {
                    fd.append("Width", wi);
                    fd.append("Height", hi);
                }

                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        var json = $.parseJSON(xhr.responseText);
                        if (json.Result) {
                            if (!isImg) {
                                process.text("上传成功");
                                desobj.siblings("label").text(json.Src);
                            } else {
                                process.empty().hide();
                            }
                            desobj.val(json.Src);
                            desobj.parent().removeClass("null");
                            return;
                        }
                        console.log(json.Message);
                        //$(".ui-alert").fadeIn(1000).fadeOut(2000).text(xhr.responseText);
                    }
                    console.log(xhr.readyState);
                }

                //侦查当前附件上传情况
                xhr.upload.onprogress = function (evt) {
                    //侦查附件上传情况
                    //通过事件对象侦查
                    //该匿名函数表达式大概0.05-0.1秒执行一次
                    //console.log(evt);
                    //console.log(evt.loaded);  //已经上传大小情况
                    //evt.total; 附件总大小
                    process.show();
                    var loaded = evt.loaded;
                    var tot = evt.total;
                    var per = Math.floor(100 * loaded / tot);  //已经上传的百分比
                    process.text(per + "%");
                    //div.css("width", per + "%");
                    //p.html(per + "%");
                    //if (per == 100)
                    //    process.hide();
                    //console.log(per);
                    //var son = document.getElementById('son');
                    //son.innerHTML = per + "%";
                    //son.style.width = per + "%";

                }
                xhr.open("post", "../Handler/UploadFileHandler.ashx");
                xhr.send(fd);
            }
        });
    </script>
</body>
</html>
