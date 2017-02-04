using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Finance_Default : System.Web.UI.Page
{
    protected enum StateTxt
    {
        审核失败=-1,
        待审核,
        发布中,
        顶置
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
        string select_search = string.Format(" AND State=0");
        int pageno = 1;
        int pagecount = 0;
        int recordcount = 0;
        pageno = !string.IsNullOrEmpty(Request.QueryString["PageNo"]) ? int.Parse(Request.QueryString["PageNo"]) : pageno;
        if (!string.IsNullOrEmpty(Request.QueryString["State"]) && int.Parse(Request.QueryString["State"]) < 1)
            select_search = string.Format(" AND State={0}", int.Parse(Request.QueryString["State"]));
        else if (!string.IsNullOrEmpty(Request.QueryString["State"]) && int.Parse(Request.QueryString["State"]) >0)
            select_search = string.Format(" AND State>0");
        if (!string.IsNullOrEmpty(Request.QueryString["Key"]))
            select_search = string.Format("{0} AND (CompanyName LIKE '%{1}%' OR ProjectName LIKE '%{1}%')", select_search, Server.UrlDecode(Request.QueryString["Key"].Trim()));

        rpList.DataSource = BLL.BLL<Model.Financing>.Creator("pager").Parameter("*", select_search, " ORDER BY ID DESC", pageno, 7, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
    }
}