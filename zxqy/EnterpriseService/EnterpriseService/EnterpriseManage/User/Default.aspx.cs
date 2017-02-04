using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_User_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rpList.DataSource = BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter("*", string.Format(" AND EnterpriseId={0}", ((Master_SubMaster_SubEnterpriseManageMasterPage)(this.Master)).user.EnterpriseId));
        rpList.DataBind();
    }
}