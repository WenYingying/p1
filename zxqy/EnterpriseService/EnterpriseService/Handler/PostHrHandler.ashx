<%@ WebHandler Language="C#" Class="PostHrHandler" %>

using System;
using System.Web;

public class PostHrHandler : IHttpHandler
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
            if (string.IsNullOrEmpty(req.Form["PositionName"]) || string.IsNullOrEmpty(req.Form["Detail"]) || string.IsNullOrEmpty(req.Form["EnterpriseId"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Hr _obj = new Model.Hr();
            _obj.PositionName = server.UrlDecode(req.Form["PositionName"]).Trim();
            _obj.Depart = server.UrlDecode(req.Form["Depart"]).Trim();
            _obj.Degree = server.UrlDecode(req.Form["Degree"]).Trim();
            _obj.Trade = server.UrlDecode(req.Form["Trade"]).Trim();
            _obj.Salary = server.UrlDecode(req.Form["Salary"]).Trim();
            _obj.Major = server.UrlDecode(req.Form["Major"]).Trim();
            _obj.Welfare = server.UrlDecode(req.Form["Welfare"]).Trim();
            _obj.Detail = server.UrlDecode(req.Form["Detail"]).Trim();
            _obj.EnterpriseId = Int64.Parse(req.Form["EnterpriseId"]);
            if (!string.IsNullOrEmpty(req.Form["UserId"]))
                _obj.UserId = Int64.Parse(req.Form["UserId"]);
            _obj.State = 1;
            if (BLL.BLL<Model.Hr>.Creator("insert").Parameter(_obj))
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