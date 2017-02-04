using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_Conference_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rpList.DataSource = BLL.BLL<Model.ConferenceRoom>.Creator("select").Parameter("ID,Name,MarkUp,Addr", string.Empty);
        rpList.DataBind();
    }
}