using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Hr_Default : System.Web.UI.Page
{
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
        select_search = string.Format("{0}  AND State>0 ", select_search);

        rpList.DataSource = BLL.BLL<Model.Hr>.Creator("pager").Parameter("ID,PositionName,Salary,PostTime,Degree,Major,Welfare,LastUpdateTime,LogoPic,CompanyName", select_search, " ORDER BY State DESC, ID DESC", pageno, 6, ref pagecount, ref recordcount);
        rpList.ItemDataBound += RpList_ItemDataBound;
        rpList.DataBind();

        pager.PageCount = pagecount;

    }

    private void RpList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal li = (Literal)e.Item.FindControl("liWelFare");
        Model.Hr hr = (Model.Hr)e.Item.DataItem;
        foreach (string s in hr.Welfare.Split(','))
        {
            if (s.Length > 0)
                li.Text += string.Format("<span>{0}</span>", s);
        }
    }
}