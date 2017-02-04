<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Banner.aspx.cs" Inherits="_Management_Settings_Banner" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>列表</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .list li > div:first-child {
            width: 10%;
            text-indent: 0.2rem;
        }

        .list li > div:nth-child(2) {
            width: 20%;
        }

        .list li > div:nth-child(3) {
            width: 14%;
        }

        .list li > div:nth-child(4) {
            width: 13%;
        }

        .list li > div:nth-child(5) {
            width: 41%;
        }

        .banner_img {
            width: 1.36rem;
            height: 1rem;
            display: inline-block;
            background: url(../img/banner_img.png) no-repeat center;
            vertical-align: top;
            border: 1px solid #dcdcdc;
            position: relative;
            background-size: contain;
        }

            .banner_img > a {
                width: 1.36rem;
                height: 0.32rem;
                line-height: 0.32rem;
                color: #fff;
                font-size: 0.12rem;
                background-color: rgba(0,0,0,.6);
                position: absolute;
                bottom: 0;
                left: 0;
                text-align: center;
            }

        .button {
            display: inline-block;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>Banner管理</h2>
            <a href="javascript:void(0)" class="add">添加</a>
        </div>
        <div class="list">
            <ul>
                <li>
                    <div>序列</div>
                    <div>文件</div>
                    <div>创建时间</div>
                    <div>状态</div>
                    <div>操作</div>
                </li>
                <asp:Repeater ID="rpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <div><%#Eval("ID") %></div>
                            <div><%#Eval("FileName") %></div>
                            <div><%#Convert.ToDateTime(Eval("PostTime")).ToString("yyyy-MM-dd") %></div>
                            <div><%#(StateTxt)Eval("State") %></div>
                            <div>
                                <a href="javascript:void(0)" data-role="updateState" class="btns" data-val="<%# Convert.ToInt32(Eval("State"))==1?0:1 %>" data-id="<%#Eval("ID") %>"><%# Convert.ToInt32(Eval("State"))==1?"停用":"启用" %></a>
                                <a href="<%#string.Format("{0}BannerFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("FileName").ToString().Trim().Substring(0,4),Eval("FileName").ToString().Trim().Substring(4,2),Eval("FileName").ToString().Trim().Substring(6,2),Eval("FileName").ToString().Trim()) %>" class="btns" target="_blank">查看</a>
                                <a href="javascript:void(0)" class="btns edit" data-val="<%#string.Format("{0}BannerFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],Eval("FileName").ToString().Trim().Substring(0,4),Eval("FileName").ToString().Trim().Substring(4,2),Eval("FileName").ToString().Trim().Substring(6,2),Eval("FileName").ToString().Trim()) %>" data-id="<%#Eval("ID") %>">编辑</a>
                                <a href="javascript:void(0)" class="btns delete" data-id="<%#Eval("ID") %>">删除</a>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="alert">
        <div class="alert_head">
            <h2>添加</h2>
            <a href="javascript:void(0)" class="iconfont close">&#xe621;</a>
        </div>
        <div class="alert_box">
            <ul>
                <li>
                    <span>图片转接地址</span>
                    <input type="text" name="" id="FileName" value="" placeholder="文件名称" readonly="readonly" />
                </li>
                <li>
                    <span>上传图片</span>
                    <div class="banner_img">
                        <a href="javascript:void(0)" onclick="$('#file').click();">点击上传</a>
                        <input type="file" accept="image/*" style="display: none;" id="file" />
                    </div>
                    <div class="hint_box">
                        <a class="hint" style="display: inline-block;">!</a>
                        <p class="hint_cont" style="width: 2.5rem;">
                            上传格式支持：png、jpeg、JPG、PNG<br />
                            单张图片大小不能超过2M、最多上传1张<br />
                            分辨率不得小于1300X360px<br />
                            不支持多张上传<br />
                            <b></b>
                        </p>
                    </div>
                </li>
                <li>
                    <span></span>
                    <div class="button">
                        <a href="javascript:void(0)" class="btn" id="submitBtn">确认</a>
                        <a href="javascript:void(0)" class="btn" onclick="$('.close').click();">取消</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".hint_box>a").click(function () {
                $(this).siblings(".hint_cont").toggleClass("hint_show");
            });
            $(".add").click(function () {
                $(".alert").show();
                $(".alert_head>h2").text("上传首页Banner图");
                $("#FileName").val("");
                $("#file").parent().css("background-image", "")
                $("#submitBtn").off().click(postFunc);
            });
            $(".edit").click(function () {
                $(".alert").show();
                $(".alert_head>h2").text("编辑首页Banner图");
                var src = $(this).attr("data-val"), id = $(this).attr("data-id");
                $("#FileName").val(src.substr(src.lastIndexOf("/") + 1, src.length - src.lastIndexOf("/")));
                $("#file").parent().css("background-image","url("+src+")")
                $("#submitBtn").attr("data-id", id).off().click(editFunc);
            });
            $(".close").click(function () {
                $(".alert").hide();
            });
            $(".delete").click(function () {
                if (!confirm("确定删除此信息吗?")) return;
                var ID = $(this).attr("data-id");
                $(this).parents("div").parents("li").remove();
                $.post("../../Handler/DeleteBannerHandler.ashx", { ID: ID }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        return;
                    }
                    alert(json.Message);
                });
            });
            $("[data-role='updateState']").click(function () {
                var State = $(this).attr("data-val"),ID=$(this).attr("data-id");
                $(this).text(State == 1 ? "停用" : "启用").attr("data-val",State==1?0:1);
                $(this).parent().prev("div").text(State == 1 ? "使用中" : "已停用");
                $.post("../../Handler/UpdateBannerStateHandler.ashx", { State: State, ID: ID }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        return;
                    }
                    alert(json.Message);
                });

            });

            $("#file").change(function () {
                handleFiles("BannerFiles", this, $("#FileName"), $(this).siblings("a"), true, 1300, 360);
            });

            var postFunc = function (e) {
                var FileName = $.trim($("#FileName").val());
                if (FileName.length == 0) {
                    alert("请上传图片");
                    return;
                }
                $(e.target).off().text("处理中...");
                $.post("../../Handler/PostBannerHandler.ashx", { FileName: FileName }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("上传成功！");
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                    $(e.target).on("click", postFunc).text("确认");
                });
            }
            var editFunc = function (e) {
                var FileName = $.trim($("#FileName").val());
                var ID = $(e.target).attr("data-id");
                if (FileName.length == 0) {
                    alert("请上传图片");
                    return;
                }
                $(e.target).off().text("处理中...");
                $.post("../../Handler/UpdateBannerHandler.ashx", { FileName: FileName,ID:ID }, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("上传成功！");
                        location.reload();
                        return;
                    }
                    alert(json.Message);
                    $(e.target).on("click", editFunc).text("确认");
                });
            }


            function handleFiles(path, obj, hostObj, process, isImg, wi, hi) {
                var files = obj.files;
                var desobj = $(hostObj);
                desobj.val("");
                if (isImg) {
                    if (window.URL) {
                        //File API
                        $(process).parent("div").css("background-image", "url(" + window.URL.createObjectURL(files[0]) + ")");
                    } else if (window.FileReader) {
                        //opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理
                        var reader = new FileReader();
                        reader.readAsDataURL(files[0]);
                        reader.onload = function (e) {
                            $(process).parent("div").css("background-image", "url(" + this.result + ")");
                        }
                    } else {
                        //ie
                        obj.select();
                        obj.blur();
                        var nfile = document.selection.createRange().text;
                        document.selection.empty();
                        $(process).parent("div").css("background-image", "url(" + nfile + ")");
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
                xhr.open("post", "../../Handler/UploadFileHandler.ashx");
                xhr.send(fd);
            }
        });
		</script>
</body>
</html>
