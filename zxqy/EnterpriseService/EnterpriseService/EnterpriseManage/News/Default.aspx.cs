using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_News_Default : System.Web.UI.Page
{
    protected enum StateTxt {
        审核未通过=-1,
        待审核=0,
        发布中=1,
        内部推荐 =2,
        平台推荐=3
    }
    protected enum StateDes {
        新闻审核没有通过=-1,
        等待平台工作人员审核=0,
        新闻已经发布=1,
        企业内部推荐新闻 =2,
        该新闻已经被平台推荐=3
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int ipage = 1, pagecount = 0, recordcount = 0;
        if (!string.IsNullOrEmpty(Request.QueryString["PageNo"]))
            ipage = int.Parse(Request.QueryString["PageNo"]);
        rpList.DataSource = BLL.BLL<Model.Information>.Creator("pager").Parameter("ID,Title,PostTime,State", string.Format(" AND EnterpriseID={0}", ((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId), " ORDER BY State, ID DESC", ipage, 10, ref pagecount, ref recordcount);
        rpList.DataBind();

        pager.PageCount = pagecount;
        pager.PageItemCount = 10;
    }
}