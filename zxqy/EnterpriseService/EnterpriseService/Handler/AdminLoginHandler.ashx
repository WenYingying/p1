<%@ WebHandler Language="C#" Class="AdminLoginHandler" %>

using System;
using System.Web;

public class AdminLoginHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        HttpRequest req = context.Request;
        HttpResponse res = context.Response;
        HttpServerUtility server = context.Server;
        try
        {
            if (string.IsNullOrEmpty(req.Form["LoginName"]) || string.IsNullOrEmpty(req.Form["Password"]))
            {
                Common.GetInstance.JsonErrorMessage("请输入登录名或密码");
                return;
            }
            System.Text.StringBuilder select_search = new System.Text.StringBuilder();
            select_search.AppendFormat(" AND LoginName='{0}' AND Password='{1}'", req.Form["LoginName"].Trim(), EncryptUtil.DesEncode(req.Form["Password"].Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]));
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            System.Collections.Generic.List<Model.Admin> list = BLL.BLL<Model.Admin>.Creator("select").Parameter(@"*", select_search.ToString());
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
                Model.Admin u = new Model.Admin();
                u.ID = list[0].ID;
                u.LastLoginIp = _userIP;
                u.LastLoginTime = DateTime.Now.ToString();
                BLL.BLL<Model.Admin>.Creator("update").Parameter(u);
                sb.Append("{\"Result\":true,\"Message\":\"获取成功!\",\"Data\":");
                sb.Append("{");
                sb.AppendFormat("\"ID\":\"{0}\",", list[0].ID);
                sb.AppendFormat("\"LoginName\":\"{0}\",", list[0].LoginName);
                sb.AppendFormat("\"Mobile\":\"{0}\",", list[0].Mobile);
                sb.AppendFormat("\"Name\":\"{0}\",", string.IsNullOrEmpty(list[0].Name) ? string.Empty : list[0].Name.Trim());
                sb.AppendFormat("\"Email\":\"{0}\",", string.IsNullOrEmpty(list[0].Email) ? string.Empty : list[0].Email.Trim());
                sb.AppendFormat("\"Position\":\"{0}\",", string.IsNullOrEmpty(list[0].Position) ? string.Empty : list[0].Position.Trim());
                sb.AppendFormat("\"LastLoginTime\":\"{0}\",", string.IsNullOrEmpty(list[0].LastLoginTime) ? string.Empty : list[0].LastLoginTime.Trim());
                sb.AppendFormat("\"LastLoginIp\":\"{0}\",", string.IsNullOrEmpty(list[0].LastLoginIp) ? string.Empty : list[0].LastLoginIp.Trim());
                sb.AppendFormat("\"Gender\":\"{0}\",", list[0].Gender);
                sb.AppendFormat("\"PostTime\":\"{0}\"", list[0].PostTime);
                sb.Append("}}");
                HttpCookie cookie = new HttpCookie("Admin");
                cookie.Values.Add("ID", list[0].ID.ToString());
                cookie.Values.Add("LoginName", list[0].LoginName);
                cookie.Values.Add("Mobile", list[0].Mobile);
                cookie.Values.Add("Name", string.IsNullOrEmpty(list[0].Name) ? string.Empty : server.UrlEncode(list[0].Name.Trim()));
                cookie.Values.Add("Email", string.IsNullOrEmpty(list[0].Email) ? string.Empty : list[0].Email.Trim());
                cookie.Values.Add("Position", string.IsNullOrEmpty(list[0].Position) ? string.Empty : server.UrlEncode(list[0].Position.Trim()));
                cookie.Values.Add("LastLoginTime", string.IsNullOrEmpty(list[0].LastLoginTime) ? string.Empty : list[0].LastLoginTime.Trim());
                cookie.Values.Add("LastLoginIp", string.IsNullOrEmpty(list[0].LastLoginIp) ? string.Empty : list[0].LastLoginIp.Trim());
                cookie.Values.Add("Gender", list[0].Gender.ToString());
                cookie.Values.Add("PostTime", list[0].PostTime);
                cookie.Expires = DateTime.Now.AddMinutes(20);
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


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}