using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Conference_Default : System.Web.UI.Page
{
    protected enum StateTxt
    {
        预约失败 = -1,
        预约审核中 = 0,
        预约成功 = 1
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        rpList.DataSource = BLL.BLL<Model.OrderConferenceRoom>.Creator("select").Parameter("*", string.Format(" AND EnterpriseId={0}", ((Master_SubMaster_SubEnterpriseManageMasterPage)this.Master).user.EnterpriseId));
        rpList.DataBind();
    }
}