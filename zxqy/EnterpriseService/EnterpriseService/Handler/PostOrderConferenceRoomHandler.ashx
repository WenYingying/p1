<%@ WebHandler Language="C#" Class="PostOrderConferenceRoomHandler" %>

using System;
using System.Web;

public class PostOrderConferenceRoomHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["RoomId"]) || string.IsNullOrEmpty(req.Form["UserId"]) || string.IsNullOrEmpty(req.Form["EnterpriseId"]) || string.IsNullOrEmpty(req.Form["StartTime"]) || string.IsNullOrEmpty(req.Form["EndTime"]))
            {
                Common.GetInstance.JsonErrorMessage("参数错误");
                return;
            }
            System.Collections.Generic.List<Model.OrderConferenceRoom> list = BLL.BLL<Model.OrderConferenceRoom>.Creator("select").Parameter("MIN(StartTime) AS StartTime,MAX(EndTime) AS EndTime", string.Format(" AND State>-1 AND DATEDIFF(hh,EndTime,'{0}')<0  AND DATEDIFF(hh,StartTime,'{1}')>0 AND RoomId={2}", req.Form["StartTime"], req.Form["EndTime"], Int32.Parse(req.Form["RoomId"])));
            if (list.Count > 0 && (list[0].StartTime != null || list[0].EndTime != null))
            {
                Common.GetInstance.JsonErrorMessage(string.Format("当前会议室在{0}到{1}时段已经被占用，请另择时段预约", Convert.ToDateTime(list[0].StartTime).ToString("yyyy年MM月dd日HH点mm分"), Convert.ToDateTime(list[0].EndTime).ToString("yyyy年MM月dd日HH点mm分")));
                return;
            }
            Model.OrderConferenceRoom _obj = new Model.OrderConferenceRoom();
            _obj.RoomId = int.Parse(req.Form["RoomId"]);
            _obj.UserId = Int64.Parse(req.Form["UserId"]);
            _obj.EnterpriseId = Int64.Parse(req.Form["EnterpriseId"]);
            _obj.StartTime = req.Form["StartTime"];
            _obj.EndTime = req.Form["EndTime"];
            if (!string.IsNullOrEmpty(req.Form["MarkUp"]))
                _obj.MarkUp = server.UrlDecode(req.Form["MarkUp"]).Trim();
            if (BLL.BLL<Model.OrderConferenceRoom>.Creator("insert").Parameter(_obj))
            {
                res.Write("{\"Result\":true,\"Message\":\"申请成功\"}");
                return;
            }
            Common.GetInstance.JsonErrorMessage("未知错误");
        }
        catch(Exception ex)
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