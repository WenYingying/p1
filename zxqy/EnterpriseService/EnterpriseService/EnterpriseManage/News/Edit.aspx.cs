using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnterpriseManage_News_Edit : System.Web.UI.Page
{
    protected Model.Information info = new Model.Information();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Information i in BLL.BLL<Model.Information>.Creator("select").Parameter("ID,Title,Tags,CoverPic,Content", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
        {
            info = i;
        }
    }
}