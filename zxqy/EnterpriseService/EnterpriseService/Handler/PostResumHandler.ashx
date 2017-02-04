<%@ WebHandler Language="C#" Class="PostResumHandler" %>

using System;
using System.Web;

public class PostResumHandler : IHttpHandler
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
            if (string.IsNullOrEmpty(req.Form["Name"]) || string.IsNullOrEmpty(req.Form["HrId"]) || string.IsNullOrEmpty(req.Form["BirthDay"]) || string.IsNullOrEmpty(req.Form["Mobile"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.Resum _obj = new Model.Resum();
            _obj.HrId = Int64.Parse(req.Form["HrId"]);
            _obj.Name =server.UrlDecode( req.Form["Name"]).Trim();
            _obj.BirthDay = req.Form["BirthDay"].Trim();
            _obj.Mobile = req.Form["Mobile"].Trim();
            _obj.WorkYears = int.Parse(req.Form["WorkYears"]);
            _obj.Addr = server.UrlDecode(req.Form["Addr"]).Trim();
            _obj.Introduce =server.UrlDecode( req.Form["Introduce"]).Trim();
            _obj.Degree = server.UrlDecode(req.Form["Degree"]).Trim();
            _obj.OfflinePath = req.Form["OfflinePath"].Trim();
            if (BLL.BLL<Model.Resum>.Creator("insert").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"投递简历成功!\"}");
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