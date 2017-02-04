<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="_Management_Information_Edit" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>添加文章</title>
    <meta id="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style type="text/css">
        .enter_info li {
            width: 100%;
        }

            .enter_info li > span {
                width: 11%;
            }

        .banner_img {
            width: 1.36rem !important;
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

        .enter_info li > div {
            overflow: initial;
        }
    </style>
</head>
<body>
    <div class="iframe_right">
        <div class="title">
            <h2>修改<%=Common.GetInstance.GetInfoType(info.Type.Trim()) %></h2>
        </div>
        <div class="enter_info">
            <ul>
                <li>
                    <span>标题</span>
                    <input type="text" name="" id="Title" value="<%=info.Title.Trim() %>" placeholder="请输入信息标题" />
                </li>
                <li>
                    <span>封面</span>
                    <div class="banner_img" style="background-image:url(<%=!string.IsNullOrEmpty(info.CoverPic)?string.Format("{0}InformationPic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],info.CoverPic.Substring(0,4),info.CoverPic.Substring(4,2),info.CoverPic.Substring(6,2),info.CoverPic):string.Format("{0}InformationPic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>)">
                        <a href="javascript:void(0)" onclick="$('#file').click();">点击上传</a>
                        <input type="file" accept="image/*" style="display: none;" id="file" />
                        <input type="hidden" name="" id="CoverPic" value="<%=info.CoverPic.Trim() %>" />
                    </div>
                    <div class="hint_box">
                        <a class="hint" style="display: inline-block;">!</a>
                        <p class="hint_cont" style="width: 2.5rem;">
                            尺寸不可小于520X390px<br>
                            选择照片 支持jpg、jpeg、png、bmpf格式，照片小与1M<br>
                            <b></b>
                        </p>
                    </div>
                </li>
                <li>
                    <span>内容</span>
                    <textarea name="" rows="" cols="" id="Content"><%=info.Content.Trim() %></textarea>
                </li>
                <li>
                    <span></span>
                    <div>
                        <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
                        <a href="javascript:history.back(-1)" class="btn">返回</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script src="../js/editor/xheditor-1.2.2.min.js"></script>
    <script src="../js/editor/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".hint_box>a").click(function () {
                $(this).siblings(".hint_cont").toggleClass("hint_show");
            });
            $("#Content").xheditor({ "upImgUrl": "../../Handler/UploadEditorFileHandler.ashx", html5Upload: false });
            var postFunc = function (e) {
                if ($.trim($("#Title").val()).length == 0 || $.trim($("#Content").val()).length == 0) {
                    alert("标题和内容不能为空");
                    return;
                }
                $(e.target).off().text("数据提交中...");
                var data = { "Title": escape($.trim($("#Title").val())), "Tags": escape($.trim($("#Tags").val())), "Content": escape($.trim($("#Content").val())), "CoverPic": escape($.trim($("#CoverPic").val())), "ID": "<%=info.ID%>","State":<%=info.State%> };
                $.post("../../Handler/UpdateInformationHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("修改成功！");
                        location.href = "Default.aspx?Type=<%=info.Type%>";
                        return;
                    }
                    $(e.target).off().click(postFunc).text("提交");
                    alert(json.Message);
                });
            };
            $("#submitBtn").off().click(postFunc);
            $("#file").change(function () {
                handleFiles("InformationPic", this, $("#CoverPic"), $(this).siblings("a"), true, 530, 400);
            });
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