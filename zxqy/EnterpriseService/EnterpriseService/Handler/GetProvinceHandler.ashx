<%@ WebHandler Language="C#" Class="GetProvinceHandler" %>

using System;
using System.Web;

public class GetProvinceHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;

        System.Text.StringBuilder select_search = new System.Text.StringBuilder(), sb = new System.Text.StringBuilder();
        if (!string.IsNullOrEmpty(req.Form["ID"]))
        {
            select_search.AppendFormat(" AND ID={0}", int.Parse(req.Form["ID"]));
        }
        select_search.Append(" ORDER BY Name");
        System.Collections.Generic.List<Model.Province> list = BLL.BLL<Model.Province>.Creator("select").Parameter("ID,Name,PinYin", select_search.ToString());
        if (list.Count > 0)
        {
            sb.Append("{\"Result\":true,\"Message\":\"获取成功\",\"Data\":[");
            foreach (Model.Province obj in list)
            {
                sb.Append("{");
                sb.AppendFormat("\"ID\":{0},", obj.ID);
                sb.AppendFormat("\"Name\":\"{0}\",", obj.Name.Trim());
                sb.AppendFormat("\"PinYin\":\"{0}\"", string.IsNullOrEmpty(obj.PinYin)?string.Empty:obj.PinYin.Trim());
                sb.Append("},");
            }
            if (sb[sb.Length - 1] == ',')
                sb.Remove(sb.Length - 1, 1);
            sb.Append("]}");
            res.Write(sb.ToString());
            return;
        }
        Common.GetInstance.JsonErrorMessage("无省份数据");

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}