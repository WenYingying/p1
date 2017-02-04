<%@ WebHandler Language="C#" Class="PostFinancingHandler" %>

using System;
using System.Web;

public class PostFinancingHandler : IHttpHandler
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
            if (string.IsNullOrEmpty(req.Form["Stage"]) || string.IsNullOrEmpty(req.Form["Money"]) || string.IsNullOrEmpty(req.Form["EnterpriseId"]) || string.IsNullOrEmpty(req.Form["Detail"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Financing _obj = new Model.Financing();
            _obj.Detail = server.UrlDecode(req.Form["Detail"]).Trim();
            _obj.EnterpriseId = Int64.Parse(req.Form["EnterpriseId"]);
            _obj.Stage = server.UrlDecode(req.Form["Stage"]);
            _obj.Mobile = server.UrlDecode(req.Form["Mobile"]);
            _obj.Money = int.Parse(req.Form["Money"]);
            _obj.Profit = server.UrlDecode(req.Form["Profit"]);
            _obj.Stock = server.UrlDecode(req.Form["Stock"]);

            if (!string.IsNullOrEmpty(req.Form["UserId"]))
                _obj.UserId = int.Parse(req.Form["UserId"]);
            if (!string.IsNullOrEmpty(req.Form["State"]))
                _obj.State = int.Parse(req.Form["State"]);
            if (BLL.BLL<Model.Financing>.Creator("insert").Parameter(_obj))
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