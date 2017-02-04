using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Hr_Default : System.Web.UI.Page
{
    protected enum StateTxt
    {
        停止招聘 = 0,
        招聘中 = 1,
        热门职位 = 2
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int ipage = 1, pagecount = 0, recordcount = 0;
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            ipage = int.Parse(Request.QueryString["PageNo"]);
        rpList.DataSource = BLL.BLL<Model.Hr>.Creator("pager").Parameter("ID,PositionName,Depart,LastUpdateTime,PostTime,State", string.Format(" AND EnterpriseID={0}", ((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId), " ORDER BY LastUpdateTime,State, ID DESC", ipage, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;

    }
}