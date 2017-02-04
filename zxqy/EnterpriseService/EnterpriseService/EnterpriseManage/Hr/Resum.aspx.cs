using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Hr_Resum : System.Web.UI.Page
{
    protected enum StateTxt
    {
        面试失败 = -1,
        未处理 = 0,
        面试通过 = 1
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int ipage = 1, pagecount = 0, recordcount = 0;
        string select_search = string.Format(" AND EnterpriseID={0}", ((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId);
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            ipage = int.Parse(Request.QueryString["PageNo"]);
        if (!string.IsNullOrEmpty(Request.QueryString["HrId"]))
            select_search = string.Format(" AND HrId={0}", Int64.Parse(Request.QueryString["HrId"]));
        rpList.DataSource = BLL.BLL<Model.Resum>.Creator("pager").Parameter("*", select_search, " ORDER BY ID DESC,State DESC", ipage, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;

    }
}