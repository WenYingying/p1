<%@ WebHandler Language="C#" Class="PostInformationHandler" %>

using System;
using System.Web;

public class PostInformationHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["Title"]) || string.IsNullOrEmpty(req.Form["Type"]) || string.IsNullOrEmpty(req.Form["Content"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Information _obj = new Model.Information();
            _obj.Title = server.UrlDecode(req.Form["Title"]).Trim();
            _obj.Type = server.UrlDecode(req.Form["Type"]).Trim();
            _obj.Tags = server.UrlDecode(req.Form["Tags"]).Trim();
            _obj.Content = server.UrlDecode(req.Form["Content"]).Trim();
            _obj.CoverPic = server.UrlDecode(req.Form["CoverPic"]).Trim();
            if (!string.IsNullOrEmpty(req.Form["UserId"]))
                _obj.UserId = Int64.Parse(req.Form["UserId"]);
            if (!string.IsNullOrEmpty(req.Form["AdminId"]))
                _obj.AdminId = Int32.Parse(req.Form["AdminId"]);
            if (!string.IsNullOrEmpty(req.Form["EnterpriseId"]))
                _obj.EnterpriseId = Int64.Parse(req.Form["EnterpriseId"]);
            if (!string.IsNullOrEmpty(req.Form["State"]))
                _obj.State = Int32.Parse(req.Form["State"]);
            if (BLL.BLL<Model.Information>.Creator("insert").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"发布成功!\"}");
                return;
            }
            Common.GetInstance.JsonErrorMessage("未知错误");
        }
        catch (Exception ex)
        {
            Common.GetInstance.JsonErrorMessage(ex.Message);

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}