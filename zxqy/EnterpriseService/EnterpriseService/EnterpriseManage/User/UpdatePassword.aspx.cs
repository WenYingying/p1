using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_User_UpdatePassword : System.Web.UI.Page
{
    protected Model.EnterpriseUser user = new Model.EnterpriseUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        user = ((Master_SubMaster_SubEnterpriseManageMasterPage)this.Master).user;
    }
}