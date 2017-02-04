<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="EnterpriseManage_News_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phPageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phStyle" runat="Server">
    <style type="text/css">
        .head .end {
            width: 1.5rem;
        }

        .right .bottom li > textarea {
            width: 60%;
            max-width: 70%;
            height: 3rem;
            max-height: none;
        }

        .btn {
            display: inline-block;
            width: 10%;
            font-size: 0.14rem;
            border-radius: 0.02rem;
        }

        .right .bottom li {
            width: 100%;
        }

            .right .bottom li > span {
                width: 14%;
            }

            .right .bottom li > label.li_label {
                position: relative;
                min-width: 0.3rem;
                width: auto;
                max-width: 1rem;
                height: 0.35rem;
                text-align: center;
                background-color: #fff;
                line-height: 0.35rem;
                border: 1px solid #dcdcdc;
                margin-right: 0.05rem;
                border-radius: 0.02rem;
                padding: 0 0.1rem;
            }

                .right .bottom li > label.li_label > span {
                    display: flex;
                    width: 100%;
                    height: 100%;
                    overflow: hidden;
                }

        .upload_img {
            width: 0.34rem;
            height: 0.34rem;
            display: inline-block;
            border: 1px solid #d4d4d4;
            vertical-align: middle;
            overflow: hidden;
        }

            .upload_img > img {
                width: 100%;
                height: 100%;
                display: block;
            }

        .remove {
            position: absolute;
            top: -0.1rem;
            right: -0.04rem;
            width: 0.2rem;
            height: 0.2rem;
            line-height: 0.2rem;
            text-align: center;
            border-radius: 50%;
            background-color: #000000;
            color: #fff;
        }

        .bottom li a.tit {
            background-color: #006c9b;
        }

        .bottom li .tip {
            width: 1.87rem;
            background-color: #f1f8fc;
            padding: 0.08rem;
            position: absolute;
            top: 0rem;
            left: 3.2rem;
            color: #333;
            z-index: -1;
        }

            .bottom li .tip > b {
                width: 0.12rem;
                left: -0.13rem;
                top: 0.2rem;
                background-image: url(../../img/tit_hide.jpg);
                background-repeat: no-repeat;
                transform: rotate(90deg);
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

        .xhe_default {
            width: auto !important;
        }

        .tipshow {
            z-index: 0 !important;
        }

        label > a.process {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #000;
            display: block;
            color: #fff;
            opacity: 0.8;
            text-align: center;
            line-height: 0.6rem;
            display: none;
        }

        .right .bottom li > label > img {
            width: 0.6rem;
            height: 0.6rem;
            border: 1px solid #d4d4d4;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phContentTitle" runat="Server">
    修改新闻
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="phTools" runat="Server">
    <a href="Default.aspx">返回</a>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="phPageContent" runat="Server">
    <div class="bottom">
        <ul>
            <li title="请输入新闻标题">
                <span>新闻标题</span>
                <input type="text" name="" id="Title" value="<%=info.Title.Trim() %>" />
                <b class="required">*</b>
            </li>
            <li style="overflow: visible;">
                <span>标签</span>
                <input type="hidden" id="Tags" value="<%=info.Tags.Trim() %>" />
                <input type="text" style="width: 1rem; display: none;" placeholder="自定义标签" />
                <a href="javascript:void(0)" class="upload_img">
                    <img src="../../img/no-logo.jpg" />
                </a>
                <a href="javascript:void(0)" class="upload_img" style="line-height: 0.34rem; text-align: center; background-color: #0094ff; color: #fff; display: none;">确定
                </a>
                <a href="javascript:void(0)" class="upload_img" style="line-height: 0.34rem; text-align: center; display: none;">取消
                </a>
            </li>
            <li style="overflow: visible; position: relative;">
                <span>上传图片</span>
                <label style="position: relative; width: auto; <%=info.CoverPic.Trim().Length>0?"": " display:none;"%>">
                    <a class="process"></a>
                    <img src="<%=!string.IsNullOrEmpty(info.CoverPic)?string.Format("{0}InformationPic/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],info.CoverPic.Substring(0,4),info.CoverPic.Substring(4,2),info.CoverPic.Substring(6,2),info.CoverPic):string.Format("{0}InformationPic/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoPic.png") %>" />
                </label>
                <a href="javascript:void(0)" class="upload_img" style="width: 0.6rem; height: 0.6rem;" onclick="$(this).siblings('input[type=file]').click();">
                    <img src="../../img/no-logo.jpg" />
                </a>
                <input type="file" style="display: none;" accept="image/*" />
                <input type="hidden" id="CoverPic" value="<%=info.CoverPic.Trim() %>" />
                <a class="tit">!</a>
                <p class=" tip">
                    选择照片 支持jpg、jpeg、png、bmpf格式，照片小于1M（尺寸不可小于530PX*400PX），只支持上传一张图片
                    <b></b>
                </p>
            </li>
            <li title="请输入新闻内容">
                <span>内容</span>
                <textarea id="Content"><%=info.Content.Trim() %></textarea>
                <b class="required">*</b>
            </li>
            <li>
                <span></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">提交</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">返回</a> </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="phScript" runat="Server">
    <script src="../../js/jquery-1.9.1.min.js"></script>
    <script src="../../js/editor/xheditor-1.2.2.min.js"></script>
    <script src="../../js/editor/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a[data-menu='News']").addClass("active");
            $("a.tit").click(function () {
                $(this).siblings(".tip").toggleClass("tipshow");
            });
            $($("#Tags").val().split(",")).each(function () {
                if (this.length > 0) {
                    var tag = this;
                    $("#Tags").before("<label class='li_label'>");
                    var label = $("#Tags").prev("label");
                    $("<span>").appendTo(label).text(this);
                    $("<a>").appendTo(label).addClass("remove").text("X").click(function () {
                        $("#Tags").val($("#Tags").val().replace("," + tag, ""));
                        $(this).parent().remove();
                    });
                }
            });
            $("#Tags").siblings("a:first").click(function () {
                $(this).siblings("input[type='text']").toggle().focus();
                $(this).nextAll("a").toggle();
                $(this).toggle();
            });
            $("#Tags").siblings("a:last").click(function () {
                $(this).siblings("input[type='text']").toggle();
                $(this).prevAll("a").toggle();
                $(this).toggle();
            });

            $("#Tags").siblings("a:eq(1)").click(function () {
                if ($("#Tags").prevAll("label").length > 3) {
                    alert("最多只能定义4个标签");
                    return;
                }
                var tag = $.trim($(this).siblings("input[type='text']").val());
                if (tag.length > 0) {
                    $(this).siblings("input[type='text']").toggle();
                    $(this).siblings("a").toggle();
                    $(this).toggle();
                    $("#Tags").val($("#Tags").val() + "," + tag);
                    $(this).siblings("input[type='text']").val("");
                    $("#Tags").before("<label class='li_label'>");
                    var label = $("#Tags").prev("label");
                    $("<span>").appendTo(label).text(tag);
                    $("<a>").appendTo(label).addClass("remove").text("X").click(function () {
                        $("#Tags").val($("#Tags").val().replace("," + tag, ""));
                        $(this).parent().remove();
                    });
                    return;
                }
                $(this).siblings("input[type='text']").focus();
                alert("请输入标签名");
            });

            $("#Content").xheditor({ "upImgUrl": "../../Handler/UploadEditorFileHandler.ashx", html5Upload: false });
            $(".required").siblings("input[id!='xhe0_fixffcursor'],textarea").blur(function () {
                if ($.trim($(this).val()).length == 0) {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });

            $("#CoverPic").siblings("input[type='file']").change(function () {
                handleFiles("InformationPic", this, $("#CoverPic"), $(this).siblings("label").children("a"), true, 530, 400);
            });

            var postFunc = function (e) {
                $(".required").not(":hidden").siblings("input,textarea").blur();
                if ($(".null").length > 0) {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }
                $(e.target).off().text("数据提交中...");
                var data = { "Title": escape($.trim($("#Title").val())), "Tags": escape($.trim($("#Tags").val())), "Content": escape($.trim($("#Content").val())), "CoverPic": escape($.trim($("#CoverPic").val())), "ID": "<%=info.ID%>","State":0 };
                $.post("../../Handler/UpdateInformationHandler.ashx", data, function (res) {
                    var json = JSON.parse(res);
                    if (json.Result) {
                        alert("新闻修改成功！");
                        location.href = "Default.aspx";
                        return;
                    }
                    $(e.target).off().click(postFunc).text("保存");
                    alert(json.Message);
                });
            };

            $("#submitBtn").off().click(postFunc);

            /*
            *文件上传
            *path:文件存储路径
            *obj:文件宿主
            *hostObj:接收文件数据
            *process:文件上传进度显示
            *isImg:是否为图片上传
            */
            function handleFiles(path, obj, hostObj, process, isImg, wi, hi) {
                var files = obj.files;
                var desobj = $(hostObj);
                desobj.val("");
                $(process).parent().show();
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
                xhr.open("post", "../../Handler/UploadFileHandler.ashx");
                xhr.send(fd);
            }
        });
    </script>
</asp:Content>

