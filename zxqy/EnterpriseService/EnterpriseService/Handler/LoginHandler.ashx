<%@ WebHandler Language="C#" Class="LoginHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Text;

public class LoginHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["Mobile"])||string.IsNullOrEmpty(req.Form["Password"]))
            {
                Common.GetInstance.JsonErrorMessage("请输入用户名或密码");
                return;
            }
            StringBuilder select_search = new StringBuilder();
            select_search.AppendFormat(" AND Mobile='{0}' AND Password='{1}'", req.Form["Mobile"].Trim(),EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]));
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            List<Model.EnterpriseUser> list = BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter(@"[ID],[EnterpriseId],[Mobile],[Name],[Permission],[Post],[LastLoginIp],[LastLoginTime],[CreateTime],EnterpriseState", select_search.ToString());
            if (list.Count > 0)
            {
                string _userIP;
                if (req.ServerVariables["HTTP_VIA"] == null)//未使用代理
                {
                    _userIP = req.UserHostAddress;
                }
                else//使用代理服务器
                {
                    _userIP = req.ServerVariables["HTTP_X_FORWARDED_FOR"];
                }
                //更新登录时间
                Model.EnterpriseUser u = new Model.EnterpriseUser();
                u.ID = list[0].ID;
                u.LastLoginIp = _userIP;
                BLL.BLL<Model.EnterpriseUser>.Creator("UpdateLastLogin").Parameter(u);
                sb.Append("{\"Result\":true,\"Message\":\"获取成功!\",\"Data\":");
                sb.Append("{");
                sb.AppendFormat("\"ID\":\"{0}\",", list[0].ID);
                sb.AppendFormat("\"EnterpriseID\":\"{0}\",", list[0].EnterpriseId);
                sb.AppendFormat("\"Mobile\":\"{0}\",",list[0].Mobile);
                sb.AppendFormat("\"Name\":\"{0}\",", string.IsNullOrEmpty(list[0].Name) ? string.Empty : list[0].Name.Trim());
                sb.AppendFormat("\"Post\":\"{0}\",", string.IsNullOrEmpty(list[0].Post) ? string.Empty : list[0].Post.Trim());
                //sb.AppendFormat("\"Permission\":\"{0}\",", string.IsNullOrEmpty(list[0].Permission) ? string.Empty : list[0].Permission.Trim());
                sb.AppendFormat("\"LastLoginTime\":\"{0}\",", string.IsNullOrEmpty(list[0].LastLoginTime) ? string.Empty : list[0].LastLoginTime.Trim());
                sb.AppendFormat("\"LastLoginIp\":\"{0}\",", string.IsNullOrEmpty(list[0].LastLoginIp) ? string.Empty : list[0].LastLoginIp.Trim());
                sb.AppendFormat("\"EnterpriseState\":\"{0}\",",list[0].EnterpriseState);
                sb.AppendFormat("\"CompanyName\":\"{0}\",", string.IsNullOrEmpty(list[0].CompanyName) ? string.Empty : list[0].CompanyName.Trim());
                sb.AppendFormat("\"CreateTime\":\"{0}\"", string.IsNullOrEmpty(list[0].CreateTime) ? string.Empty : list[0].CreateTime.Trim());
                sb.Append("}}");
                HttpCookie cookie = new HttpCookie("User");
                cookie.Values.Add("ID", list[0].ID.ToString());
                cookie.Values.Add("EnterpriseID", list[0].EnterpriseId.ToString());
                cookie.Values.Add("Mobile",list[0].Mobile);
                cookie.Values.Add("Name", string.IsNullOrEmpty(list[0].Name) ? string.Empty : server.UrlEncode(list[0].Name.Trim()));
                cookie.Values.Add("Post", string.IsNullOrEmpty(list[0].Post) ? string.Empty : server.UrlEncode(list[0].Post.Trim()));
                cookie.Values.Add("Permission", string.IsNullOrEmpty(list[0].Permission) ? string.Empty : list[0].Permission.Trim());
                cookie.Values.Add("LastLoginTime", string.IsNullOrEmpty(list[0].LastLoginTime) ? string.Empty : list[0].LastLoginTime.Trim());
                cookie.Values.Add("LastLoginIp", string.IsNullOrEmpty(list[0].LastLoginIp) ? string.Empty : list[0].LastLoginIp.Trim());
                cookie.Values.Add("EnterpriseState", list[0].EnterpriseState.ToString());
                cookie.Values.Add("CompanyName", string.IsNullOrEmpty(list[0].CompanyName) ? string.Empty : server.UrlEncode(list[0].CompanyName.Trim()));
                cookie.Values.Add("CreateTime", string.IsNullOrEmpty(list[0].CreateTime) ? string.Empty : list[0].CreateTime.Trim());
                cookie.Expires = DateTime.Now.AddMinutes(3600);
                res.Cookies.Add(cookie);
                res.Write(sb.ToString());
            }
            else
            {
                Common.GetInstance.JsonErrorMessage("用户名或密码错误");
                return;
            }
        }
        catch (Exception ex)
        {
            Common.GetInstance.JsonErrorMessage(ex.Message);
            return;
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}