using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_User_Edit : System.Web.UI.Page
{
    protected Model.EnterpriseUser user = new Model.EnterpriseUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.EnterpriseUser u in BLL.BLL<Model.EnterpriseUser>.Creator("select").Parameter("*", string.Format(" AND ID={0}", int.Parse(Request.QueryString["ID"]))))
            user = u;
        user.Password = EncryptUtil.DesDecodeString(user.Password.Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]).Trim();
    }
}