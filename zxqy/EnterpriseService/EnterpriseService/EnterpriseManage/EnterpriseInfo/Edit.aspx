<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SubMaster/SubEnterpriseManageMasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="EnterpriseManage_EnterpriseInfo_Edit" %>

<asp:Content ContentPlaceHolderID="phPageTitle" runat="server">企业信息</asp:Content>
<asp:Content ContentPlaceHolderID="phStyle" runat="server">
    <style type="text/css">
        .head .end {
            width: 1.5rem;
        }

        label {
            width: auto !important;
        }

        .right .bottom li > label > img, .right .bottom li > .upload_img > img {
            width: 0.6rem;
            height: 0.6rem;
            border: 1px solid #d4d4d4;
            vertical-align: middle;
        }

        .right .bottom .bottom_corporation, .right .bottom .bottom_product {
            width: 100%;
        }

            .right .bottom .bottom_corporation > span, .right .bottom .bottom_product > span {
                width: 15%;
                margin-right: 0.7%;
            }

            .right .bottom .bottom_corporation > textarea, .right .bottom .bottom_product > textarea {
            }

        .right .bottom li > .btn > input {
            position: absolute;
            right: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 0.35rem;
            filter: alpha(opacity=0);
            cursor: pointer;
        }

        .btn {
            width: 1.2rem;
            height: 0.35rem;
            line-height: 0.35rem;
            border-radius: 0.02rem;
            display: inline-block;
        }

        .bottom_top {
            vertical-align: top;
        }

        .tipshow {
            opacity: 1;
        }

        .tip {
            width: 1.2rem;
            top: 0.2rem;
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

        .bottom_corporation::after {
            margin-left: 0 !important;
        }

        input:disabled {
            color: #000;
            border: 0 !important;
            background-color: transparent !important;
        }

            input:disabled ~ .required {
                display: none;
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
    </style>

</asp:Content>
<asp:Content ContentPlaceHolderID="phContentTitle" runat="server">
    企业信息
</asp:Content>
<asp:Content ContentPlaceHolderID="phTools" runat="server">
    <a href="javascript:history.back(-1)">返回</a>
</asp:Content>
<asp:Content ContentPlaceHolderID="phPageContent" runat="server">
    <div class="bottom">
        <ul>
            <li class="bottom_corporation" title="请输入企业名称,若项目申请,此项可为空">
                <span>企业名称</span>
                <input type="text" name="" id="CompanyName" value="<%=Common.GetInstance.Trim(ent.CompanyName) %>" placeholder="请输入公司名称" />
                <b class="required">*</b>
            </li>
            <li class="bottom_corporation" title="请输入项目名称,若企业申请,此项可为空">
                <span>项目名称</span>
                <input type="text" name="" id="ProjectName" value="<%=Common.GetInstance.Trim(ent.ProjectName) %>" placeholder="请输入项目名称" />
                <b class="required">*</b>
            </li>
            <li title="请输入营业执照上的法人代表">
                <span>法人代表</span>
                <input type="text" name="" id="LegalPerson" value="<%=Common.GetInstance.Trim(ent.LegalPerson) %>" placeholder="请输入法人代表" />
                <b class="required">*</b>
            </li>
            <li title="请输入营业执照上的工商注册时间">
                <span>成立时间</span>
                <input type="date" name="" id="CompanyRegTime" value="<%=Common.GetInstance.Trim(ent.CompanyRegTime).Replace(" 0:00:00", string.Empty).Replace("/", "-") %>" placeholder="请输入成立时间" />
                <b class="required">*</b>
            </li>
            <li title="请输入营业执照上的注册地址">
                <span>公司注册地址</span>
                <input type="text" name="" id="RegisterAddr" value="<%=Common.GetInstance.Trim(ent.RegisterAddr) %>" placeholder="请输入注册固定地址" />
                <b class="required">*</b>
            </li>
            <li title="请输入营业执照上的社会信用代码">
                <span>统一社会信用代码</span>
                <input type="text" name="" id="LicenseCode" value="<%=Common.GetInstance.Trim(ent.LicenseCode) %>" placeholder="请输入社会信用代码" />
                <b class="required">*</b>
            </li>
            <li>
                <span>官网地址</span>
                <input type="text" name="" id="Url" value="<%=Common.GetInstance.Trim(ent.Url) %>" placeholder="请输入官网地址" />
            </li>
            <li>
                <span>联系电话</span>
                <input type="text" name="" id="Tel" value="<%=Common.GetInstance.Trim(ent.Tel) %>" placeholder="请输入注册固定电话" />
            </li>
            <li>
                <span>注册资本</span>
                <input type="text" name="" id="Capital" value="<%=Common.GetInstance.Trim(ent.Capital) %>" placeholder="请输入注册资本" />
                万元
            </li>
            <li style="position: relative;" title="请上传项目(商业)计划书">
                <span>项目企划书</span>
                <label><a href="<%=string.Format("{0}PlantFiles/{1}/{2}/{3}/{4}", ConfigurationManager.AppSettings["FileUrl"], ent.ProjectPlan.Substring(0, 4), ent.ProjectPlan.Substring(4, 2), ent.ProjectPlan.Substring(6, 2), ent.ProjectPlan.Trim()) %>">下载</a></label>
                <input type="hidden" id="ProjectPlan" value="<%=Common.GetInstance.Trim(ent.ProjectPlan) %>" />
                <br />
                <a href="javascript:void(0)" class="btn" style="position: relative; margin-left: 32%;" onclick="$(this).siblings('input[type=file]').click();">重新上传</a>
                <input type="file" name="" id="" accept="application/vnd.ms-powerpoint,application/pdf,application/msword" style="display: none;" />
                <a class="tit" onclick="$(this).siblings('.tip').toggleClass('tipshow');" href="javascript:void(0)">!</a>
                <p class="tip">
                    上传格式支持：PPT、PDF、DOC;
				<b></b>
                </p>
            </li>
            <li title="请上传企业营业执照">
                <span>营业执照</span>
                <label style="position: relative;">
                    <a class="process"></a>
                    <img src="<%=!string.IsNullOrEmpty(ent.LicensePic) && ent.LicensePic.Trim().Length > 0 ? string.Format("{0}LicesencePic/{1}/{2}/{3}/{4}", ConfigurationManager.AppSettings["FileUrl"], ent.LicensePic.Substring(0, 4), ent.LicensePic.Substring(4, 2), ent.LicensePic.Substring(6, 2), ent.LicensePic) : string.Format("{0}LicesencePic/{1}", ConfigurationManager.AppSettings["FileUrl"], "NoPic.png") %>" />
                </label>
                <input type="hidden" id="LicensePic" value="<%=Common.GetInstance.Trim(ent.LicensePic) %>" />
                <input type="file" name="" id="" accept="image/*" style="display: none;" />
                <a href="javascript:void(0)" class="upload_img" onclick="$(this).siblings('input[type=file]').click();">
                    <img src="../../img/no-logo.jpg" />
                </a>
                <%if (ent.State > 1) { %>
                <b class="required">*</b>
                <%} %>
            </li>
            <li>
                <span>公司logo</span>
                <label style="position: relative;">
                    <a class="process"></a>
                    <img src="<%=!string.IsNullOrEmpty(ent.LogoPic)&&ent.LogoPic.Trim().Length>0?string.Format("{0}LogoFiles/{1}/{2}/{3}/{4}",ConfigurationManager.AppSettings["FileUrl"],ent.LogoPic.Substring(0,4),ent.LogoPic.Substring(4,2),ent.LogoPic.Substring(6,2),ent.LogoPic):string.Format("{0}LogoFiles/{1}",ConfigurationManager.AppSettings["FileUrl"],"NoLogo.png") %>" /></label>
                <input type="hidden" id="LogoPic" value="<%=Common.GetInstance.Trim(ent.LogoPic) %>" />
                <input type="file" name="" id="" accept="image/*" style="display: none;" />
                <a href="javascript:void(0)" class="upload_img" onclick="$(this).siblings('input[type=file]').click();">
                    <img src="../../img/no-logo.jpg" />
                </a>
            </li>
            <li class="bottom_corporation">
                <span>公司介绍</span>
                <textarea class="bottom_top" id="CompanyIntr"><%=Common.GetInstance.Trim(ent.CompanyIntr) %></textarea>
            </li>
            <li class="bottom_product">
                <span>项目介绍</span>
                <textarea class="bottom_top" id="ProjectIntr"><%=Common.GetInstance.Trim(ent.ProjectIntr) %></textarea>
            </li>
            <li>
                <span></span>
                <a href="javascript:void(0)" class="btn" id="submitBtn">保存</a>
                <a href="javascript:history.back(-1)" class="btn" style="background-color: #d0d0d0; color: #a40000;">取消保存</a>
            </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="phScript" runat="server">
    <script src="../../js/editor/xheditor-1.2.2.min.js"></script>
    <script src="../../js/editor/zh-cn.js"></script>
    <script type="text/javascript">
        $(function () {

            $("a[data-menu='Ent']").addClass("active");

            $("#CompanyIntr,#ProjectIntr").xheditor({tools:'mini',forcePtag:false});

            if(<%=ent.State%>>0)
            {
                if(<%=ent.State%>>2)
                {
                    if($.trim($("#CompanyName").val()).length>0)
                    {
                        $("#CompanyName").prop("disabled",true);
                    }
                    if($.trim($("#ProjectName").val()).length>0)
                    {
                        $("#ProjectName").prop("disabled",true);
                    }
                    $("#LegalPerson").prop("disabled",true);
                    $("#CompanyRegTime").prop("disabled",true);
                    $("#RegisterAddr").prop("disabled",true);
                    $("#LicenseCode").prop("disabled",true);
                    $("#ProjectPlan,#LicensePic").nextAll().hide();
                }else if(<%=ent.State%><3)
                {
                    if($.trim($("#CompanyName").val()).length>0)
                    {
                        $("#CompanyName").prop("disabled",true);
                    }
                    if($.trim($("#ProjectName").val()).length>0)
                    {
                        $("#ProjectName").prop("disabled",true);
                    }
                    $("#ProjectPlan").nextAll().hide();

                }
            }

            $(".required").siblings("input[type!='file']").blur(function () {
                if ($.trim($(this).val()).length == 0)
                {
                    $(this).parent().addClass("null");
                    return;
                }
                $(this).parent().removeClass("null");
            });


            var postFunc=function (e) {
                $(".required").not(":hidden").siblings("input").blur();
                if($.trim($("#CompanyName").val()).length!=0||$.trim($("#ProjectName").val()).length!=0)
                {
                    $("#CompanyName,#ProjectName").parent().removeClass("null");
                }
                if($(".null").length>0)
                {
                    $(".content").scrollTop($(".content").scrollTop() + $("li:not(:hidden).null:eq(0)").offset().top - 60);
                    return;
                }

                var data = { "CompanyName": escape($.trim($("#CompanyName").val())), "CompanyIntr": escape($.trim($("#CompanyIntr").val())), "LegalPerson": escape($.trim($("#LegalPerson").val())), "RegisterAddr": $.trim($("#RegisterAddr").val()), "LicenseCode": escape($.trim($("#LicenseCode").val())), "ProjectName": escape($.trim($("#ProjectName").val())), "ProjectIntr": escape($.trim($("#ProjectIntr").val())), "ProjectPlan": escape($.trim($("#ProjectPlan").val())),"LicensePic":escape($.trim($("#LicensePic").val())),"LogoPic":escape($.trim($("#LogoPic").val())),"CompanyRegTime":escape($.trim($("#CompanyRegTime").val())),"Url":escape($.trim($("#Url").val())),"Tel":escape($.trim($("#Tel").val())),"Capital":escape($.trim($("#Capital").val())),"ID":<%=ent.ID%> };
                $(e.target).off().text("数据保存中....");
                $.post("../../Handler/UpdateEnterpriseInfoHandler.ashx",data,function(res){
                    var json=JSON.parse(res);
                    if(json.Result)
                    {
                        alert("数据更新成功！");
                         <%if (string.IsNullOrEmpty(Request.QueryString["State"]))
        {%>
                        location.href=document.referrer;
                        <%}%>
                        return;
                    }
                    alert(json.Message);
                    $(e.target).on("click",postFunc).text("保存");
                });
                <%if (!string.IsNullOrEmpty(Request.QueryString["State"]))
        {%>
                $.post("../../Handler/UpdateEnterpriseStateHandler.ashx",{"ID":<%=ent.ID%>,"State":<%=ent.State%>},function(res){

                    var json=JSON.parse(res);
                    if(json.Result)
                    {
                        location.href=document.referrer;
                        return;
                    }
                    alert(json.Message);
                    $(e.target).on("click",postFunc);
                });
                <%}%>
            };

            $("#submitBtn").off().click(postFunc);

            $("#ProjectPlan").siblings("input[type='file']").change(function () {
                handleFiles("PlantFiles", this, $("#ProjectPlan"), $(this).siblings("a.btn"),false);
            });

            $("#LicensePic").siblings("input[type='file']").change(function () {
                handleFiles("LicesencePic", this, $("#LicensePic"), $(this).siblings("label").children("a"),true,626,470);
            });

            $("#LogoPic").siblings("input[type='file']").change(function () {
                handleFiles("LogoFiles", this, $("#LogoPic"), $(this).siblings("label").children("a"),true,223,223);
            });
            /*
            *文件上传
            *path:文件存储路径
            *obj:文件宿主
            *hostObj:接收文件数据
            *process:文件上传进度显示
            *isImg:是否为图片上传
            */
            function handleFiles(path, obj, hostObj, process,isImg,wi,hi) {
                var files = obj.files;
                var desobj = $(hostObj);
                desobj.val("");
                if(isImg){
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
                fd.append("isImg",isImg);
                if(isImg)
                {
                    fd.append("Width",wi);
                    fd.append("Height",hi);
                }

                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        var json = $.parseJSON(xhr.responseText);
                        if (json.Result) {
                            if(!isImg){
                                process.text("上传成功");
                                desobj.siblings("label").text(json.Src);
                            }else
                            {
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
