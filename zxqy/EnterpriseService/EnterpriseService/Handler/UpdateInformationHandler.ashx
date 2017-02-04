<%@ WebHandler Language="C#" Class="UpdateInformationHandler" %>

using System;
using System.Web;

public class UpdateInformationHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["Title"]) || string.IsNullOrEmpty(req.Form["Content"]) || string.IsNullOrEmpty(req.Form["ID"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Information _obj = new Model.Information();
            _obj.Title = server.UrlDecode(req.Form["Title"]).Trim();
            _obj.Tags = server.UrlDecode(req.Form["Tags"]).Trim();
            _obj.Content = server.UrlDecode(req.Form["Content"]).Trim();
            _obj.CoverPic = server.UrlDecode(req.Form["CoverPic"]).Trim();
            _obj.ID = Int64.Parse(req.Form["ID"]);
            _obj.State = int.Parse(req.Form["State"]);

            if (BLL.BLL<Model.Information>.Creator("update").Parameter(_obj))
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