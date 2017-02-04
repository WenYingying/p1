using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Information_Detail : System.Web.UI.Page
{
    protected Model.Information info = new Model.Information();
    protected void Page_Load(object sender, EventArgs e)
    {
        foreach (Model.Information i in BLL.BLL<Model.Information>.Creator("select").Parameter("*", string.Format(" AND ID={0}", Int64.Parse(Request.QueryString["ID"]))))
            info = i;
        rpList.DataSource = BLL.BLL<Model.Information>.Creator("select").Parameter("TOP 3 ID,Title,Type,PostTime,Content,CoverPic",string.Format(" AND Type='{0}' AND ID!={1} ORDER BY ID DESC",info.Type,info.ID));
        rpList.DataBind();
    }
}