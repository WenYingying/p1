<%@ WebHandler Language="C#" Class="GetCountyHandler" %>

using System;
using System.Web;

public class GetCountyHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;

        System.Text.StringBuilder select_search = new System.Text.StringBuilder(), sb = new System.Text.StringBuilder();
        if (!string.IsNullOrEmpty(req.Form["ID"]))
        {
            select_search.AppendFormat(" AND ID={0}", int.Parse(req.Form["ID"]));
        }
        if (!string.IsNullOrEmpty(req.Form["ProvinceID"]))
        {
            select_search.AppendFormat(" AND ProvinceID={0}", int.Parse(req.Form["ProvinceID"]));
        }
        if (!string.IsNullOrEmpty(req.Form["CityID"]))
        {
            select_search.AppendFormat(" AND CityID={0}", int.Parse(req.Form["CityID"]));
        }
        select_search.Append(" ORDER BY Name");
        System.Collections.Generic.List<Model.County> list = BLL.BLL<Model.County>.Creator("select").Parameter("ID,Name,ProvinceID,CityID,PinYin", select_search.ToString());
        if (list.Count > 0)
        {
            sb.Append("{\"Result\":true,\"Message\":\"获取成功\",\"Data\":[");
            foreach (Model.County obj in list)
            {
                sb.Append("{");
                sb.AppendFormat("\"ID\":{0},", obj.ID);
                sb.AppendFormat("\"Name\":\"{0}\",", obj.Name.Trim());
                sb.AppendFormat("\"ProvinceID\":{0},", obj.ProvinceID);
                sb.AppendFormat("\"CityID\":{0},", obj.CityID);
                sb.AppendFormat("\"PinYin\":\"{0}\"", string.IsNullOrEmpty(obj.PinYin)?string.Empty:obj.PinYin.Trim());
                sb.Append("},");
            }
            if (sb[sb.Length - 1] == ',')
                sb.Remove(sb.Length - 1, 1);
            sb.Append("]}");
            res.Write(sb.ToString());
            return;
        }
        Common.GetInstance.JsonErrorMessage("无城市数据");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}