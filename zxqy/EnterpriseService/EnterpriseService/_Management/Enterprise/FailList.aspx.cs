using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Enterprise_FailList : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string select_search = string.Format(" AND State<0");
        int pageno = 1;
        int pagecount = 0;
        int recordcount = 0;
        pageno = !string.IsNullOrEmpty(Request.QueryString["PageNo"]) ? int.Parse(Request.QueryString["PageNo"]) : pageno;
        if (!string.IsNullOrEmpty(Request.QueryString["Key"]))
            select_search = string.Format("{0} AND (CompanyName LIKE '%{1}%' OR ProjectName LIKE '%{1}%')", select_search, Server.UrlDecode(Request.QueryString["Key"].Trim()));

        rpList.DataSource = BLL.BLL<Model.Enterprise>.Creator("pager").Parameter("*", select_search, " ORDER BY [LastModifiedTime] DESC", pageno, 7, ref pagecount, ref recordcount);
        rpList.ItemDataBound += RpList_ItemDataBound;
        rpList.DataBind();

        pager.PageCount = pagecount;
    }

    private void RpList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        foreach (Model.EnterpriseUser u in BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter("TOP 1 Name,Mobile", string.Format(" AND EnterpriseId={0} AND Post='申请人' ORDER BY ID", ((Model.Enterprise)e.Item.DataItem).ID)))
        {
            ((Literal)e.Item.FindControl("liName")).Text = u.Name.Trim();
            ((Literal)e.Item.FindControl("liMobile")).Text = u.Mobile.Trim();
        }
    }
}