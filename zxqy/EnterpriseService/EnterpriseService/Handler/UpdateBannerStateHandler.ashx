﻿<%@ WebHandler Language="C#" Class="UpdateBannerHandler" %>

using System;
using System.Web;

public class UpdateBannerHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["State"])||string.IsNullOrEmpty(req.Form["ID"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }

            Model.Banner _obj = new Model.Banner();
            _obj.ID = Int32.Parse(req.Form["ID"]);
            _obj.State = Int32.Parse(req.Form["State"]);

            if (BLL.BLL<Model.Banner>.Creator("update").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"修改成功!\"}");
                return;
            }
            Common.GetInstance.JsonErrorMessage("未知错误");
        }
        catch (Exception ex)
        {
            Common.GetInstance.JsonErrorMessage(ex.Message);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}