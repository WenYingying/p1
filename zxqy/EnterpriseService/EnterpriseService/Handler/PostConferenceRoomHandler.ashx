<%@ WebHandler Language="C#" Class="PostConferenceRoomHandler" %>

using System;
using System.Web;

public class PostConferenceRoomHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["Name"]) || string.IsNullOrEmpty(req.Form["Addr"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            Model.ConferenceRoom room = new Model.ConferenceRoom();
            room.Name = server.UrlDecode(req.Form["Name"]).Trim();
            room.Addr = server.UrlDecode(req.Form["Addr"]).Trim();
            if (!string.IsNullOrEmpty(req.Form["MarkUp"]))
                room.MarkUp = server.UrlDecode(req.Form["MarkUp"]).Trim();
            if (BLL.BLL<Model.ConferenceRoom>.Creator("insert").Parameter(room))
            {
                res.Write("{\"Result\":true,\"Message\":\"添加成功\"}");
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