using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Hr_Default : System.Web.UI.Page
{
    protected enum StateTxt
    {
        停止招聘 = 0,
        招聘中 = 1,
        热门职位 = 2
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int recordcount = 0;
        int pagecount = 0;
        int pageno = 1;
        string select_search = string.Empty;
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            pageno = int.Parse(Request.QueryString["PageNo"]);
        if (!string.IsNullOrEmpty(Request.QueryString["Keyword"]))
            select_search = string.Format(" AND (CompanyName LIKE '%{0}%' OR PositionName LIKE '%{0}%')", Server.UrlDecode(Request.QueryString["KeyWord"]).Trim());
        if (!string.IsNullOrEmpty(Request.QueryString["EnterpriseId"]))
            select_search = string.Format("{0} AND EnterpriseId={1}", select_search, Int64.Parse(Request.QueryString["EnterpriseId"]));
        if (!string.IsNullOrEmpty(Request.QueryString["Key"]))
            select_search = string.Format("{0} AND CompanyName LIKE '%{1}%'", select_search, Server.UrlDecode(Request.QueryString["Key"].Trim()));
        rpList.DataSource = BLL.BLL<Model.Hr>.Creator("pager").Parameter("ID,PositionName,Salary,PostTime,Degree,Major,State,CompanyName", select_search, " ORDER BY ID DESC", pageno, 6, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;


    }
}