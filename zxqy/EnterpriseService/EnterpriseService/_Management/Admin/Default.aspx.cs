﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Management_Admin_Default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (object.Equals(null, Request.Cookies["Admin"]))
        {
            Response.Redirect("../Login.aspx", true);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        rpList.DataSource = BLL.BLL<Model.Admin>.Creator("select").Parameter("ID,LoginName,Name,Mobile,LastLoginTime,LastLoginIp", " AND LoginName!='admin' ORDER BY ID ");
        rpList.DataBind();
    }
}