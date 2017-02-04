<%@ WebHandler Language="C#" Class="PostBannerHandler" %>

using System;
using System.Web;

public class PostBannerHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["FileName"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Banner _obj = new Model.Banner();
            _obj.FileName = req.Form["FileName"].Trim();
            _obj.AdminId = int.Parse(req.Cookies["Admin"]["ID"]);

            if (BLL.BLL<Model.Banner>.Creator("insert").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"添加成功!\"}");
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