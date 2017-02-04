using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Admin_Edit : System.Web.UI.Page
{
    protected Model.Admin admin = new Model.Admin();
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Admin a in BLL.BLL<Model.Admin>.Creator("select").Parameter("*", string.Format(" AND ID={0}", int.Parse(Request.QueryString["ID"]))))
            admin = a;
        admin.Password = EncryptUtil.DesDecodeString(admin.Password.Trim(), System.Configuration.ConfigurationManager.AppSettings["DES_Key"]);

    }
}