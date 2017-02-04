using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Information_Default : System.Web.UI.Page
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
            select_search = string.Format(" AND Title LIKE '%{0}%'", Server.UrlDecode(Request.QueryString["KeyWord"]).Trim());
        if (!string.IsNullOrEmpty(Request.QueryString["Type"]))
            select_search = string.Format(" AND Type='{0}'", Request.QueryString["Type"]);
        if (!string.IsNullOrEmpty(Request.QueryString["EnterpriseId"]))
            select_search = string.Format("{0} AND EnterpriseId={1}", select_search, Int64.Parse(Request.QueryString["EnterpriseId"]));
        select_search = string.Format("{0}  AND State>0 ", select_search);
        rpList.DataSource = BLL.BLL<Model.Information>.Creator("pager").Parameter("ID,Title,Type,PostTime,Content,CoverPic", select_search, " ORDER BY State DESC, ID DESC", pageno, 7, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;

    }
}