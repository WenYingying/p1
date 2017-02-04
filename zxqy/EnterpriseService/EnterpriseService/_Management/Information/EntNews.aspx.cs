using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Information_EntNews : System.Web.UI.Page
{
    protected enum StateTxt {
        审核未通过=-1,
        待审核=0,
        发布中=1,
        企业推荐 =2,
        平台推荐=3
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
        if (!string.IsNullOrEmpty(Request.QueryString["State"]) && int.Parse(Request.QueryString["State"]) != 1)
            select_search = string.Format(" AND State={0}", int.Parse(Request.QueryString["State"]));
        else if (!string.IsNullOrEmpty(Request.QueryString["State"]) && int.Parse(Request.QueryString["State"]) ==1)
            select_search = string.Format(" AND State>0");
        if (!string.IsNullOrEmpty(Request.QueryString["Key"]))
            select_search = string.Format("{0} AND CompanyName LIKE '%{1}%'", select_search, Server.UrlDecode(Request.QueryString["Key"].Trim()));

        rpList.DataSource = BLL.BLL<Model.Information>.Creator("pager").Parameter("ID,Title,PostTime,State,CompanyName,Type", string.Format(" AND (EnterpriseId IS NOT NULL OR LEN(EnterpriseId)>0) {0} ",select_search), " ORDER BY State DESC, ID DESC", pageno, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;

    }
}